import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expenses, {super.key});
  final ExpenseM expenses;

  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expenses.title),
            const SizedBox(height: 10),
            Row(
              children: [
                Text('\$${expenses.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expenses.category]),
                    const SizedBox(width: 6),
                    Text(expenses.formattedDate),
                  ],
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}