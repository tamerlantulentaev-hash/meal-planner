import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Ingredient {
  final String name;
  final double quantity;
  final String unit;
  final double calories;

  Ingredient({
    required this.name,
    required this.quantity,
    required this.unit,
    required this.calories,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}

@JsonSerializable()
class Recipe {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final int preparationTime; // в минутах
  final int cookingTime; // в минутах
  final int servings;
  final double totalCalories;
  final List<Ingredient> ingredients;
  final List<String> instructions;
  final List<String> tags; // vegetarian, vegan, low-carb и т.д.
  final double rating;
  final int reviewsCount;
  final String authorId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.preparationTime,
    required this.cookingTime,
    required this.servings,
    required this.totalCalories,
    required this.ingredients,
    required this.instructions,
    required this.tags,
    required this.rating,
    required this.reviewsCount,
    required this.authorId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeToJson(this);

  int get totalTime => preparationTime + cookingTime;
  double get caloriesPerServing => totalCalories / servings;

  Recipe copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    int? preparationTime,
    int? cookingTime,
    int? servings,
    double? totalCalories,
    List<Ingredient>? ingredients,
    List<String>? instructions,
    List<String>? tags,
    double? rating,
    int? reviewsCount,
    String? authorId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Recipe(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      preparationTime: preparationTime ?? this.preparationTime,
      cookingTime: cookingTime ?? this.cookingTime,
      servings: servings ?? this.servings,
      totalCalories: totalCalories ?? this.totalCalories,
      ingredients: ingredients ?? this.ingredients,
      instructions: instructions ?? this.instructions,
      tags: tags ?? this.tags,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      authorId: authorId ?? this.authorId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
