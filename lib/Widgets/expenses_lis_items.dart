import 'package:expenses_app/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpensesListItems extends StatelessWidget {
  const ExpensesListItems({super.key, required this.expenseItem});

  final ExpenseModel expenseItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(expenseItem.title),
            SizedBox(height: 10),
            Row(
              children: [
                Text("${expenseItem.amount.toStringAsFixed(2)} SEK"),
                Spacer(),
                Row(
                  children: [
                    expenseItem.categoryIcon,
                    SizedBox(width: 8),
                    Text(expenseItem.formattedDAte),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
