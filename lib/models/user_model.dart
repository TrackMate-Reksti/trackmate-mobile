import 'package:equatable/equatable.dart';
import 'package:trackmate/models/motocycle_model.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final List<MotocycleModel> motocycles;

  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.motocycles = const [],
  });

  factory UserModel.fromJson(Map<String, dynamic> json, String id) {
    return UserModel(
      id: id,
      email: json['email'],
      name: json['name'],
      motocycles: List<MotocycleModel>.from(
        json['motocycles'].map(
          (x) => MotocycleModel.fromJson(x),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'motocycles': motocycles.map((x) => x.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [id, email, name, motocycles];
}
