import 'package:flutter/material.dart';
import '../widgets/my_button_widget.dart';
import '../widgets/my_chat_widget.dart';
import '../widgets/my_settings_widget.dart';

class TestDataBox extends StatefulWidget {
  @override
  _TestDataBoxState createState() => _TestDataBoxState();
}

class _TestDataBoxState extends State<TestDataBox> {
  bool _isBottomVisible = false;
  bool _isChatVisible = false;
  Offset _position = Offset.zero; // Начинаем с нулевой позиции

  void _handleTopTap() {
    setState(() {
      _isChatVisible = !_isChatVisible;
      // Закрываем нижний блок при открытии чата
      if (_isChatVisible) _isBottomVisible = false;
    });
  }

  void _handleTopDoubleTap() {
    setState(() {
      _isBottomVisible = !_isBottomVisible;
      // Закрываем чат при открытии нижнего блока
      if (_isBottomVisible) _isChatVisible = false;
    });
  }

  void _handleDragStart(DragStartDetails details) {}

  void _handleDragUpdate(DragUpdateDetails details) {
    setState(() {
      _position = Offset(
        _position.dx + details.delta.dx,
        _position.dy + details.delta.dy,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Positioned(
              left: _position.dx,
              top: _position.dy,
              child: GestureDetector(
                onPanStart: _handleDragStart,
                onPanUpdate: _handleDragUpdate,
                child: Container(
                  // Используем ширину родительского контейнера
                  width: constraints.maxWidth,
                  constraints: BoxConstraints(maxWidth: constraints.maxWidth),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Верхний блок
                      GestureDetector(
                        onTap: _handleTopTap,
                        onDoubleTap: _handleTopDoubleTap,
                        child: MyButtonWidget(
                          isBottomVisible: _isBottomVisible,
                          isChatVisible: _isChatVisible,
                          iconId: '',
                          onDragCompleted: (String p1, String p2) {},
                        ),
                      ),

                      // Нижний блок (появляется при двойном нажатии)
                      if (_isBottomVisible)
                        MySettingsWidget(
                          firstIconId: '',
                          secondIconId: '',
                          onDragCompleted: (String p1, String p2) {},
                        ),

                      // Чат (появляется при одинарном нажатии)
                      if (_isChatVisible)
                        Container(
                          height: 200, // Фиксированная высота чата
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          child: MyChatWidget(),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
