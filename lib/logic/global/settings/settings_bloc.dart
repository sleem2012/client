import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_client/packages/shared/error/failures.dart';

import '../../../data/models/global/settings/settings_model.dart';
import '../../../data/models/user_info/user_model.dart';
import '../../../data/repository/global/global_repo.dart';
import '../../../packages/cache/locale_storage.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../shared/localization/trans.dart';
import 'settings_state.dart';

class SettingsBloc extends Cubit<SettingsState> {
  SettingsBloc({required this.globalRepoImpl}) : super(const SettingsState.initial());

  static SettingsBloc of(BuildContext context) {
    return BlocProvider.of<SettingsBloc>(context);
  }

  final GlobalRepoImpl globalRepoImpl;
  SettingsModel? settingsModel;
  bool? isUpdate;

  Future getSettings() async {
    emit(const SettingsState.loading());
    try {
      final result = await globalRepoImpl.getSettings();
      result.fold(
        (l) {
          emit(SettingsState.error(error: KFailure.toError(l)));
          debugPrint('================= Settings (Bloc) : $l  ');
        },
        (r) {
          settingsModel = r;
          KStorage.i.setSettings(settingsModel);
          if ((r.data?.first.appVersion?.main ?? 0) <= KEndPoints.clientAppVersion) {
            isUpdate = false;
          } else {
            isUpdate = true;
          }

          emit(SettingsState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint('================= Settings (Bloc) (catch) : $e  ');
      emit(SettingsState.error(error: Tr.get.something_went_wrong));
    }
  }

  UserCompany? selectedCompany;

  setSelectedCompany(UserCompany model) {
    selectedCompany = model;
  }
}
