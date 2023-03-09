part of 'transactions_bloc.dart';

class TransactionsState {
  const TransactionsState({
    this.transactions = const [],
    this.grouped = const [],
    this.totalSpending = 0.0,
  });

  final List<Transaction> transactions;
  final List<Map<String, Object>> grouped;
  final double totalSpending;

  TransactionsState copyWith({
    List<Transaction>? transactions,
    List<Map<String, Object>>? grouped,
    double? totalSpending,
  }) {
    return TransactionsState(
      transactions: transactions ?? this.transactions,
      grouped: grouped ?? this.grouped,
      totalSpending: totalSpending ?? this.totalSpending,
    );
  }
}
