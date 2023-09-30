import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:transport/app/data/repositories/user_repository.dart';
import 'package:transport/app/routes/app_pages.dart';

class AuthService extends GetxService {
  bool get isLoggedIn => FirebaseAuth.instance.currentUser != null;

  String get userId => FirebaseAuth.instance.currentUser!.uid;

  Stream<User?> streamUser() {
    return FirebaseAuth.instance.userChanges();
  }

  Future<UserCredential?> verifyOtp(String verificationId, String otp) async {
    try {
      final credentials = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      Get.toNamed(Routes.LOADING, arguments: "Logging in...");
      var userCredentials =
          await FirebaseAuth.instance.signInWithCredential(credentials);
      await Get.find<UserRepository>().updateUser(userCredentials.user!);
      return userCredentials;
    } catch (e) {
      return null;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
