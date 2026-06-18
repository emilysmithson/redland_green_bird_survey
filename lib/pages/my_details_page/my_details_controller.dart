import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

enum MyDetailsView {
  authenticated,
  unauthenticated,
  login,
  register,
  awaitingVerification,
}

class MyDetailsController {
  final ValueNotifier<MyDetailsView> content = ValueNotifier<MyDetailsView>(
    MyDetailsView.unauthenticated,
  );
  void initialise() {
    if (FirebaseAuth.instance.currentUser == null) {
      content.value = MyDetailsView.unauthenticated;
    } else {
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        content.value = MyDetailsView.authenticated;
      } else {
        content.value = MyDetailsView.awaitingVerification;
      }
    }
  }
}
