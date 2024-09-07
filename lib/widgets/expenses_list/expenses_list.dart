import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});
  final List<Expense> expenses;
  final void Function (Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
        color: Theme.of(context).colorScheme.error.withOpacity(0.75),
        margin:Theme.of(context).cardTheme.margin,
        
        ),
        onDismissed:(direction){
        onRemoveExpense(expenses[index]);  
        } ,
        child:  ExpenseItem(expenses[index]),
      ) 
    );
    //Note that we used builder because it tells flutter to create a scrollable list
  }
}
