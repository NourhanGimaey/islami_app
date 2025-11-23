import 'package:flutter/material.dart';

class VerseItem extends StatelessWidget {
  final String verse;
  final int index;
  const VerseItem(this.verse, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$verse{$index}",
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
