import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Model/ExpenseModel.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key, required this.onSaveExpense}) : super(key: key);
  final void Function(ExpenseModel expense) onSaveExpense;

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  String enteredTitle = '';
  String enteredAmount = '';
  DateTime selectedDate = DateTime.now();
  Category selectedCategory = Category.food;

  void titleInput(String inputValue) {
    setState(() {
      enteredTitle = inputValue;
    });
  }

  void amountInput(String amountValue) {
    setState(() {
      enteredAmount = amountValue;
    });
  }

  void datePicker() {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month - 1, now.day);

    showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedDate = value;
        });
      }
    });
  }

  void categoryChanged(Category? newValue) {
    if (newValue != null) {
      setState(() {
        selectedCategory = newValue;
      });
    }
  }

  void submitExpense() {
    final amountIsInvalid = enteredAmount.isEmpty || enteredAmount == '0';

    if (enteredTitle.trim().isEmpty || amountIsInvalid || selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text(
              "Please make sure to enter a valid title, amount, date, and category."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("Okay"),
            ),
          ],
        ),
      );
      return;
    }

    final expense = ExpenseModel(
      title: enteredTitle,
      amount: double.parse(enteredAmount),
      date: selectedDate,
      category: selectedCategory,
    );

    widget.onSaveExpense(expense);

    // Clear the input fields
    setState(() {
      enteredTitle = '';
      enteredAmount = '';
      selectedDate = DateTime.now();
      selectedCategory = Category.food;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            onChanged: titleInput,
            maxLength: 50,
            decoration: const InputDecoration(
              labelText: "Title",
              suffixStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: amountInput,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: "Amount",
                    suffixStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Selected date'),
                  IconButton(
                    onPressed: datePicker,
                    icon: const Icon(
                      Icons.calendar_month,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              DropdownButton<Category>(
                value: selectedCategory,
                items: Category.values.map(
                      (category) => DropdownMenuItem<Category>(
                    value: category,
                    child: Text(
                      category.name.toUpperCase(),
                    ),
                  ),
                ).toList(),
                onChanged: categoryChanged,
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  print(enteredAmount);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: submitExpense,
                child: const Text("Save Expense"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



  
