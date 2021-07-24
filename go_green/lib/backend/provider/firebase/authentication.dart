import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  Authentication(this.phone, this.function);
  final function;
  final phone;

  late String verificationCode;
  void verifyPhone() async {
    print("Called");
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91$phone',
      verificationCompleted: (PhoneAuthCredential credential) {
        FirebaseAuth.instance.signInWithCredential(credential).then((value) {
          print('Verified');
        });
        print('Auto Verified');
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Message failed');
        print(e.message);
      },
      codeSent: (String verificationID, int? resendToken) {
        print('Message sedn');
        verificationCode = verificationID;
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        print('Message Timeout');
        verificationCode = verificationID;
      },
      timeout: Duration(seconds: 30),
    );
  }
}
