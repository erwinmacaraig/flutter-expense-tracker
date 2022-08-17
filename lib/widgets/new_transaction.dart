import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addTx(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            controller: titleController,
            onSubmitted: (_) => submitData(),
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
            decoration: const InputDecoration(
              labelText: 'Amount',
            ),
          ),
          FlatButton(
            textColor: Colors.purple,
            child: const Text('Add Transaction'),
            onPressed: submitData,
          )
        ]),
      ),
    );
  }
}
