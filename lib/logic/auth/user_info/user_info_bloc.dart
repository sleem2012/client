import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/user_info/user_model.dart';
import '../../../data/repository/auth/auth_repo.dart';
import 'user_info_state.dart';
import '../../../packages/cache/locale_storage.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/theme/helper.dart';

class UserInfoBloc extends Cubit<UserInfoState> {
  UserInfoBloc() : super(const UserInfoState.initial());

  static UserInfoBloc of(BuildContext context) {
    return BlocProvider.of<UserInfoBloc>(context);
  }

  UserModel? _userModel;

  UserModel? get user {
    _userModel = KStorage.i.getUserInfo;
    return _userModel;
  }

  getUserInfo() async {
    try {
      emit(const UserInfoState.loading());

      final result = await AuthRepoImpl.i.userInfo(KStorage.i.getFcmToken ?? '');
      result.fold(
        (l) {
          emit(UserInfoState.error(failure: l));
          debugPrint('================= User info (Bloc): Failed => $l ');
        },
        (r) {
          _userModel = r;
          KStorage.i.setToken(_userModel?.data?.token ?? '');
          KStorage.i.setUserInfo(_userModel);
          emit(UserInfoState.success(userModel: _userModel!));
        },
      );
    } catch (e) {
      debugPrint('================= User Info Bloc Ex : $e ');
    }
  }

  Future<UserModel?> getUser() async {
    UserModel? user;
    try {
      final result = await AuthRepoImpl.i.userInfo(KStorage.i.getToken ?? '');
      result.fold(
        (l) {
          KHelper.showSnackBar(KFailure.toError(l));
        },
        (r) {
          _userModel = r;
          user = r;
          KStorage.i.setToken(_userModel?.data?.token ?? '');
          KStorage.i.setUserInfo(_userModel);
        },
      );
      return user;
    } catch (e) {
      return user;
    }
  }
}
