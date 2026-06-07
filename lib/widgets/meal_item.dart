import 'package:flutter/material.dart';
import '../models/meal_plan.dart';
import '../theme/colors.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const MealItem({
    Key? key,
    required this.meal,
    this.onTap,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(meal.recipe.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getMealTypeLabel(meal.mealType),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      meal.recipe.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${meal.totalCalories.toStringAsFixed(0)} ккал',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          '${meal.servings} порц.',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (onDelete != null)
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: onDelete,
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _getMealTypeLabel(MealType type) {
    switch (type) {
      case MealType.breakfast:
        return 'Завтрак';
      case MealType.lunch:
        return 'Обед';
      case MealType.dinner:
        return 'Ужин';
      case MealType.snack:
        return 'Перекус';
    }
  }
}
