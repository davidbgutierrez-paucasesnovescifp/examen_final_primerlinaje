import 'package:examen_final_primerlinaje/providers/login_form_provider.dart';
import 'package:examen_final_primerlinaje/services/preferences_service.dart';
import 'package:examen_final_primerlinaje/services/users_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:examen_final_primerlinaje/screens/screens.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => (UsersService())),
        ChangeNotifierProvider(create: (_) => (PreferencesService())),
      ],
      child: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Usuaris App',
      routes: {
        'login': (_) => LoginScreen(),
        'home': (_) => HomeScreen(),
        'user': (_) => UserScreen(),
      },
      home: LoginScreen(),
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
      ),
    );
  }
}
