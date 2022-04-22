import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_app/new_transaction.dart';
import './transaction.dart';
import 'transactionList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      // home: myhomepage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        fontFamily: 'Montserrat',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline1: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
    );
  }
}

class myhomepage extends StatefulWidget {
  @override
  State<myhomepage> createState() => _MyAppState();
}

class _MyAppState extends State<myhomepage> {
  final List<Transaction> _usertransaction = [
    Transaction(
        amount: 23.44, date: DateTime.now(), id: 'xyz', title: 'Grocery'),
    Transaction(
        amount: 53.44, date: DateTime.now(), id: 'xyzp', title: 'Pencils'),
  ];

  void _NewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        amount: txAmount,
        date: DateTime.now(),
        title: txTitle);

    setState(() {
      _usertransaction.add(newTx);
    });
  }

  void _StartAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_NewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  final textcontroller = TextEditingController();
  final amountcontroller = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses',style:Theme.of(context).appBarTheme.titleTextStyle,),
        actions: <Widget>[
          IconButton(
              onPressed: () => _StartAddNewTransaction(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            child: Container(
              child: Text('head'),
              color: Colors.blue,
              width: double.infinity,
            ),
          ),
          TransactionList(_usertransaction)
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle),
        onPressed: () => _StartAddNewTransaction(context),
      ),
    );
  }
}
