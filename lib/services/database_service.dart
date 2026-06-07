import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' show join;
import '../models/recipe.dart';
import '../models/meal_plan.dart';
import '../models/shopping_item.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  static Database? _database;

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal();

  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'meal_planner.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Create recipes table
    await db.execute('''
      CREATE TABLE IF NOT EXISTS recipes (
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        description TEXT,
        imageUrl TEXT,
        preparationTime INTEGER,
        cookingTime INTEGER,
        servings INTEGER,
        totalCalories REAL,
        rating REAL,
        reviewsCount INTEGER,
        authorId TEXT,
        ingredients TEXT,
        instructions TEXT,
        tags TEXT,
        createdAt TEXT,
        updatedAt TEXT
      )
    ''');

    // Create meal plans table
    await db.execute('''
      CREATE TABLE IF NOT EXISTS meal_plans (
        id TEXT PRIMARY KEY,
        userId TEXT NOT NULL,
        name TEXT NOT NULL,
        description TEXT,
        startDate TEXT,
        endDate TEXT,
        isActive INTEGER,
        meals TEXT,
        createdAt TEXT,
        updatedAt TEXT
      )
    ''');

    // Create shopping lists table
    await db.execute('''
      CREATE TABLE IF NOT EXISTS shopping_lists (
        id TEXT PRIMARY KEY,
        userId TEXT NOT NULL,
        name TEXT NOT NULL,
        items TEXT,
        createdAt TEXT,
        updatedAt TEXT
      )
    ''');

    // Create favorites table
    await db.execute('''
      CREATE TABLE IF NOT EXISTS favorites (
        id TEXT PRIMARY KEY,
        userId TEXT NOT NULL,
        recipeId TEXT NOT NULL,
        createdAt TEXT
      )
    ''');
  }

  // Recipe methods
  Future<void> insertRecipe(Recipe recipe) async {
    final db = await database;
    await db.insert('recipes', recipe.toJson());
  }

  Future<Recipe?> getRecipe(String id) async {
    final db = await database;
    final result = await db.query('recipes', where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return Recipe.fromJson(result.first);
    }
    return null;
  }

  Future<List<Recipe>> getAllRecipes() async {
    final db = await database;
    final result = await db.query('recipes');
    return result.map((e) => Recipe.fromJson(e)).toList();
  }

  Future<void> updateRecipe(Recipe recipe) async {
    final db = await database;
    await db.update('recipes', recipe.toJson(), where: 'id = ?', whereArgs: [recipe.id]);
  }

  Future<void> deleteRecipe(String id) async {
    final db = await database;
    await db.delete('recipes', where: 'id = ?', whereArgs: [id]);
  }

  // Shopping list methods
  Future<void> insertShoppingItem(ShoppingItem item) async {
    final db = await database;
    await db.insert('shopping_lists', item.toJson());
  }

  Future<List<ShoppingItem>> getShoppingItems(String userId) async {
    final db = await database;
    final result = await db.query(
      'shopping_lists',
      where: 'userId = ?',
      whereArgs: [userId],
    );
    return result.map((e) => ShoppingItem.fromJson(e)).toList();
  }

  Future<void> updateShoppingItem(ShoppingItem item) async {
    final db = await database;
    await db.update('shopping_lists', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<void> deleteShoppingItem(String id) async {
    final db = await database;
    await db.delete('shopping_lists', where: 'id = ?', whereArgs: [id]);
  }

  // Favorites methods
  Future<void> addToFavorites(String userId, String recipeId) async {
    final db = await database;
    await db.insert('favorites', {
      'id': '${userId}_$recipeId',
      'userId': userId,
      'recipeId': recipeId,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }

  Future<void> removeFromFavorites(String userId, String recipeId) async {
    final db = await database;
    await db.delete(
      'favorites',
      where: 'userId = ? AND recipeId = ?',
      whereArgs: [userId, recipeId],
    );
  }

  Future<List<String>> getFavoriteRecipeIds(String userId) async {
    final db = await database;
    final result = await db.query(
      'favorites',
      where: 'userId = ?',
      whereArgs: [userId],
    );
    return result.map((e) => e['recipeId'] as String).toList();
  }

  // Close database
  Future<void> closeDatabase() async {
    final db = await database;
    await db.close();
  }
}
