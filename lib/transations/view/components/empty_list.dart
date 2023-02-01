import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          SizedBox(
            height: constraints.maxHeight * 0.1,
          ),
          SizedBox(
            height: constraints.maxHeight * 0.1,
            child: FittedBox(
              child: Text(
                'No transactions now',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.1,
          ),
          SizedBox(
            height: constraints.maxHeight * 0.7,
            child: Image.asset(
              'assets/images/empty_list.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      );
    });
  }
}
