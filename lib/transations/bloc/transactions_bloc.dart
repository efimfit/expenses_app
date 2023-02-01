import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:expenses_app/transations/transaction.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc() : super(const TransactionsState()) {
    on<GroupedValuesFetched>(_onGroupedValuesFetched);
    on<TransactionDeleted>(_onTransactionDeleted);
    on<TransactionAdded>(_onTransactionAdded);
  }

  void _onTransactionAdded(
      TransactionAdded event, Emitter<TransactionsState> emit) {
    final newTransactionList = state.transactions..add(event.newTransaction);
    emit(state.copyWith(transactions: newTransactionList));
    add(const GroupedValuesFetched());
  }

  void _onTransactionDeleted(
      TransactionDeleted event, Emitter<TransactionsState> emit) {
    final newTransactionList = state.transactions
      ..removeWhere((e) => e.id == event.id);

    emit(state.copyWith(transactions: newTransactionList));
    add(const GroupedValuesFetched());
  }

  void _onGroupedValuesFetched(
      GroupedValuesFetched event, Emitter<TransactionsState> emit) {
    final groupedValues =
        TransactionBlocUtils.groupedValues(state.transactions);
    final totalSpending = TransactionBlocUtils.totalSpending(groupedValues);
    emit(state.copyWith(grouped: groupedValues, totalSpending: totalSpending));
  }
}
