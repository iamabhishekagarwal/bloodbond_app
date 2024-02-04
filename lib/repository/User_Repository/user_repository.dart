import 'package:bloodbond_app/features/authentication/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  createUser(UserModel user) async {
    try {
      await _db
          .collection('Users')
          .add(user.toJson())
          .whenComplete(() => Get.snackbar(
                "Success",
                "Your account has been created",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green.withOpacity(0.1),
                colorText: Colors.green,
              ));
    } catch (error) {
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
      print(error.toString());
      // Return a value to fulfill the requirement of the catchError callback
      return null; // You can return null or any other appropriate value
    }
  }
}
