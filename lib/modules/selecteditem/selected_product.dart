import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectedItem extends StatefulWidget {
  const SelectedItem({Key? key,
    required this.name,
    required this.description,
    required this.buy,
    required this.sell,
    required this.value,



  }) : super(key: key);

  final String name,description;
  final String buy, sell;
  final bool value;

  @override
  State<SelectedItem> createState() => _SelectedItemState();
}

class _SelectedItemState extends State<SelectedItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'selling product',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(widget.name),
          Text(widget.description),
          Text(widget.buy),
          Text(widget.sell),

        ],
      ) ,
    );
  }
}
