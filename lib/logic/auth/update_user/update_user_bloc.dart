import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/user_info/udate_user_model.dart';
import '../../../data/repository/auth/auth_repo.dart';
import 'update_user_state.dart';
import '../../../packages/cache/locale_storage.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../views/widgets/slugs_drop_down.dart';

class UpdateUserBloc extends Cubit<UpdateUserState> {
  UpdateUserBloc() : super(const UpdateUserState.initial());

  get updateLang async {
    AuthRepoImpl.i.updateUser(model: UpdateUserModel(langId: KStorage.i.getLangId, id: KStorage.i.getUserInfo?.data?.id.toString()));
  }

  static UpdateUserBloc of(BuildContext context) {
    return BlocProvider.of<UpdateUserBloc>(context);
  }

  get blockAccount {
    updateUserModel = updateUserModel?.copyWith(is_blocked: 1);
  }

  final TextEditingController nameCtrl = TextEditingController(text: KStorage.i.getUserInfo?.data?.name);
  final TextEditingController phoneCtrl = TextEditingController(text: KStorage.i.getUserInfo?.data?.mobile);
  final TextEditingController emailCtrl = TextEditingController(text: KStorage.i.getUserInfo?.data?.email);

  String cCode = '';
  UpdateUserModel? updateUserModel = UpdateUserModel(
    birthdate: KStorage.i.getUserInfo?.data?.birthdate,
    gender: KStorage.i.getUserInfo?.data?.gender,
    currencyId: KStorage.i.getcurrencyId,
    langId: KStorage.i.getLangId,
    // id: KStorage.i.getUserInfo?.data?.id.toString(),
  );
  KSlugModel? selectedGender = KSlugModel.of(KStorage.i.getUserInfo?.data?.gender ?? '');

  update() async {
    emit(const UpdateUserState.loading());

    try {
      updateUserModel = updateUserModel?.copyWith(
        name: nameCtrl.text,
        email: emailCtrl.text,
        mobile: phoneCtrl.text,
        gender: selectedGender?.slug,
        image: selectedImg,
        id: KStorage.i.getUserInfo?.data?.id.toString(),
      );

      debugPrint('================= ${updateUserModel?.toJson()} : ');

      final result = await AuthRepoImpl.i.updateUser(model: updateUserModel!);
      result.fold(
        (l) {
          emit(UpdateUserState.error(failure: l));
          debugPrint('================= Login (Bloc): Failed => $l ');
        },
        (r) {
          emit(const UpdateUserState.success());
          debugPrint('================= Login (Bloc): Success => $r ');
        },
      );
    } catch (e) {
      debugPrint('================= Login (Bloc) (catch):  $e');
      emit(const UpdateUserState.error(failure: KFailure.someThingWrongPleaseTryAgain()));
    }
  }

  update_address(int? addressId) async {
    emit(const UpdateUserState.loading());

    try {
      final result = await AuthRepoImpl.i.updateUser(
          model: UpdateUserModel(
        addressId: addressId,
        id: KStorage.i.getUserInfo?.data?.id.toString(),
      ));
      result.fold(
        (l) {
          emit(UpdateUserState.error(failure: l));
          debugPrint('================= Login (Bloc): Failed => $l ');
        },
        (r) {
          emit(const UpdateUserState.success());
          debugPrint('================= Login (Bloc): Success => $r ');
        },
      );
    } catch (e) {
      debugPrint('================= Login (Bloc) (catch):  $e');
      emit(const UpdateUserState.error(failure: KFailure.someThingWrongPleaseTryAgain()));
    }
  }

  selectGender(KSlugModel? selected) {
    selectedGender = selected;
    updateUserModel = updateUserModel?.copyWith(gender: selected?.slug);
    _update;
  }

  File? selectedImg;

  selectImage(File? image) async {
    if (image != null) {
      selectedImg = image;
      updateUserModel = updateUserModel?.copyWith(image: image);
      _update;
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
    );
    updateUserModel = updateUserModel?.copyWith(birthdate: picked.toString().split(' ').first);
    debugPrint('================= ${updateUserModel?.birthdate}');
    _update;
  }

  get _update {
    emit(const UpdateUserState.loading());
    emit(const UpdateUserState.initial());
  }
}
