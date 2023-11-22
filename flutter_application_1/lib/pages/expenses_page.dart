import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/expense.dart';
import 'package:flutter_application_1/widgets/expense_item.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage(this.expenses, this.onRemove, this.onInsert, {Key? key})
      : super(key: key);
  final List<Expense> expenses;
  final void Function(Expense expense) onRemove;
  final void Function(Expense expense) onInsert;

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 150,
          child: Text(
            "Grafik Bölümü",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.expenses.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: ValueKey(widget.expenses[index]),
                child: ExpenseItem(widget.expenses[index]),
                onDismissed: (direction) {
                  Expense removedExpense = widget.expenses[index];
                  widget.onRemove(removedExpense);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: const Text(
                          "Harcama başarıyla silindi!",
                          style: TextStyle(fontSize: 14),
                        ),
                        action: SnackBarAction(
                          label: 'Geri Al',
                          onPressed: () {
                            setState(() {
                              widget.onInsert(removedExpense);
                            });
                          },
                        )),
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(
          height: 150,
        )
      ]),
    );
  }
}
