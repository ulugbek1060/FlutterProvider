import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/object_provider.dart';
import '../provider/objects.dart';

class ExpensiveWidget extends StatelessWidget {
  const ExpensiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final expensiveObject = context.select<ObjectProvider, ExpensiveObject>(
      (provider) => provider.expensiveObject,
    );
    return Container(
      height: 100,
      color: Colors.blue,
      child: Column(
        children: [
          const Text('Expensive Widget'),
          const Text('Last updated:'),
          Text(expensiveObject.lastUpdated)
        ],
      ),
    );
  }
}
