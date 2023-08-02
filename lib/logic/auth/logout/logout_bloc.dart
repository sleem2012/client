import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/auth/auth_repo.dart';
import 'logout_state.dart';
import '../../../packages/cache/locale_storage.dart';
import '../../../packages/shared/error/failures.dart';

class LogoutBloc extends Cubit<LogoutState> {
  LogoutBloc() : super(const LogoutState.initial());

  static LogoutBloc of(BuildContext context) {
    return BlocProvider.of<LogoutBloc>(context);
  }

  logout() async {
    emit(const LogoutState.loading());
    try {
      final result = await AuthRepoImpl.i.logout(KStorage.i.getFcmToken);

      result.fold(
        (l) {
          emit(LogoutState.error(failure: l));
          debugPrint('================= logout   (Bloc): Failed $l ');
        },
        (r) {
          KStorage.i.delToken;
          KStorage.i.delUserInfo;
          emit(const LogoutState.success());
          debugPrint('================= logout   (Bloc): Success => $r ');
        },
      );
    } catch (e) {
      debugPrint('================= logout   (Bloc) (catch):  $e');
      emit(const LogoutState.error(failure: KFailure.someThingWrongPleaseTryAgain()));
    }
  }
}
