import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/auth/auth_repo.dart';
import '../../di.dart';
import '../../packages/cache/locale_storage.dart';
import '../../views/Auth/pin_code/pin_code_screen.dart';
import '../../views/main_screen/main_screen.dart';
import '../../views/splash_screen/splash_screen.dart';
import 'nav_enforcer_state.dart';

//************************************************************************
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//Please Dont Edit
//*/

class NavEnforcerBloc extends Cubit<NavEnforcerState> {
  NavEnforcerBloc() : super(const NavEnforcerState.toSuccess(destination: SplashScreen()));

  static NavEnforcerBloc of(BuildContext context) => BlocProvider.of<NavEnforcerBloc>(context);

  FutureOr<void> checkUser({String? msg, required Widget destination}) async {
    emit(const NavEnforcerState.loading());
    try {
      final result = await AuthRepoImpl.i.userForNavOnly();
      result.fold(
        (l) {
          if (l == 409) {
            emit(NavEnforcerState.toSuccess(msg: msg, destination: const PinCodeScreen(destination: MainNavigationView())));
            return;
          } else {
            debugPrint('NavEnforcerState =================>>> 0 >>> UnHandled Nav Response Code  $l');
            return;
          }
        },
        (user) {
          KStorage.i.setUserInfo(user);
          if (user.data?.language?.symbols != KStorage.i.getLang) {
            Di.updateUserBloc.updateLang;
          }
          if (!(user.data?.is_email_verified ?? true)) {
            debugPrint('NavEnforcerState=================>>> 1 >>> is_email_verified  ${user.data?.is_email_verified}');
            emit(NavEnforcerState.toSuccess(msg: msg, destination: const PinCodeScreen(destination: MainNavigationView())));
            return;
          }
          debugPrint('NavEnforcerState=================>>> 4 >>> All is Good ');
          emit(NavEnforcerState.toSuccess(msg: msg, destination: destination));
        },
      );
    } catch (e) {
      emit(NavEnforcerState.error(error: e.toString()));
    }
  }
}

class Nav {
  static final navigator = GlobalKey<NavigatorState>();

  static final BuildContext? _context = navigator.currentState?.context;

  static void removeAllFocus() => FocusScope.of(_context!).unfocus();

  static Future<T?> to<T>(Widget page) async {
    removeAllFocus();
    return await Navigator.push<T>(_context!, MaterialPageRoute<T>(builder: (context) => page));
  }

  static Future<Future<T?>> offAll<T>(Widget page) async {
    removeAllFocus();
    return Navigator.pushAndRemoveUntil<T>(_context!, MaterialPageRoute<T>(builder: (context) => page), (route) => false);
  }

  static Future<Future<T?>> toRoute<T>(Route<T> route) async {
    removeAllFocus();
    return Navigator.push<T>(_context!, route);
  }

  static Future<Future<R?>> replace<R, T>(Widget page, {T? result}) async {
    removeAllFocus();
    return Navigator.pushReplacement<R, T>(_context!, MaterialPageRoute<R>(builder: (context) => page), result: result);
  }

  static Future<void> back<T>({T? result}) async {
    removeAllFocus();
    return Navigator.pop<T>(_context!, result);
  }

  static Future<void> sysPop<T>() async => SystemNavigator.pop();

  static void popUntil(RoutePredicate predicate) {
    removeAllFocus();
    return Navigator.popUntil(_context!, predicate);
  }
}
