import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../packages/shared/error/failures.dart';
import '../../data/repo/facbook_auth.dart';

import '../../../shared/localization/trans.dart';
import 'facebook_auth_state.dart';

class FacebookAuthCubit extends Cubit<FacebookAuthState> {
  FacebookAuthCubit() : super(const FacebookAuthState.initial());

  static FacebookAuthCubit of(context) => BlocProvider.of(context);
  final FacebookAuthImpl _facebookAuthImpl = FacebookAuthImpl();

  triggerAuth() async {
    emit(const FacebookAuthState.loading());
    try {
      final result = await _facebookAuthImpl.triggerAuth();

      result.fold((l) {
        debugPrint('================= triggerAuth Bloc : ${KFailure.toError(l)}');
        emit(FacebookAuthState.error(error: KFailure.toError(l)));
      }, (r) {
        createCredential(r.accessToken?.token ?? '');
        emit(const FacebookAuthState.success());
      });
    } catch (e) {
      debugPrint('================= triggerAuth Bloc : ${e.toString()}');

      emit(FacebookAuthState.error(error: Tr.get.something_went_wrong));
    }
  }

  createCredential(String accessToken) {
    try {
      final result = _facebookAuthImpl.createCredential(accessToken);
      result.fold((l) {
        return KFailure.toError(l);
      }, (r) {
        signIn(r);
      });
    } catch (e) {
      debugPrint('================= createCredential Bloc : ${e.toString()}');
    }
  }

  signIn(OAuthCredential oAuthCredential) async {
    try {
      final result = await FirebaseAuth.instance.signInWithCredential(oAuthCredential);
      debugPrint('=========> ${result.user?.email}');
      debugPrint('=========> ${result.user?.photoURL}');
      // debugPrint('=========> ${resu}');
      return result;
    } catch (e) {
      debugPrint('================= signIn Bloc : ${e.toString()}');
    }
  }
}
