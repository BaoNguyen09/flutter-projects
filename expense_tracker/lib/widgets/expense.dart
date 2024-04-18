import 'package:expense_tracker/widgets/expense_form.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_list/expense_list.dart';


class Expense extends StatefulWidget {
  const Expense({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpenseState();
  }
}
class _ExpenseState extends State<Expense> {
  final List<ExpenseM> _registeredexpenses = [
    ExpenseM(
      title: 'Grocery',
      amount: 49.9,
      date: DateTime.now(),
      category: Category.food,
    ),
    ExpenseM(
      title: 'House Rent',
      amount: 787.5,
      date: DateTime.now(),
      category: Category.rent,
    ),
    
  ];
   void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, // this context is related to info of this Expense Widget
      builder: (ctx) { // this ctx is related to this showModalBottomSheet info
        return ExpenseForm(onAddExpense: addExpense);
      })
    ;
   } 

  void addExpense(ExpenseM expense) {
    setState(() {
      _registeredexpenses.add(expense);
    });
  }

  void removeExpense(ExpenseM expense) {
    final index = _registeredexpenses.indexOf(expense);
    setState(() {
      _registeredexpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Expense Deleted"),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: "Undo", 
          onPressed: () {
            setState(() {
              _registeredexpenses.insert(index, expense);
            });
          }
          ),
      ),
    );
  }

  
  @override
  Widget build(context) {
  Widget mainContent = const Center(
    child: Text("No expenses. Add some!!!")
    );
  if (_registeredexpenses.isNotEmpty) {
    mainContent = Expanded(child: ExpenseList(
                    expenses: _registeredexpenses,
                    onRemoved: removeExpense,
                  ));
  }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add)
            ),
        ],),
      body: Column(
        children: [
          const Text('The chart'),
          mainContent,
        ],
      ),
    );
  }
}