import 'package:bloodbond_app/features/authentication/models/user_model.dart';
import 'package:bloodbond_app/repository/Authentication_Repository/authentication_repository.dart';
import 'package:bloodbond_app/repository/User_Repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  final userRepo = Get.put(UserRepository());
  void signup(String email, String password) {
    String? error = AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(
        GetSnackBar(
          message: error.toString(),
        ),
      );
    }
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    signup(user.email, user.password);
  }
}
