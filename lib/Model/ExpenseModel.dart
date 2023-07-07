import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';


final uuid = Uuid();

enum Category {
  food,
  travel,
  leisure,
  work,
}
const categoryIcons= {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,

};
class ExpenseModel {
  ExpenseModel({
    required this.amount,
    required this.date,
    required this.title,
    required this.category,git remote add origin https://github.com/11roxanne/Expense-Tracker.git
  }) : id = uuid.v4();

  final double amount;
  final DateTime date;
  final String title;
  final String id;
  final Category category;
}
