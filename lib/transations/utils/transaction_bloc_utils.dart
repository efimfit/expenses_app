import 'package:intl/intl.dart';

import 'package:expenses_app/transations/transaction.dart';

class TransactionBlocUtils {
  static double totalSpending(List<Map<String, Object>> groupedValues) {
    return groupedValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  static List<Map<String, Object>> groupedValues(
      List<Transaction> transactions) {
    final recentTransactions = transactions.where((e) {
      return e.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();

    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double daySum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day) {
          daySum += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 3),
        'amount': daySum
      };
    }).reversed.toList();
  }
}
