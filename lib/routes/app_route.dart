class AppRoute {
  static const String home = '/';
  static const String profile = '/profile';
  static const String settings = '/settings';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case profile:
        final  args = settings.arguments as ProfileScreenArgs;
        return MaterialPageRoute(builder: (_) => ProfileScreen(user args.user));
      case settings:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      default:
        return MaterialPageRoute(builder: (_) => NotFoundScreen());
    }
  }

  
}

class ProfileArguments{
    final User user;

    ProfileArguments(this.user);
  }