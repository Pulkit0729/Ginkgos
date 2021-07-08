import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  Authentication(this.phone, this.function);
  final function;
  final phone;
  late String verificationCode;
  verifyPhone() {
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91$phone',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          if (value.user != null) {
            function();
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationID, int? resendToken) {
        verificationCode = verificationID;
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        verificationCode = verificationID;
      },
      timeout: Duration(seconds: 30),
    );
  }
}
