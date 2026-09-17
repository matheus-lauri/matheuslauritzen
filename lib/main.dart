import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'l10n/generated/app_localizations.dart';
import 'screens/home_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const _themeModePrefsKey = 'theme_mode';
  static const _localePrefsKey = 'locale';

  ThemeMode _themeMode = ThemeMode.dark;
  Locale _locale = const Locale('pt');

  @override
  void initState() {
    super.initState();
    _restorePreferences();
  }

  Future<void> _restorePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString(_themeModePrefsKey);
    final savedLocale = prefs.getString(_localePrefsKey);
    setState(() {
      if (savedTheme == 'light' || savedTheme == 'dark') {
        _themeMode = savedTheme == 'light' ? ThemeMode.light : ThemeMode.dark;
      }
      if (savedLocale == 'pt' || savedLocale == 'en') {
        _locale = Locale(savedLocale!);
      }
    });
  }

  Future<void> _toggleThemeMode() async {
    final next = _themeMode == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    setState(() => _themeMode = next);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _themeModePrefsKey,
      next == ThemeMode.dark ? 'dark' : 'light',
    );
  }

  Future<void> _changeLocale(Locale locale) async {
    setState(() => _locale = locale);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localePrefsKey, locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _themeMode,
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: HomePage(
        themeMode: _themeMode,
        onToggleTheme: _toggleThemeMode,
        locale: _locale,
        onLocaleChanged: _changeLocale,
      ),
    );
  }
}
