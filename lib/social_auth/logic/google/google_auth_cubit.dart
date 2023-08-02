import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../packages/shared/error/failures.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../shared/localization/trans.dart';
import '../../data/repo/google_auth.dart';
import 'google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit() : super(const GoogleAuthState.initial());

  final GoogleAuthImpl _googleAuthImpl = GoogleAuthImpl();

  static GoogleAuthCubit of(context) => BlocProvider.of(context);

  triggerAuth() async {
    emit(const GoogleAuthState.loading());
    try {
      final result = await _googleAuthImpl.triggerAuth();
      result.fold((l) {
        debugPrint('================= triggerAuth Bloc : ${KFailure.toError(l)}');
        emit(GoogleAuthState.error(error: KFailure.toError(l)));
      }, (r) {
        googleAuth(r);
        emit(const GoogleAuthState.success());
      });
    } catch (e) {
      debugPrint('================= triggerAuth Bloc : ${e.toString()}');
      emit(GoogleAuthState.error(error: Tr.get.something_went_wrong));
    }
  }

  googleAuth(GoogleSignInAccount? googleUser) async {
    try {
      final result = await _googleAuthImpl.googleAuth(googleUser);
      result.fold((l) => KFailure.toError(l), (r) {
        final credential = GoogleAuthProvider.credential(
          accessToken: r.accessToken,
          idToken: r.idToken,
        );
        signIn(credential);
      });
    } catch (e) {
      debugPrint('================= googleAuth Bloc : ${e.toString()}');
    }
  }
}

signIn(AuthCredential credential) async {
  try {
    final result = await FirebaseAuth.instance.signInWithCredential(credential);
    debugPrint('=========> ${result.user?.email}');
    debugPrint('=========> ${result.user?.photoURL}');
    // debugPrint('=========> ${resu}');
    return result;
  } catch (e) {
    debugPrint('================= signIn Bloc : ${e.toString()}');
  }
}
