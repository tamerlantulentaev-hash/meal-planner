import 'package:json_annotation/json_annotation.dart';

part 'shopping_item.g.dart';

enum ItemCategory {
  produce,
  dairy,
  meat,
  pantry,
  frozen,
  beverages,
  other
}

@JsonSerializable()
class ShoppingItem {
  final String id;
  final String name;
  final double quantity;
  final String unit;
  final ItemCategory category;
  final double? estimatedPrice;
  final bool isPurchased;
  final String? linkedRecipeId;
  final DateTime createdAt;
  final DateTime updatedAt;

  ShoppingItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.unit,
    required this.category,
    this.estimatedPrice,
    required this.isPurchased,
    this.linkedRecipeId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ShoppingItem.fromJson(Map<String, dynamic> json) =>
      _$ShoppingItemFromJson(json);
  Map<String, dynamic> toJson() => _$ShoppingItemToJson(this);

  ShoppingItem copyWith({
    String? id,
    String? name,
    double? quantity,
    String? unit,
    ItemCategory? category,
    double? estimatedPrice,
    bool? isPurchased,
    String? linkedRecipeId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ShoppingItem(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      category: category ?? this.category,
      estimatedPrice: estimatedPrice ?? this.estimatedPrice,
      isPurchased: isPurchased ?? this.isPurchased,
      linkedRecipeId: linkedRecipeId ?? this.linkedRecipeId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

@JsonSerializable()
class ShoppingList {
  final String id;
  final String userId;
  final List<ShoppingItem> items;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  ShoppingList({
    required this.id,
    required this.userId,
    required this.items,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ShoppingList.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListFromJson(json);
  Map<String, dynamic> toJson() => _$ShoppingListToJson(this);

  List<ShoppingItem> get unpurchasedItems =>
      items.where((item) => !item.isPurchased).toList();

  List<ShoppingItem> get purchasedItems =>
      items.where((item) => item.isPurchased).toList();

  double getTotalEstimatedPrice() {
    return items.fold(
        0, (sum, item) => sum + (item.estimatedPrice ?? 0));
  }

  ShoppingList copyWith({
    String? id,
    String? userId,
    List<ShoppingItem>? items,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ShoppingList(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      items: items ?? this.items,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
