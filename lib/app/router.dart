// lib/app/router.dart
import 'package:flutter/material.dart';
import 'package:campusbite/features/home/screens/home_screen.dart';
import 'package:campusbite/features/chatbot/screens/chatbot_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/chatbot':
        return MaterialPageRoute(builder: (_) => const ChatbotScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
