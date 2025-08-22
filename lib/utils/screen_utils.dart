class ScreenUtils {
  static bool get isMobile {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.width < 600;
  }

  static bool get isTablet {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.width >= 600 && data.size.width < 1200;
  }

  static bool get isDesktop {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.width >= 1200;
  }

  static double responsiveValue({
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    if (isDesktop && desktop != null) return desktop;
    if (isTablet && tablet != null) return tablet;
    return mobile;
  }
}
