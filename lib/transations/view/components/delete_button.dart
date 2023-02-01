import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:expenses_app/transations/transaction.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton(this.id, {super.key});

  final String id;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 500
        ? ElevatedButton.icon(
            onPressed: () =>
                context.read<TransactionsBloc>().add(TransactionDeleted(id)),
            icon: const Icon(Icons.delete),
            label: const Text('Delete'),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).errorColor),
          )
        : IconButton(
            icon: const Icon(Icons.delete),
            color: Theme.of(context).errorColor,
            onPressed: () =>
                context.read<TransactionsBloc>().add(TransactionDeleted(id)),
          );
  }
}
