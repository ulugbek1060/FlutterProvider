import 'dart:collection';

import 'package:flutter/material.dart';

import '../bread_crumb.dart';

// ignore: must_be_immutable
class BreaadCrumbsWidget extends StatelessWidget {
  UnmodifiableListView<BreadCrumb> breadCrumbs;
  BreaadCrumbsWidget({
    super.key,
    required this.breadCrumbs,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: breadCrumbs.map(
        (breadCrumb) {
          return Text(
            breadCrumb.title,
            style: TextStyle(
              color: breadCrumb.isActive ? Colors.blue : Colors.black,
            ),
          );
        },
      ).toList(),
    );
  }
}
