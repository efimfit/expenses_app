import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:expenses_app/transations/transaction.dart';

class Chart extends StatelessWidget {
  const Chart(this.appBarHeight, {super.key});

  final double appBarHeight;

  double defineChartHeight(BuildContext ctx) {
    final mediaQuery = MediaQuery.of(ctx);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final preferredHeight = isLandscape ? 0.6 : 0.3;
    final chartHeight =
        (mediaQuery.size.height - mediaQuery.padding.top - appBarHeight) *
            preferredHeight;
    return chartHeight;
  }

  @override
  Widget build(BuildContext context) {
    final chartHeight = defineChartHeight(context);

    return SizedBox(
      height: chartHeight,
      child: Card(
        elevation: 6,
        margin: const EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: BlocBuilder<TransactionsBloc, TransactionsState>(
            builder: (context, state) {
              final totalSpending = state.totalSpending;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: state.grouped.map((data) {
                  return Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(
                        label: data['day'] as String,
                        spendingAmount: data['amount'] as double,
                        spendingPercentage: totalSpending == 0.0
                            ? 0.0
                            : (data['amount'] as double) / totalSpending),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
