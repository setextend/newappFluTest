import 'package:flutter/material.dart';

class ExpandedContent extends StatelessWidget {
  final String content;

  const ExpandedContent({required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(content, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
