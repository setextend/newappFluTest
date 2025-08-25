import 'package:flutter/material.dart';
import '../widgets/my_chat_widget.dart';

class TestChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: TestChatExample());
    //State<TestChatPage> createState() => _TestChatPageState();
  }
}

class TestChatExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 500, // Фиксированная высота чата
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      ChatMessage(text: 'Привет! Как дела?', isMe: true),
                      ChatMessage(text: 'Всё отлично, спасибо!', isMe: false),
                      ChatMessage(text: 'Чем занимаешься?', isMe: true),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Введите сообщение...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send, color: Colors.blue),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
