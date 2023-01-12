import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_provider/bread_crumb_provider.dart';
import 'package:testing_provider/new_bread_crumb_screen.dart';
import 'package:testing_provider/widgets/bread_crumb_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BreadCrumbProvider>(
      create: (ctx) => BreadCrumbProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(),
        routes: {
          '/new': (_) => const NewBreadCrumbScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Consumer<BreadCrumbProvider>(
            builder: ((context, value, child) {
              return BreaadCrumbsWidget(breadCrumbs: value.items);
            }),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/new');
            },
            child: const Text('Add a new bread crumb'),
          ),
          TextButton(
            onPressed: () {
              context.read<BreadCrumbProvider>().reset();
            },
            child: const Text('Reset'),
          )
        ],
      ),
    );
  }
}
