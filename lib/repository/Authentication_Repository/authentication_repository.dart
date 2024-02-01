import 'package:bloodbond_app/features/authentication/screens/first_page.dart';
import 'package:bloodbond_app/features/community/screens/home_page.dart';
import 'package:bloodbond_app/repository/Authentication_Repository/exceptions/signin_email_password_failure.dart';
import 'package:bloodbond_app/repository/Authentication_Repository/exceptions/signup_email_password_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const RootPage())
        : Get.offAll(() => const HomePage());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const HomePage())
          : Get.to(() => RootPage());
    } on FirebaseAuthException catch (e) {
      final ex = SignupWithEmailAndPasswordFailure(e.code);
      print("firebase auth exception -${ex.message}");
      throw ex;
    } catch (_) {
      const ex = SignupWithEmailAndPasswordFailure();
      print('EXCEPTION -${ex.message}');
      throw ex;
    }
  }

  Future<void> signinUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
       final ex = SigninWithEmailAndPasswordFailure(e.code);
      print("firebase auth exception -${ex.message}");
      throw ex;
    } catch (_) {
      const ex = SigninWithEmailAndPasswordFailure();
      print('EXCEPTION -${ex.message}');
      throw ex;
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
