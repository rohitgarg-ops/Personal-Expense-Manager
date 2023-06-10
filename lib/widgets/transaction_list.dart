import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/transaction_item.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deleteTransaction;
  TransactionList(this._transactions, this._deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return TransactionItem(
              transaction: _transactions[index],
              deleteTransaction: _deleteTransaction);
        },
        itemCount: _transactions.length,
      ),
    );
  }
}
