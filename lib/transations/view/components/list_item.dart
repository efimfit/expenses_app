import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:expenses_app/transations/transaction.dart';

class ListItem extends StatefulWidget {
  const ListItem({
    required Key key,
    required this.transaction,
  }) : super(key: key);

  final Transaction transaction;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  late Color _circleColor;

  @override
  void initState() {
    final availableColors = [
      Colors.red,
      Colors.blue,
      Colors.orange,
      Colors.purple
    ];
    _circleColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _circleColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${widget.transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle:
            Text(DateFormat('d MMMM, H:m').format(widget.transaction.date)),
        trailing: DeleteButton(widget.transaction.id),
      ),
    );
  }
}
