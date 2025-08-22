import 'package:flutter/material.dart';

class SmartScaffold extends StatelessWidget {
  final String titleKey;
  final Widget body;
  final List<Widget>? actions;

  const SmartScaffold({
    super.key,
    required this.body,
    this.titleKey = 'Smart Scaffold',
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titleKey), actions: actions),
      body: Stack(
        children: [
          body,
          _buildErrorOverlay(context),
          _buildLoadingOverlay(context),
        ],
      ),
    );
  }

  Widget _buildErrorOverlay(BuildContext context) {
    return Container(); // Replace with actual error overlay widget
  }

  Widget _buildLoadingOverlay(BuildContext context) {
    return Container(); // Replace with actual loading overlay widget
  }
}
