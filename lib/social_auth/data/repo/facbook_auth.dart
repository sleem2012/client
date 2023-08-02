import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../../packages/shared/error/failures.dart';

abstract class FacebookAuthRepo {
  Future<Either<KFailure, LoginResult>> triggerAuth();
  Either<KFailure, OAuthCredential> createCredential(String? accessToken);
}

class FacebookAuthImpl implements FacebookAuthRepo {
  @override
  Future<Either<KFailure, LoginResult>> triggerAuth() async {
    final loginResult = await FacebookAuth.instance.login();
    if (loginResult.status == LoginStatus.failed) {
      return left(const KFailure.facebookAuthFailure());
    } else if (loginResult.status == LoginStatus.cancelled) {
      return left(const KFailure.facebookAuthCancelled());
    } else {
      return right(loginResult);
    }
  }

  @override
  Either<KFailure, OAuthCredential> createCredential(String? accessToken) {
    final facebookAuthCredential = FacebookAuthProvider.credential(accessToken ?? '');
    if (facebookAuthCredential.idToken == null) {
      return left(const KFailure.facebookAuthFailure());
    } else {
      return right(facebookAuthCredential);
    }
  }
}
