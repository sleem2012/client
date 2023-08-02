import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../models/change_pass/change_pass_model.dart';
import '../../models/register/register_model.dart';
import '../../models/user_info/udate_user_model.dart';
import '../../models/user_info/user_model.dart';
import '../../../di.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../packages/cache/locale_storage.dart';
import '../../../packages/shared/error/failures.dart';

abstract class _AuthRepo {
  Future<Either<KFailure, Unit>> register(RegisterModel registerModel);
  Future<Either<KFailure, UserModel>> login({required String email, required String password});
  Future<Either<KFailure, UserModel>> userInfo(String? fcmToken);
  Future<Either<KFailure, Unit>> logout(String? fcmToken);
  Future<Either<KFailure, String>> verifyToken({required String token, required String email});
  Future<Either<KFailure, Unit>> forgetPassword({required String email});
  Future<Either<KFailure, Unit>> resetPassword({required String password, required String passwordConf});
  Future<Either<KFailure, Unit>> updateUser({required UpdateUserModel model});
  Future<Either<KFailure, Unit>> changePassword(ChangePasswordModel changePasswordModel);
  Future<Either<int?, UserModel>> userForNavOnly();
}

/// abstract class _AuthRepo2 {
///   Future<Either<KFailure, dynamic>> post();
/// }

/// class AuthParams implements _AuthRepo2 {
///    dynamic data = {};
///   AuthParams(dynamic data){
///     this.data = data;
///   }

///   @override
///   Future<Either<KFailure, dynamic>> post() async {
///     Future<Response<dynamic>> func = Di.dioClient.post(data.endPoint, data: data.data);
///     final result = await ApiClientHelper.responseOrFailure(func: func);
///     return result.fold(
///       (l) => left(l),
///       (r) => right(unit),
///     );
///   }
/// }

/// class AuthRegister extends AuthParams {
///   AuthRegister();

/// }

class AuthRepoImpl implements _AuthRepo {
  static AuthRepoImpl? _instance;
  AuthRepoImpl._internal() {
    _instance = this;
  }
  static AuthRepoImpl get i {
    return _instance ?? AuthRepoImpl._internal();
  }

  @override
  Future<Either<KFailure, Unit>> register(RegisterModel registerModel) async {
    Future<Response<dynamic>> func = Di.dioClient.postWithFiles(KEndPoints.register, data: registerModel.toMap());

    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  Future<Either<KFailure, Unit>> forgetPassword({required String email}) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.forget_pass, data: {"email": email});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  Future<Either<KFailure, UserModel>> login({required String email, required String password}) async {
    Future<Response<dynamic>> func = Di.dioClient.post(
      KEndPoints.login,
      data: {
        "email": email,
        "password": password,
        "fcmToken": KStorage.i.getFcmToken,
      },
    );

    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(UserModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, Unit>> logout(String? fcmToken) async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.logout, params: {'fcmToken': fcmToken});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  Future<Either<KFailure, Unit>> resetPassword({required String password, required String passwordConf}) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.reset_pass, data: {"password": password, "password_confirmation": passwordConf});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  Future<Either<KFailure, String>> verifyToken({required String token, String? email}) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.verify_token, data: {"token": token, if (email != null) "email": email});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(r["data"]?["token"] ?? '-1'),
    );
  }

  @override
  Future<Either<KFailure, Unit>> updateUser({required UpdateUserModel model}) async {
    Future<Response<dynamic>> func = Di.dioClient.postWithFiles(
      KEndPoints.update_user,
      data: model.toJson()..addAll({'_method': 'put'}),
    );
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  Future<Either<KFailure, UserModel>> userInfo(String? fcmToken) async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.user_info, params: {'fcmToken': fcmToken});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(UserModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, Unit>> changePassword(ChangePasswordModel changePasswordModel) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.change_pass, data: changePasswordModel.toJson());
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  Future<Either<int?, UserModel>> userForNavOnly() async {
    Response response = await Di.dioClient.get(KEndPoints.user_info);
    if (response.statusCode == 200) {
      return right(UserModel.fromJson(response.data));
    } else {
      return left(response.statusCode);
    }
  }
}

/// abstract class APICalls {
///   post(ApiParams params);
///   get(ApiParams params);
/// }

/// abstract class ApiParams {
///   dynamic data();
///   String endpoint();
/// }

/// class APICallsImpl implements APICalls {
///   @override
///   get(ApiParams params) async {
///     Future<Response<dynamic>> func = Di.dioClient.get(params.endpoint());
///     final result = await ApiClientHelper.responseOrFailure(func: func);
///     return result.fold(
///       (l) => left(l),
///       (r) => right(unit),
///     );
///   }

///   @override
///   post(ApiParams params) async {
///     Future<Response<dynamic>> func = Di.dioClient.post(params.endpoint(), data: params.data);
///     final result = await ApiClientHelper.responseOrFailure(func: func);
///     return result.fold(
///       (l) => left(l),
///       (r) => right(unit),
///     );
///   }
/// }

/// class Register extends APICallsImpl {
///   final APICallsImpl apiCallsImpl;

///   Register(this.apiCallsImpl);

///   /// regiter(ApiParams params) {
///   ///   apiCallsImpl.post(params);
///   /// }
/// }

/// g() {
///   final Register register = Register(APICallsImpl());

///   register.post(RegisterParams());
/// }

/// class RegisterParams implements ApiParams {

///   @override
///   data() {
///    return {"name" : }
///   }

///   @override
///   String endpoint() {
///     // TODO: implement endpoint
///     throw UnimplementedError();
///   }

/// }
