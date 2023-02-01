import 'package:flutter/material.dart';

import 'package:expenses_app/transations/transaction.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  bool _showChart = false;

  void _showAddTransaction(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return const NewTransaction();
      },
    );
  }

  Widget _buildChartSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Show chart'),
        Switch.adaptive(
          value: _showChart,
          onChanged: (value) {
            setState(() {
              _showChart = value;
            });
          },
        )
      ],
    );
  }

  List<Widget> _buildChartList(AppBar appBar, bool isLandscape) {
    if (isLandscape) {
      return [
        _showChart
            ? Chart(appBar.preferredSize.height)
            : TransactionList(appBar.preferredSize.height),
      ];
    } else {
      return [
        Chart(appBar.preferredSize.height),
        TransactionList(appBar.preferredSize.height),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      title: const Text('Expenses App'),
      centerTitle: true,
      actions: [
        FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.purple[300],
          onPressed: () => _showAddTransaction(context),
          child: const Icon(Icons.add),
        )
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandscape) _buildChartSelector(),
            ..._buildChartList(appBar, isLandscape),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.purple[300],
        onPressed: () => _showAddTransaction(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
