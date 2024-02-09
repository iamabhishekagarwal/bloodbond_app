import 'package:bloodbond_app/features/home/model/donation_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationRepository extends GetxController {
  static DonationRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<DonationModel>> fetchDonations() async {
    try {
      var querySnapshot = await _db.collection('Donations').get();
      return querySnapshot.docs
          .map((doc) => DonationModel.fromSnapshot(doc))
          .toList();
    } catch (error) {
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
      print(error.toString());
      throw error;
    }
  }
}
