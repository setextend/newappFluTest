import 'package:flutter/material.dart';
import 'my_drag_icon_widget.dart';

class MyButtonWidget extends StatelessWidget {
  const MyButtonWidget({
    super.key,
    required this.isBottomVisible,
    required this.isChatVisible,
    required this.iconId,
    required this.onDragCompleted,
  });

  final bool isBottomVisible;
  final bool isChatVisible;
  final String iconId;
  final Function(String, String) onDragCompleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: isBottomVisible || isChatVisible
            ? const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              )
            : BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Icon(Icons.drag_handle, color: Colors.white),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Верхний блок',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              MyDragIconWidget(
                iconId: iconId,
                onDragCompleted: onDragCompleted,
                // Разрешаем перетаскивание на другие иконки
                acceptedTargets: ['bottom_first_icon', 'bottom_second_icon'],
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'Нажмите для чата, двойное нажатие для нижнего блока',
            style: TextStyle(color: Colors.white70, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
