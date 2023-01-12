import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_provider/bread_crumb.dart';
import 'package:testing_provider/bread_crumb_provider.dart';

void main() {
  runApp(MaterialApp());
}

class NewBreadCrumbScreen extends StatefulWidget {
  const NewBreadCrumbScreen({super.key});

  @override
  State<NewBreadCrumbScreen> createState() => _NewBreadCrumbScreenState();
}

class _NewBreadCrumbScreenState extends State<NewBreadCrumbScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void addNewBreadCrumb(BuildContext ctx) {
    final text = _controller.text;
    if (text.isEmpty) return;
    final newBreadCrumb = BreadCrumb(name: text, isActive: false);
    ctx.read<BreadCrumbProvider>().add(newBreadCrumb);
    Navigator.of(ctx).pop();
    Provider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new bread crumb'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Add a new bread crumb',
            ),
          ),
          TextButton(
            onPressed: () {
              addNewBreadCrumb(context);
            },
            child: const Text('Add'),
          )
        ],
      ),
    );
  }
}
