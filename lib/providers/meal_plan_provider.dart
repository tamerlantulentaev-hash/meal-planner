import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal_plan.dart';
import '../models/recipe.dart';

final mealPlansProvider = StateNotifierProvider<MealPlansNotifier, List<MealPlan>>(
  (ref) => MealPlansNotifier(),
);

class MealPlansNotifier extends StateNotifier<List<MealPlan>> {
  MealPlansNotifier() : super([]);

  void addMealPlan(MealPlan plan) {
    state = [...state, plan];
  }

  void updateMealPlan(MealPlan plan) {
    state = state.map((p) => p.id == plan.id ? plan : p).toList();
  }

  void removeMealPlan(String planId) {
    state = state.where((p) => p.id != planId).toList();
  }

  MealPlan? getMealPlan(String planId) {
    try {
      return state.firstWhere((p) => p.id == planId);
    } catch (e) {
      return null;
    }
  }
}

final currentMealPlanProvider = StateProvider<MealPlan?>((ref) => null);

final mealsForDateProvider = Provider.family<List<Meal>, DateTime>((ref, date) {
  final currentPlan = ref.watch(currentMealPlanProvider);
  if (currentPlan == null) return [];
  return currentPlan.getMealsForDate(date);
});

final totalCaloriesForDateProvider = Provider.family<double, DateTime>((ref, date) {
  final meals = ref.watch(mealsForDateProvider(date));
  return meals.fold(0, (sum, meal) => sum + meal.totalCalories);
});

final mealsProvider = StateNotifierProvider<MealsNotifier, List<Meal>>(
  (ref) => MealsNotifier(),
);

class MealsNotifier extends StateNotifier<List<Meal>> {
  MealsNotifier() : super([]);

  void addMeal(Meal meal) {
    state = [...state, meal];
  }

  void updateMeal(Meal meal) {
    state = state.map((m) => m.id == meal.id ? meal : m).toList();
  }

  void removeMeal(String mealId) {
    state = state.where((m) => m.id != mealId).toList();
  }

  List<Meal> getMealsForDate(DateTime date) {
    return state
        .where((meal) =>
            meal.scheduledTime.year == date.year &&
            meal.scheduledTime.month == date.month &&
            meal.scheduledTime.day == date.day)
        .toList();
  }

  double getTotalCaloriesForDate(DateTime date) {
    return getMealsForDate(date).fold(0, (sum, meal) => sum + meal.totalCalories);
  }
}
