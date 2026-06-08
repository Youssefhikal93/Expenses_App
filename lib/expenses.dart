import 'package:expenses_app/Widgets/expense_form.dart';
import 'package:expenses_app/Widgets/expenses_list.dart';
import 'package:expenses_app/models/expense_model.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseModel> dummyData = [
    ExpenseModel(
      title: "title1a",
      amount: 11,
      date: DateTime.now(),
      category: Category.work,
    ),
    ExpenseModel(
      title: "title2",
      amount: 115,
      date: DateTime(2019, 15, 15),
      category: Category.food,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled:
          true, // allows the sheet to resize when the keyboard opens
      context: context,
      builder: (ctx) => ExpensesForm(onAddExpense: addExpense),
    );
  }

  void addExpense(ExpenseModel expenseToAdd) {
    setState(() {
      dummyData.add(expenseToAdd);
    });
  }

  void removeExpense(int indexToRemove) {
    setState(() {
      dummyData.removeAt(indexToRemove);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new expense!"),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("ExpensesApp chart"),
          Expanded(
            child: ExpensesList(
              expenses: dummyData,
              onRemoveExpense: removeExpense,
            ),
          ),
        ],
      ),
    );
  }
}
