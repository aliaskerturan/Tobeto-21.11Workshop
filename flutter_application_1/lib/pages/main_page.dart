import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/expense.dart';
import 'package:flutter_application_1/pages/expenses_page.dart';
import 'package:flutter_application_1/widgets/new_expense.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Expense> expenses = [
    Expense(
        name: "Yemek",
        price: 500,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        name: "Yemek",
        price: 500,
        date: DateTime.now(),
        category: Category.travel),
  ];

  List<Expense> insertExpenses = [];

  addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  removeExpense(Expense expense) {
    setState(() {
      insertExpenses.add(expense);
      expenses.remove(expense);
    });
  }

  insertExpense(Expense expense) {
    setState(() {
      if (insertExpenses.isNotEmpty) {
        addExpense(insertExpenses.last);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ExpenseApp",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return NewExpense(addExpense);
                    });
              },
              icon: const Icon(Icons.add))
        ],
        centerTitle: true,
      ),
      body: ExpensesPage(expenses, removeExpense, insertExpense),
    );
  }
}
