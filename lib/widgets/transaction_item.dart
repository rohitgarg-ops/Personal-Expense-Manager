import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required Transaction transaction,
    required Function deleteTransaction,
  })  : _transaction = transaction,
        _deleteTransaction = deleteTransaction;

  final Transaction _transaction;
  final Function _deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 3),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(child: Text('₹${_transaction.amount}')),
          ),
        ),
        title: Text(
          _transaction.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          (DateFormat.yMMMd().format(_transaction.date)),
        ),
        trailing: MediaQuery.of(context).size.width < 460
            ? IconButton(
                onPressed: () => _deleteTransaction(_transaction.id),
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
              )
            : TextButton.icon(
                style: TextButton.styleFrom(
                  primary: Theme.of(context).errorColor, // Text Color
                ),
                onPressed: () => _deleteTransaction(_transaction.id),
                label: Text("Delete"),
                icon: Icon(Icons.delete),
              ),
      ),
    );
  }
}
