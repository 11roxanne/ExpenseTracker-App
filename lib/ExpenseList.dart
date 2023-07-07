import 'package:flutter/cupertino.dart';
import 'ExpenseItem.dart';
import 'Model/ExpenseModel.dart';
import 'Expense.dart';


class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses, required this.onremoveExpense,
  });

  final List<ExpenseModel> expenses;
  final void Function(Expense expense) onremoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (direction){
          onremoveExpense(expenses[index] as Expense);
        },
        child: ExpenseItem(expense: expenses[index]),
      ) ,
    );
  }
}
