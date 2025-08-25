import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
// import 'package:newfapp/providers/app_provider.dart';
import 'package:newfapp/features/profile/profile_avatar.dart';
import 'package:provider/provider.dart';
import '../widgets/index.dart';
import '../screens/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 70, 255, 23),
          ),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];
  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var selectedIndex = 0;

  void _openSettingsDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
      case 1:
        page = LikePage();
      case 2:
        page = TestWidgetsPage();
      case 3:
        page = TestUpperPage(onTap: _openSettingsDrawer);
      case 4:
        page = TestSliverListPage();
      case 5:
        page = TestChatPage();
      case 6:
        page = TestDataBox();
      case 7:
        page = TestDdragIconButton();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: _scaffoldKey,
          endDrawer: AccountSettingsDrawer(),
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Favorites'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.trending_up),
                      label: Text('Test Widgets'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.add),
                      label: Text('Test Upper'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.list),
                      label: Text('Test SliverList'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.chat),
                      label: Text('Test Chat'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.storage),
                      label: Text('Test DataBox'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.drag_handle),
                      label: Text('Test DragIconButton'),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: SafeArea(
                  child: Container(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: page,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AccountSettingsDrawer extends StatelessWidget {
  const AccountSettingsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Имя пользователя"),
            accountEmail: const Text("user@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/avatar.png',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.person, size: 40),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Настройки"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Профиль"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCase(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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

class BigCase extends StatelessWidget {
  const BigCase({super.key, required this.pair});

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}

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

class MyChatWidget extends StatelessWidget {
  const MyChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isMe;

  const ChatMessage({required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isMe ? Colors.blue : Colors.grey[300],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              text,
              style: TextStyle(color: isMe ? Colors.white : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
/*
return MultiProvider(
  providers: [
    //ChangeNotifierProvider(create: (context) => MyAppState()),
    ChangeNotifierProvider(create: (_) => AppProvider()),
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => LocaleProvider()),
    //добавляем новые провайдеры сюда
  ],
  child: Consumer3<AppProvider, ThemeProvider, LocaleProvider>(
    builder: (context, appProvider, themeProvider, localeProvider, child) {
      return MaterialApp(
      //остальная конфа
        title: 'Namer App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 70, 255, 23),
          ),
        ),
        home: appProvider.isLoading
            ? LoadingScreen()
            : MyHomePage(),
      );
    },
  ),
);
**/