import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  final List<String> categories;
  final Function(String category)? onChange;

  const Filter({
    this.categories = const [],
    this.onChange,
  });

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  String? _activeElement;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Categories',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black38,
            fontSize: 25,
          ),
        ),
        ...widget.categories.map(
          (categories) => GestureDetector(
            onTap: () {
              setState(() {
                _activeElement = categories;
              });
              widget.onChange?.call(categories);
            },
            child: Container(
              decoration: BoxDecoration(
                color: categories == _activeElement ? Colors.blueAccent : null,
              ),
              child: Text(
                categories,
                style: const TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
