import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void submitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop(); // closes the top most widget
    // available na yung context kasi ini extend na natin yung State
  }

  void _presentDatePicker() {
    showDatePicker(
      // function used to show an overlay datepicker on the screen
      context: context,
      initialDate: DateTime.now(), firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
    // showDatePicker returns a Future, this is from Dart,
    // Futures are classes that allows us to get a value from a future such as HTTP Request
    //
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
          Container(
            height: 70,
            child: Row(
              children: [
                Text(_selectedDate == null
                    ? 'No Date Chosen'
                    : DateFormat.yMd().format(_selectedDate)),
                FlatButton(
                  onPressed: _presentDatePicker,
                  textColor: Theme.of(context).primaryColor,
                  child: Text(
                    'Choose Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          RaisedButton(
            textColor: Colors.white,
            color: Theme.of(context).primaryColor,
            onPressed: submitData,
            child: const Text('Add Transaction'),
          )
        ]),
      ),
    );
  }
}
