import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String email;
  final String? displayName;
  final String? photoUrl;
  final String? bio;
  final List<String> dietaryPreferences;
  final List<String> allergies;
  final int? dailyCalorieGoal;
  final bool isPremium;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.email,
    this.displayName,
    this.photoUrl,
    this.bio,
    required this.dietaryPreferences,
    required this.allergies,
    this.dailyCalorieGoal,
    required this.isPremium,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? id,
    String? email,
    String? displayName,
    String? photoUrl,
    String? bio,
    List<String>? dietaryPreferences,
    List<String>? allergies,
    int? dailyCalorieGoal,
    bool? isPremium,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      bio: bio ?? this.bio,
      dietaryPreferences: dietaryPreferences ?? this.dietaryPreferences,
      allergies: allergies ?? this.allergies,
      dailyCalorieGoal: dailyCalorieGoal ?? this.dailyCalorieGoal,
      isPremium: isPremium ?? this.isPremium,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
