import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/expense.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense(this.onAdd, {super.key});
  final void Function(Expense expense) onAdd;
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var selectedDate = DateTime.now();
  var expenseNameController = TextEditingController();
  var expensePriceController = TextEditingController();
  var expenseDateController = TextEditingController();
  Category selectedCategory = Category.work;

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: expenseNameController,
              maxLength: 50,
              decoration: const InputDecoration(labelText: "Harcama Adı"),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: expensePriceController,
                    decoration: const InputDecoration(
                        labelText: "Harcama Miktarı", prefixText: "₺"),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      selectDate();
                    },
                    icon: Icon(Icons.calendar_month)),
                Text(DateFormat.yMd().format(selectedDate)),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                DropdownButton(
                    value: selectedCategory,
                    items: Category.values.map((category) {
                      return DropdownMenuItem(
                          value: category, child: Text(category.name));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        if (value != null) {
                          selectedCategory = value;
                        }
                      });
                      print(value);
                    }),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Kapat"),
                ),
                const SizedBox(
                  width: 12,
                ),
                ElevatedButton(
                  onPressed: () {
                    double? price =
                        double.tryParse(expensePriceController.text);
                    Expense expense = Expense(
                        name: expenseNameController.text,
                        price: price!,
                        date: selectedDate,
                        category: selectedCategory);
                    widget.onAdd(expense);
                    Navigator.pop(context);
                  },
                  child: const Text("Ekle"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
