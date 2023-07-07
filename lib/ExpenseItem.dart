import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Model/ExpenseModel.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({required this.expense});

  final ExpenseModel expense;

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd'); // Create a date formatter
    final String formattedDate = formatter.format(expense.date); // Format the date

    return Card(
      margin: EdgeInsets.all(13),
      // It displays items in an elevated container
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 20,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height:8),
              Text(expense.title, style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',

              ),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Text('\$${expense.amount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',

                  )
                  ), // Format amount with 2 decimal places
                  const Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[expense.category]), // Use the corresponding icon for the category
                      const SizedBox(width: 8),
                      Text(formattedDate,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',

                      ),), // Display the formatted date
                    ],
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
