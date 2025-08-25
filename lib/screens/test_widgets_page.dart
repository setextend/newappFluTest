import 'package:flutter/material.dart';

class TestWidgetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Hello World"),
            Icon(Icons.cake, color: Colors.red, size: 200),
          ],
        ),
      ),
    );
  }
}
