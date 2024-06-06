import 'package:equatable/equatable.dart';

class MotocycleModel extends Equatable {
  final String platNumber;
  final double lat;
  final double long;

  const MotocycleModel({
    required this.platNumber,
    required this.lat,
    required this.long,
  });

  factory MotocycleModel.fromJson(Map<String, dynamic> json) {
    return MotocycleModel(
      platNumber: json['plat_number'],
      lat: json['lat'].toDouble(),
      long: json['long'].toDouble(),
    );
  }

  @override
  List<Object?> get props => [platNumber, lat, long];
}
