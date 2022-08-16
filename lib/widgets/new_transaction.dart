import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          TextField(
            controller: amountController,
            decoration: const InputDecoration(
              labelText: 'Amount',
            ),
          ),
          FlatButton(
            textColor: Colors.purple,
            child: const Text('Add Transaction'),
            onPressed: () {
              addTx(titleController.text, double.parse(amountController.text));
            },
          )
        ]),
      ),
    );
  }
}
