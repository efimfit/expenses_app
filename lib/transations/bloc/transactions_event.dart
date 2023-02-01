part of 'transactions_bloc.dart';

abstract class TransactionsEvent {
  const TransactionsEvent();
}

class TransactionAdded extends TransactionsEvent {
  final Transaction newTransaction;

  const TransactionAdded(this.newTransaction);
}

class TransactionDeleted extends TransactionsEvent {
  final String id;

  const TransactionDeleted(this.id);
}

class GroupedValuesFetched extends TransactionsEvent {
  const GroupedValuesFetched();
}
