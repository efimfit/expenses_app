import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:expenses_app/transations/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.appBarHeight, {super.key});

  final double appBarHeight;

  double defineChartHeight(BuildContext ctx) {
    final mediaQuery = MediaQuery.of(ctx);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final preferredHeight =
        !isLandscape && ctx.read<TransactionsBloc>().state.transactions.isEmpty
            ? 0.4
            : 0.65;
    final listHeight =
        (mediaQuery.size.height - mediaQuery.padding.top - appBarHeight) *
            preferredHeight;
    return listHeight;
  }

  @override
  Widget build(BuildContext context) {
    final listHeight = defineChartHeight(context);

    return BlocSelector<TransactionsBloc, TransactionsState, List<Transaction>>(
      selector: (state) => state.transactions,
      builder: (context, state) {
        return SizedBox(
          height: listHeight,
          child: state.isEmpty
              ? const EmptyList()
              : ListView(
                  children: state.map((e) {
                  return ListItem(
                    transaction: e,
                    key: ValueKey(e.id),
                  );
                }).toList()),
        );
      },
    );
  }
}
