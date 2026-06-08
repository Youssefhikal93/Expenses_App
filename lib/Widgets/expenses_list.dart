import 'package:expenses_app/Widgets/expenses_lis_items.dart';
import 'package:expenses_app/models/expense_model.dart';
import 'package:flutter/widgets.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<ExpenseModel> expenses;
  final void Function(int expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (_) => onRemoveExpense(index),
        child: ExpensesListItems(expenseItem: expenses[index]),
      ),
    );
  }
}
