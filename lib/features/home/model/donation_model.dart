import 'package:cloud_firestore/cloud_firestore.dart';

class DonationModel {
  final String? id;
  final String foodServings;
  final String timings;
  final String location;

  DonationModel({
    this.id,
    required this.foodServings,
    required this.timings,
    required this.location,
  });
  factory DonationModel.fromSnapshot(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return DonationModel(
      id: doc.id,
      foodServings: data['foodServings'] ?? '',
      timings: data['timings'] ?? '',
      location: data['location'] ?? '',
    );
  }
  toJson() {
    return {
      'id': id,
      'foodServings': foodServings,
      'timings': timings,
      'location': location,
    };
  }
}
