import 'package:flutter/material.dart';


class NewTransaction extends StatefulWidget {
  final Function addTx;

 NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
 final textcontroller = TextEditingController();

final amountcontroller = TextEditingController();

 void SubmitData(){
   
final Enteredtext = textcontroller.text;
final EnteredAmount = double.parse(amountcontroller.text);

if(Enteredtext.isEmpty || EnteredAmount <= 0){
  return;
}

 widget.addTx(
   Enteredtext,EnteredAmount);

   Navigator.of(context).pop();

 }

  @override
  Widget build(BuildContext context) {
    return  Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(decoration: InputDecoration(labelText: 'Title'),
                    controller: textcontroller,
                       onSubmitted: (_) => SubmitData(),
                    ),
                    TextField(decoration: InputDecoration(labelText: 'Amount'),
                     controller: amountcontroller,
                     keyboardType: TextInputType.number,
                     onSubmitted: (_) => SubmitData(),
                       ),
                    TextButton(onPressed:SubmitData,
                     child: Text('Add Transaction'),
                    //  textColor: Colors.blue,
                     
                     )
                  ],
                ),
              ),
            );
  }
}