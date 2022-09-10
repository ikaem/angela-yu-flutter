import 'package:flash_chat/router/routes.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/register_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> createRoutes(
      BuildContext context) {
    return {
      Routes.welcomeScreen: (BuildContext context) => const WelcomeScreen(),
      Routes.loginScreen: (BuildContext context) => const LoginScreen(),
      Routes.registerScreen: (BuildContext context) => const RegisterScreen(),
      Routes.chatScreen: (BuildContext context) => const ChatScreen(),
    };
  }
}
