import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/pkg/firebase_core/firebase_options.dart';

Future<void> initializeFirebaseApp() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
