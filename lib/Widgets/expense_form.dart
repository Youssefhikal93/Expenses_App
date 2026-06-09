import 'dart:io';

import 'package:expenses_app/models/expense_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

final dateFormatter = DateFormat.yMd();

class ExpensesForm extends StatefulWidget {
  const ExpensesForm({super.key, required this.onAddExpense});
  final void Function(ExpenseModel expense) onAddExpense;

  @override
  State<StatefulWidget> createState() {
    return _ExpensesFormState();
  }
}

class _ExpensesFormState extends State<ExpensesForm> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? _selectedDate;
  Category selectedCategory = Category.leisure;

  bool get _isValid {
    final amount = double.tryParse(amountController.text);
    return titleController.text.trim().isNotEmpty &&
        amount != null &&
        amount > 0 &&
        _selectedDate != null;
  }

  // @override
  // void initState() {
  //   super.initState();
  //   titleController.addListener(
  //     () => setState(() {}),
  //   ); // rebuild when title changes
  //   amountController.addListener(
  //     () => setState(() {}),
  //   ); // rebuild when amount changes
  // }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void datePicker() async {
    final now = DateTime.now();
    final startDate = DateTime(now.year - 1);

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: startDate,
      lastDate: now,
    );

    setState(() {
      _selectedDate = selectedDate;
    });
  }

  void _showDialog() {
    Platform.isIOS
        ? showCupertinoDialog(
            context: context,
            builder: (ctx) => CupertinoAlertDialog(
              title: Text("Invalid input!"),
              content: Text("One of are wrong buddy!"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: Text("Oki doki from IOS "),
                ),
              ],
            ),
          )
        : showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text("Invalid input!"),
              content: Text("One of are wrong buddy!"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: Text("Oki doki from Andriod"),
                ),
              ],
            ),
          );
  }

  void _submit() {
    if (!_isValid) {
      _showDialog();
      return;
    }
    var toAdd = ExpenseModel(
      title: titleController.text,
      amount: double.parse(amountController.text),
      date: _selectedDate!,
      category: selectedCategory,
    );
    widget.onAddExpense(toAdd);
    Navigator.pop(context);
  }

  // we can use the LayoutBuilder to get the available width
  //and adapt the layout accordingly,
  //but for simplicity,
  //we will just use a SingleChildScrollView to make sure the content is scrollable when the keyboard is open.
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            16,
            16,
            16,
            16 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                maxLength: 20,
                decoration: InputDecoration(label: Text("Title")),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixText: "SEK ",
                        label: Text(" Amount"),
                      ),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _selectedDate == null
                              ? "Date"
                              : dateFormatter.format(_selectedDate!).toString(),
                        ),
                        IconButton(
                          onPressed: () => datePicker(),
                          icon: Icon(Icons.calendar_month_outlined),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30), // more space before dropdown
              DropdownButtonFormField(
                initialValue: selectedCategory,
                decoration: InputDecoration(
                  labelText:
                      "Category", // same underline style as the other fields
                ),
                items: Category.values
                    .map(
                      (el) => DropdownMenuItem(
                        value: el,
                        child: Text(el.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton.icon(
                    // onPressed: _isValid ? () => _submit() : null,
                    onPressed: () => _submit(),
                    label: Text("Submit"),
                    icon: Icon(Icons.save),
                  ),
                  Spacer(),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    label: Text("Back"),
                    icon: Icon(Icons.backspace_outlined),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
