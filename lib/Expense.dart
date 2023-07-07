import 'package:flutter/material.dart';
import 'ExpenseList.dart';
import 'Model/ExpenseModel.dart';
import 'NewExpense.dart';

class Expense extends StatefulWidget {
  const Expense({Key? key}) : super(key: key);

  @override
  _ExpenseState createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final List<ExpenseModel> _registeredExpenses = [
    ExpenseModel(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    ExpenseModel(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void addExpense() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(
        onSaveExpense: saveExpense,
      ),
    );
  }

  void saveExpense(ExpenseModel expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void removeExpense(Expense expense){
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Color.fromRGBO(109, 187, 213, 1.0),
        title: const Text(
          "Expense Tracker",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: addExpense,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo, Colors.cyan],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ExpenseList(expenses: _registeredExpenses,
                onremoveExpense: removeExpense,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

