# 💸 Expenses Tracker

A Flutter application for tracking personal expenses by category, with a visual horizontal chart overview.

## Features

- **Add expenses** — title, amount, date, and category (Food, Travel, Leisure, Work)
- **Delete expenses** — swipe to dismiss with a "Delete" label and icon
- **Undo delete** — restore a deleted expense via the Snackbar undo action
- **Horizontal bar chart** — visual breakdown of spending per category
- **Dark mode support** — adapts to system theme (light/dark)
- **Green theme** — custom green color scheme for both light and dark modes

## Project Structure

```
lib/
├── main.dart               # App entry point
├── expenses.dart           # Main screen (Scaffold + state)
├── theme.dart              # Light & dark ThemeData
├── models/
│   └── expense_model.dart  # ExpenseModel & ExpenseBucket classes
└── Widgets/
    ├── expense_form.dart        # Modal bottom sheet form to add expenses
    ├── expenses_list.dart       # Dismissible ListView of expenses
    ├── expenses_lis_items.dart  # Individual expense card widget
    └── Charts/
        ├── chart.dart           # Horizontal chart with category icons
        └── chart_bar.dart       # Single horizontal bar widget
```

## Getting Started

### Prerequisites

- Flutter SDK ≥ 3.0
- Dart SDK ≥ 3.0

### Run the app

```bash
flutter pub get
flutter run
```

## Dependencies

| Package | Purpose |
|---------|---------|
| `intl`  | Date formatting |
| `uuid`  | Unique IDs for each expense |


```yaml
# pubspec.yaml
dev_dependencies:
  flutter_launcher_icons: ^0.14.0

flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/icon/icon.png"
```

Then run:
```bash
flutter pub run flutter_launcher_icons
```

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
