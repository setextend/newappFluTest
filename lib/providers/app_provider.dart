import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  // Тема
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  // Локализация
  Locale _locale = const Locale('ru');
  Locale get locale => _locale;

  // Авторизация
  bool _isLoggedIn = false;
  String? _userToken;
  Map<String, dynamic>? _userData;

  bool get isLoggedIn => _isLoggedIn;
  String? get userToken => _userToken;
  Map<String, dynamic>? get userData => _userData;

  // Настройки
  bool _notificationsEnabled = true;
  bool _soundsEnabled = true;
  bool _vibrationsEnabled = true;

  bool get notificationsEnabled => _notificationsEnabled;
  bool get soundsEnabled => _soundsEnabled;
  bool get vibrationsEnabled => _vibrationsEnabled;

  // Проверка тёмной темы
  bool get isDarkMode {
    if (_themeMode == ThemeMode.system) {
      final brightness = WidgetsBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    }
    return _themeMode == ThemeMode.dark;
  }

  // ============ ТЕМА ============
  void setTheme(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
    // Сохранить в SharedPreferences
  }

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    notifyListeners();
    // Сохранить в SharedPreferences
  }

  // ============ ЛОКАЛИЗАЦИЯ ============
  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
    // Сохранить в SharedPreferences
  }

  void toggleLocale() {
    _locale = _locale.languageCode == 'ru'
        ? const Locale('en')
        : const Locale('ru');
    notifyListeners();
    // Сохранить в SharedPreferences
  }

  // ============ АВТОРИЗАЦИЯ ============
  Future<void> login(String email, String password) async {
    // Заглушка - реализовать позже
    _isLoggedIn = true;
    _userToken = 'temp_token_${DateTime.now().millisecondsSinceEpoch}';
    _userData = {'email': email, 'name': 'Пользователь', 'id': 1};
    notifyListeners();
    // Сохранить в SecureStorage
  }

  Future<void> logout() async {
    _isLoggedIn = false;
    _userToken = null;
    _userData = null;
    notifyListeners();
    // Очистить SecureStorage
  }

  // ============ НАСТРОЙКИ ============
  void setNotificationsEnabled(bool value) {
    _notificationsEnabled = value;
    notifyListeners();
    // Сохранить в SharedPreferences
  }

  void setSoundsEnabled(bool value) {
    _soundsEnabled = value;
    notifyListeners();
    // Сохранить в SharedPreferences
  }

  void setVibrationsEnabled(bool value) {
    _vibrationsEnabled = value;
    notifyListeners();
    // Сохранить in SharedPreferences
  }

  // ============ ЗАГРУЗКА СОСТОЯНИЯ ============
  Future<void> loadAppState() async {
    // Загрузить все настройки из SharedPreferences
    // await _loadTheme();
    // await _loadLocale();
    // await _loadSettings();
    notifyListeners();
  }
}
