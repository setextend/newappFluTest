import 'package:flutter/material.dart';
import 'package:newfapp/features/profile/profile_avatar.dart';

class TestUpperPage extends StatelessWidget {
  final VoidCallback onTap;
  const TestUpperPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white, // цвет границы
                  width: 2.0, // толщина границы
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 37, 164, 180),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProfileAvatar(
                  imageAssetPath: 'assets/images/avatar.png',
                  size: 100,
                  onTap: onTap,
                  borderColor: Colors.white,
                  borderWidth: 2.0,
                ),
                Text("Hello World"),
                Icon(Icons.cake, color: Colors.red, size: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
