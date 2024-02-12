import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationRepository extends GetxController {
  static DonationRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  fetchDonations() async {
    try {
      await _db.collection('Donations').get().then((value) => null);
    } catch (error) {
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
      print(error.toString());
      return null;
    }
  }
}
