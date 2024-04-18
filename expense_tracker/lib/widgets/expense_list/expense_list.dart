import 'package:expense_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
    required this.onRemoved,
  });
  final List<ExpenseM> expenses;
  final void Function(ExpenseM) onRemoved; 
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) {
        return Dismissible(
          key: ValueKey(expenses[index]), 
          onDismissed: (direction) { 
            onRemoved(expenses[index]); 
          },
          child: ExpenseItem(expenses[index])
        );
    });
  }
}