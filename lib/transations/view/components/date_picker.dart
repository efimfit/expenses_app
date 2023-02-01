import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  const DatePicker(this.constraints, this.showDatePicker, this.selectedDate,
      {super.key});

  final BoxConstraints constraints;
  final VoidCallback showDatePicker;
  final DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints.maxHeight * 0.15,
      child: Row(
        children: [
          Expanded(
            child: Text(selectedDate == null
                ? 'No date is chosen'
                : 'Picked date: ${DateFormat('MMMM, d').format(selectedDate!)}'),
          ),
          ElevatedButton(
            onPressed: showDatePicker,
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.orange[600]),
            child: const Text('Choose date'),
          ),
        ],
      ),
    );
  }
}
