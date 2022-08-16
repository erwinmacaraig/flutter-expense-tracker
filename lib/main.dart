import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 35.25,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.25,
      date: DateTime.now(),
    ),
  ];

  // late String titleInput;
  // late String amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Planner'),
      ),
      body: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: double.infinity,
              child: const Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('CHART'),
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(
                        // onChanged: (val) {
                        //   titleInput = val;
                        // },
                        controller: titleController,
                        decoration: const InputDecoration(
                          labelText: 'Title',
                        ),
                      ),
                      TextField(
                        // onChanged: (val) {
                        //   amountInput = val;
                        // },
                        controller: amountController,
                        decoration: const InputDecoration(
                          labelText: 'Amount',
                        ),
                      ),
                      FlatButton(
                        textColor: Colors.purple,
                        child: Text('Add Transaction'),
                        onPressed: () {
                          print(titleController.text);
                        },
                      )
                    ]),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 2),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '\$${tx.amount}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(DateFormat.yMMMd().format(tx.date),
                            style: const TextStyle(color: Colors.grey))
                      ],
                    )
                  ]),
                );
              }).toList(),
            )
          ]),
    );
  }
}
