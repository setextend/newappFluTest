import 'package:flutter/material.dart';

class MyDragIconWidget extends StatelessWidget {
  const MyDragIconWidget({
    super.key,
    required this.iconId,
    required this.onDragCompleted,
    required this.acceptedTargets,
  });

  final String iconId;
  final Function(String, String) onDragCompleted;
  final List<String> acceptedTargets;

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      onAccept: (data) {
        // Когда иконка принята, меняем местами
        onDragCompleted(data, iconId);
      },
      builder: (context, candidateData, rejectedData) {
        return Draggable<String>(
          data: iconId,
          feedback: Material(
            child: Icon(_getIconForId(iconId), color: Colors.amber, size: 30),
          ),
          childWhenDragging: Icon(
            _getIconForId(iconId),
            color: Colors.grey,
            size: 30,
          ),
          onDragCompleted: () {
            // Обработка завершения перетаскивания
          },
          child: Icon(_getIconForId(iconId), color: Colors.white, size: 30),
        );
      },
    );
  }

  IconData _getIconForId(String id) {
    switch (id) {
      case 'top_icon':
        return Icons.star;
      case 'bottom_first_icon':
        return Icons.favorite;
      case 'bottom_second_icon':
        return Icons.thumb_up;
      default:
        return Icons.error;
    }
  }
}
