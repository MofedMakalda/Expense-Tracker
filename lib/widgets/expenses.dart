import 'package:expense_tracker_app/widgets/chart/chart.dart';
import 'package:expense_tracker_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expenses_list.dart';
class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title:'Ciname',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    
  ];

  void _openAddExpenseOverlay(){
   showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder:(ctx)=>  NewExpense(onAddExpense: _addExpense),
   ); 
  }

  void _addExpense (Expense expense){
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense (Expense expense){
    final expenseIndex = _registeredExpenses.indexOf(expense); 
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      action: SnackBarAction(label: 'Undo', onPressed: (){
      setState(() {
      _registeredExpenses.insert(expenseIndex, expense); 
      });  
      }),
      duration: const Duration(seconds: 5) ,
      content: const Text('Expense Deleted.'),));
  }


  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text('No Expenses Found. Start Adding Some!'),
    );
    if (_registeredExpenses.isNotEmpty){
    mainContent = ExpensesList(expenses: _registeredExpenses, onRemoveExpense:_removeExpense ,);
    }
    return Scaffold(
      appBar: AppBar(
      title: const Text('ExpenseTracker'),
      actions: [
        IconButton(
          onPressed: _openAddExpenseOverlay,
          icon:const Icon(Icons.add),
          )
      ],  
      ),
      body: Column(children: [
        Chart(expenses: _registeredExpenses),
        Expanded(child:mainContent 
        ),
      ]
      ),
    );
  }
}
