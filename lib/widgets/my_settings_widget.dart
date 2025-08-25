import 'package:flutter/material.dart';
import 'my_drag_icon_widget.dart';

class MySettingsWidget extends StatelessWidget {
  const MySettingsWidget({
    super.key,
    required this.firstIconId,
    required this.secondIconId,
    required this.onDragCompleted,
  });

  final String firstIconId;
  final String secondIconId;
  final Function(String, String) onDragCompleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Нижний блок',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  MyDragIconWidget(
                    iconId: firstIconId,
                    onDragCompleted: onDragCompleted,
                    acceptedTargets: ['top_icon', 'bottom_second_icon'],
                  ),
                  const SizedBox(width: 8),
                  MyDragIconWidget(
                    iconId: secondIconId,
                    onDragCompleted: onDragCompleted,
                    acceptedTargets: ['top_icon', 'bottom_first_icon'],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Этот блок появляется при двойном нажатии на верхний блок',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
