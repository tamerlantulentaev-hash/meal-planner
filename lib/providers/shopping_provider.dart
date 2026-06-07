import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/shopping_item.dart';

final shoppingItemsProvider = StateNotifierProvider<ShoppingItemsNotifier, List<ShoppingItem>>(
  (ref) => ShoppingItemsNotifier(),
);

class ShoppingItemsNotifier extends StateNotifier<List<ShoppingItem>> {
  ShoppingItemsNotifier() : super([]);

  void addItem(ShoppingItem item) {
    state = [...state, item];
  }

  void updateItem(ShoppingItem item) {
    state = state.map((i) => i.id == item.id ? item : i).toList();
  }

  void removeItem(String itemId) {
    state = state.where((i) => i.id != itemId).toList();
  }

  void toggleItemPurchased(String itemId) {
    state = state.map((item) {
      if (item.id == itemId) {
        return item.copyWith(isPurchased: !item.isPurchased);
      }
      return item;
    }).toList();
  }

  List<ShoppingItem> get unpurchasedItems {
    return state.where((item) => !item.isPurchased).toList();
  }

  List<ShoppingItem> get purchasedItems {
    return state.where((item) => item.isPurchased).toList();
  }

  double getTotalEstimatedPrice() {
    return state.fold(0, (sum, item) => sum + (item.estimatedPrice ?? 0));
  }

  void clearPurchased() {
    state = state.where((item) => !item.isPurchased).toList();
  }
}

final unpurchasedItemsProvider = Provider<List<ShoppingItem>>((ref) {
  final items = ref.watch(shoppingItemsProvider);
  return items.where((item) => !item.isPurchased).toList();
});

final purchasedItemsProvider = Provider<List<ShoppingItem>>((ref) {
  final items = ref.watch(shoppingItemsProvider);
  return items.where((item) => item.isPurchased).toList();
});

final totalPriceProvider = Provider<double>((ref) {
  final items = ref.watch(shoppingItemsProvider);
  return items.fold(0, (sum, item) => sum + (item.estimatedPrice ?? 0));
});

final itemsByCategoryProvider = Provider<Map<ItemCategory, List<ShoppingItem>>>((ref) {
  final items = ref.watch(shoppingItemsProvider);
  final grouped = <ItemCategory, List<ShoppingItem>>{};

  for (var item in items) {
    if (!grouped.containsKey(item.category)) {
      grouped[item.category] = [];
    }
    grouped[item.category]!.add(item);
  }

  return grouped;
});
