import 'package:flash_chat/pkg/firebase_core/initialize_firebase_app.dart';
import 'package:flash_chat/router/app_router.dart';
import 'package:flash_chat/router/routes.dart';
import 'package:flash_chat/test.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebaseApp();
  runApp(
    FlashChat(),
  );
}

class FlashChat extends StatefulWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  State<FlashChat> createState() => _FlashChatState();
}

class _FlashChatState extends State<FlashChat> {
  @override
  Widget build(BuildContext context) {
    tester();
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      routes: AppRouter.createRoutes(context),
      initialRoute: Routes.welcomeScreen,
    );
  }
}
