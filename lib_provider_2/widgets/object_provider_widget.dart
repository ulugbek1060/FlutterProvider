import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/object_provider.dart';

class ObjectProviderWidget extends StatelessWidget {
  const ObjectProviderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ObjectProvider>();
    return Container(
      height: 100,
      color: Colors.cyanAccent,
      child: Column(
        children: [
          const Text('Expensive Widget'),
          const Text('Last updated:'),
          Text(provider.id)
        ],
      ),
    );
  }
}
