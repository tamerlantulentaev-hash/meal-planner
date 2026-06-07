import 'package:json_annotation/json_annotation.dart';
import 'recipe.dart';

part 'meal_plan.g.dart';

enum MealType { breakfast, lunch, dinner, snack }

@JsonSerializable()
class Meal {
  final String id;
  final Recipe recipe;
  final MealType mealType;
  final int servings;
  final DateTime scheduledTime;

  Meal({
    required this.id,
    required this.recipe,
    required this.mealType,
    required this.servings,
    required this.scheduledTime,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
  Map<String, dynamic> toJson() => _$MealToJson(this);

  double get totalCalories => recipe.totalCalories * (servings / recipe.servings);

  Meal copyWith({
    String? id,
    Recipe? recipe,
    MealType? mealType,
    int? servings,
    DateTime? scheduledTime,
  }) {
    return Meal(
      id: id ?? this.id,
      recipe: recipe ?? this.recipe,
      mealType: mealType ?? this.mealType,
      servings: servings ?? this.servings,
      scheduledTime: scheduledTime ?? this.scheduledTime,
    );
  }
}

@JsonSerializable()
class MealPlan {
  final String id;
  final String userId;
  final DateTime startDate;
  final DateTime endDate;
  final List<Meal> meals;
  final String name;
  final String? description;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  MealPlan({
    required this.id,
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.meals,
    required this.name,
    this.description,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MealPlan.fromJson(Map<String, dynamic> json) =>
      _$MealPlanFromJson(json);
  Map<String, dynamic> toJson() => _$MealPlanToJson(this);

  List<Meal> getMealsForDate(DateTime date) {
    return meals
        .where((meal) =>
            meal.scheduledTime.year == date.year &&
            meal.scheduledTime.month == date.month &&
            meal.scheduledTime.day == date.day)
        .toList();
  }

  double getTotalCaloriesForDate(DateTime date) {
    return getMealsForDate(date).fold(0, (sum, meal) => sum + meal.totalCalories);
  }

  int get durationInDays => endDate.difference(startDate).inDays + 1;

  MealPlan copyWith({
    String? id,
    String? userId,
    DateTime? startDate,
    DateTime? endDate,
    List<Meal>? meals,
    String? name,
    String? description,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return MealPlan(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      meals: meals ?? this.meals,
      name: name ?? this.name,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
