import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../firebase_options.dart';
import 'injections.dart' as di;

class MainMethod{
  static Future<void> init () async {
    WidgetsFlutterBinding.ensureInitialized();
    GetStorage.init();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await di.init();
  }
}

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//
// }