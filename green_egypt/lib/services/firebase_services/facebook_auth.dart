import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:green_egypt/services/firebase_services/firebase_services.dart';

class FacebookCustomAuth {
  /**
   * Signing in with Facebook : 
   */

  static Future<void> signInWithFacebook(
      {required BuildContext context}) async {
    final LoginResult result = await FacebookAuth.instance
        .login(); // by default we request the email and the public profile
    if (result.status == LoginStatus.success) {
      FacebookAuth.instance.getUserData().then((userCredential) async {
        FirebaseCustomServices.instance
            .access_withFacebook_thenStoreDataLocally(
                userCredential: userCredential, context: context);
      });
    }
  }
}
