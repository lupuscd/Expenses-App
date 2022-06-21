import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      child: ListView.builder(
        itemBuilder: (contxt, index) {
          return Card(
            elevation: 5,
            child: Row(children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primaryVariant,
                    width: 4,
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  '€ ${transactions[index].amount.toStringAsFixed(2)}', //to $ deixnei string interpolation, an to ithela mesa tha eprepe \$
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    DateFormat('d/MMM/y')
                        .add_jm()
                        .format(transactions[index].date),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              )
            ]),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
