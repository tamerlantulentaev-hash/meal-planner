import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/recipe.dart';
import '../services/database_service.dart';

final databaseServiceProvider = Provider((ref) => DatabaseService());

final recipesProvider = FutureProvider<List<Recipe>>((ref) async {
  final dbService = ref.watch(databaseServiceProvider);
  return dbService.getAllRecipes();
});

final recipeProvider = FutureProvider.family<Recipe?, String>((ref, recipeId) async {
  final dbService = ref.watch(databaseServiceProvider);
  return dbService.getRecipe(recipeId);
});

final favoriteRecipesProvider = StateNotifierProvider<FavoriteRecipesNotifier, List<String>>(
  (ref) => FavoriteRecipesNotifier(ref),
);

class FavoriteRecipesNotifier extends StateNotifier<List<String>> {
  final Ref ref;

  FavoriteRecipesNotifier(this.ref) : super([]);

  void addFavorite(String recipeId) {
    state = [...state, recipeId];
  }

  void removeFavorite(String recipeId) {
    state = state.where((id) => id != recipeId).toList();
  }

  bool isFavorite(String recipeId) {
    return state.contains(recipeId);
  }
}

final recipeSearchProvider = StateProvider<String>((ref) => '');

final filteredRecipesProvider = Provider<List<Recipe>>((ref) {
  final recipes = ref.watch(recipesProvider);
  final searchQuery = ref.watch(recipeSearchProvider);

  return recipes.maybeWhen(
    data: (data) {
      if (searchQuery.isEmpty) return data;
      return data
          .where((recipe) =>
              recipe.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
              recipe.tags.any((tag) => tag.toLowerCase().contains(searchQuery.toLowerCase())))
          .toList();
    },
    orElse: () => [],
  );
});
