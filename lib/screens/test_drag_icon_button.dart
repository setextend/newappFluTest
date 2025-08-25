import 'package:flutter/material.dart';
import '../widgets/my_button_widget.dart';
import '../widgets/my_settings_widget.dart';

class TestDdragIconButton extends StatefulWidget {
  const TestDdragIconButton({super.key});

  @override
  State<TestDdragIconButton> createState() => _TestDdragIconButtonState();
}

class _TestDdragIconButtonState extends State<TestDdragIconButton> {
  // Храним ID иконок для каждого виджета
  String topIconId = 'top_icon';
  String bottomFirstIconId = 'bottom_first_icon';
  String bottomSecondIconId = 'bottom_second_icon';

  // Функция для обработки завершения перетаскивания
  void _handleDragCompleted(String draggedIconId, String targetIconId) {
    setState(() {
      // Меняем местами ID иконок
      if (draggedIconId == topIconId && targetIconId == bottomFirstIconId) {
        final temp = topIconId;
        topIconId = bottomFirstIconId;
        bottomFirstIconId = temp;
      } else if (draggedIconId == topIconId &&
          targetIconId == bottomSecondIconId) {
        final temp = topIconId;
        topIconId = bottomSecondIconId;
        bottomSecondIconId = temp;
      } else if (draggedIconId == bottomFirstIconId &&
          targetIconId == topIconId) {
        final temp = bottomFirstIconId;
        bottomFirstIconId = topIconId;
        topIconId = temp;
      } else if (draggedIconId == bottomFirstIconId &&
          targetIconId == bottomSecondIconId) {
        final temp = bottomFirstIconId;
        bottomFirstIconId = bottomSecondIconId;
        bottomSecondIconId = temp;
      } else if (draggedIconId == bottomSecondIconId &&
          targetIconId == topIconId) {
        final temp = bottomSecondIconId;
        bottomSecondIconId = topIconId;
        topIconId = temp;
      } else if (draggedIconId == bottomSecondIconId &&
          targetIconId == bottomFirstIconId) {
        final temp = bottomSecondIconId;
        bottomSecondIconId = bottomFirstIconId;
        bottomFirstIconId = temp;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          MyButtonWidget(
            isBottomVisible: false,
            isChatVisible: false,
            iconId: topIconId,
            onDragCompleted: _handleDragCompleted,
          ),
          MySettingsWidget(
            firstIconId: bottomFirstIconId,
            secondIconId: bottomSecondIconId,
            onDragCompleted: _handleDragCompleted,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
