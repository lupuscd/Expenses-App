import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount < 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              autocorrect: true,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primaryVariant,
                ),
              ),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              autocorrect: true,
              decoration: InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primaryVariant,
                ),
              ),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              onSubmitted: (_) =>
                  submitData(), //auti i morfi deixnei oti pairnei value alla den mas noiazei
            ),
            TextButton(
              onPressed: submitData,
              child: Text('Add'),
              style: TextButton.styleFrom(
                primary: Theme.of(context).colorScheme.primaryVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
