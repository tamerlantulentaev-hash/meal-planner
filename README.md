# Meal Planner - Приложение для планирования питания

Полнофункциональное Flutter приложение для планирования меню, управления рецептами и списками покупок.

## 📱 Основные функции

- **🍽️ Каталог рецептов** - Просмотр, поиск и сохранение рецептов
- **📅 Планирование меню** - Создание плана питания на неделю/месяц
- **🛒 Список покупок** - Автоматическое создание списка из плана питания
- **📊 Отслеживание прогресса** - Мониторинг калорийности и питательных веществ
- **👤 Профиль пользователя** - Управление предпочтениями и аллергиями
- **💬 AI Помощник** - Интерактивный чат для рекомендаций
- **⭐ Избранные рецепты** - Сохранение любимых рецептов
- **🌙 Темный режим** - Полная поддержка светлой и темной темы

## 🏗️ Структура проекта

```
lib/
├── main.dart                 # Точка входа приложения
├── models/                   # Модели данных
│   ├── user.dart            # Модель пользователя
│   ├── recipe.dart          # Модель рецепта
│   ├── meal_plan.dart       # Модель плана питания
│   └── shopping_item.dart   # Модель элемента покупок
├── services/                 # Бизнес-логика
│   ├── auth_service.dart    # Аутентификация
│   └── database_service.dart # Работа с БД
├── providers/                # Управление состоянием (Riverpod)
│   ├── auth_provider.dart
│   ├── recipe_provider.dart
│   ├── meal_plan_provider.dart
│   └── shopping_provider.dart
├── screens/                  # UI экраны
│   ├── splash/              # Заставка
│   ├── auth/                # Аутентификация
│   ├── home/                # Главная страница
│   ├── recipes/             # Рецепты
│   ├── planner/             # Планирование
│   ├── shopping/            # Список покупок
│   ├── progress/            # Прогресс
│   ├── chat/                # Чат с AI
│   ├── profile/             # Профиль
│   └── premium/             # Премиум подписка
├── widgets/                  # Переиспользуемые компоненты
│   ├── recipe_card.dart
│   ├── meal_item.dart
│   └── shopping_list_item.dart
├── theme/                    # Дизайн приложения
│   ├── app_theme.dart
│   └── colors.dart
└── routes/                   # Навигация
    └── router.dart

```

## 🚀 Начало работы

### Требования

- Flutter 3.0.0 или выше
- Firebase аккаунт
- API ключи (если используются)

### Установка

1. Клонируйте репозиторий:
```bash
git clone https://github.com/tamerlantulentaev-hash/meal-planner.git
cd meal-planner
```

2. Установите зависимости:
```bash
flutter pub get
```

3. Сконфигурируйте Firebase:
```bash
flutterfire configure
```

4. Запустите приложение:
```bash
flutter run
```

## 📦 Зависимости

### State Management
- `flutter_riverpod` - Управление состоянием приложения

### Database
- `sqflite` - Локальная база данных SQLite

### Authentication
- `firebase_auth` - Аутентификация через Firebase

### Networking
- `http` - HTTP запросы
- `dio` - Advanced HTTP клиент

### UI
- `go_router` - Навигация между экранами
- `flutter_staggered_grid_view` - Сложные сетки
- `cached_network_image` - Кэширование изображений
- `fl_chart` - Графики для прогресса

### Utils
- `intl` - Интернационализация
- `uuid` - Генерация уникальных ID

## 🔧 Конфигурация

### Firebase

Обновите `lib/firebase_options.dart` с вашими Firebase credentials:

```dart
static const FirebaseOptions android = FirebaseOptions(
  apiKey: 'YOUR_ANDROID_API_KEY',
  appId: 'YOUR_ANDROID_APP_ID',
  messagingSenderId: 'YOUR_ANDROID_MESSAGING_SENDER_ID',
  projectId: 'YOUR_PROJECT_ID',
  // ...
);
```

## 🎨 Дизайн

### Цветовая схема
- **Primary:** #6B5B95 (Purple)
- **Secondary:** #FF6B6B (Red)
- **Accent:** #4ECDC4 (Teal)
- **Success:** #51CF66 (Green)
- **Error:** #E63946 (Red)

### Типография
- Font Family: Poppins
- Поддержка Light, Regular, SemiBold, Bold весов

## 📝 JSON Сериализация

Для генерации JSON serializable кода:

```bash
flutter pub run build_runner build
```

## 🧪 Тестирование

```bash
flutter test
```

## 🤝 Внесение вклада

1. Сделайте fork репозитория
2. Создайте ветку для вашего изменения (`git checkout -b feature/AmazingFeature`)
3. Закоммитьте изменения (`git commit -m 'Add some AmazingFeature'`)
4. Сделайте push в ветку (`git push origin feature/AmazingFeature`)
5. Откройте Pull Request

## 📄 Лицензия

Этот проект лицензирован под MIT License - см. файл [LICENSE](LICENSE) для деталей.

## 👨‍💻 Автор

**Тамерлан Тулентаев**
- GitHub: [@tamerlantulentaev-hash](https://github.com/tamerlantulentaev-hash)

## 📞 Поддержка

Если у вас возникли вопросы или проблемы, пожалуйста создайте Issue в репозитории.

## 🗺️ Дорожная карта

- [ ] Реализовать все экраны UI
- [ ] Интегрировать API для рецептов
- [ ] Добавить AI чат помощника
- [ ] Реализовать Push уведомления
- [ ] Добавить синхронизацию облака
- [ ] Реализовать премиум подписку
- [ ] Добавить экспорт в PDF
- [ ] Реализовать социальное общение

---

Made with ❤️ by Tamerlan Tulentaev
