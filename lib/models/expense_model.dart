import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();
final dateFormatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

class ExpenseModel {
  ExpenseModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDAte => dateFormatter.format(date);

  Icon get categoryIcon => switch (category) {
    Category.food => const Icon(Icons.lunch_dining_outlined),
    Category.travel => const Icon(Icons.flight_takeoff),
    Category.leisure => const Icon(Icons.movie),
    Category.work => const Icon(Icons.work),
  };
}
