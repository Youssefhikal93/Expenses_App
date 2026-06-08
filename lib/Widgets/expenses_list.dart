import 'package:expenses_app/Widgets/expenses_lis_items.dart';
import 'package:expenses_app/models/expense_model.dart';
import 'package:flutter/widgets.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<ExpenseModel> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) =>
          ExpensesListItems(expenseItem: expenses[index]),
    );
  }
}
