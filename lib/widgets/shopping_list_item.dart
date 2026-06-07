import 'package:flutter/material.dart';
import '../models/shopping_item.dart';
import '../theme/colors.dart';

class ShoppingListItemWidget extends StatelessWidget {
  final ShoppingItem item;
  final ValueChanged<bool> onPurchasedChanged;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  const ShoppingListItemWidget({
    Key? key,
    required this.item,
    required this.onPurchasedChanged,
    this.onDelete,
    this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Checkbox(
              value: item.isPurchased,
              onChanged: (value) {
                onPurchasedChanged(value ?? false);
              },
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          decoration: item.isPurchased
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: item.isPurchased
                              ? AppColors.grey
                              : AppColors.black,
                        ),
                  ),
                  Text(
                    '${item.quantity} ${item.unit}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.grey,
                        ),
                  ),
                ],
              ),
            ),
            if (item.estimatedPrice != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '${item.estimatedPrice!.toStringAsFixed(2)}₽',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            PopupMenuButton(
              itemBuilder: (context) => [
                if (onEdit != null)
                  PopupMenuItem(
                    child: const Text('Редактировать'),
                    onTap: onEdit,
                  ),
                if (onDelete != null)
                  PopupMenuItem(
                    child: const Text('Удалить'),
                    onTap: onDelete,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
