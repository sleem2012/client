import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../packages/shared/api_client/connection_ckecker.dart';
import '../../../packages/shared/error/failures.dart';

abstract class GoogleAuthRepo {
  Future<Either<KFailure, GoogleSignInAccount>> triggerAuth();
  Future<Either<KFailure, GoogleSignInAuthentication>> googleAuth(GoogleSignInAccount? googleUser);
}

class GoogleAuthImpl implements GoogleAuthRepo {
  @override
  Future<Either<KFailure, GoogleSignInAccount>> triggerAuth() async {
    bool connected = await ConnectivityCheck.call();
    if (connected) {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return left(const KFailure.googleAuthFailure());
      } else {
        return right(googleUser);
      }
    } else {
      return left(const KFailure.offline());
    }
  }

  @override
  Future<Either<KFailure, GoogleSignInAuthentication>> googleAuth(GoogleSignInAccount? googleUser) async {
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    if (googleAuth == null) {
      return left(const KFailure.googleAuthFailure());
    } else {
      return right(googleAuth);
    }
  }
}
