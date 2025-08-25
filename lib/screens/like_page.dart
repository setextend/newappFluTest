import 'package:flutter/material.dart';
import 'package:newfapp/main.dart';
import 'package:provider/provider.dart';

class LikePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    if (appState.favorites.contains(pair)) {
    } else {}

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Liked messages:"),
          for (var msg in appState.favorites)
            Text(msg.asLowerCase, semanticsLabel: "${msg.first} ${msg.second}"),
        ],
      ),
    );
  }
}
