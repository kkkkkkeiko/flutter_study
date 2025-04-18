// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDW16NJdiEpLwpI1eIAe6QmJzVLrWvYA6U',
    appId: '1:442164789195:web:e14889812da882723c804e',
    messagingSenderId: '442164789195',
    projectId: 'todo-firestore-d5d45',
    authDomain: 'todo-firestore-d5d45.firebaseapp.com',
    storageBucket: 'todo-firestore-d5d45.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB2lP2AsQvmKVvvjaDsj5lu9HPnw_M2ZF4',
    appId: '1:442164789195:android:e3b532fa7cf769083c804e',
    messagingSenderId: '442164789195',
    projectId: 'todo-firestore-d5d45',
    storageBucket: 'todo-firestore-d5d45.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6YtDdnKMhobj29ZyItCe6IrtsLL1UP1o',
    appId: '1:442164789195:ios:5e76623c75e05c673c804e',
    messagingSenderId: '442164789195',
    projectId: 'todo-firestore-d5d45',
    storageBucket: 'todo-firestore-d5d45.firebasestorage.app',
    iosBundleId: 'com.example.flutterStudy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6YtDdnKMhobj29ZyItCe6IrtsLL1UP1o',
    appId: '1:442164789195:ios:5e76623c75e05c673c804e',
    messagingSenderId: '442164789195',
    projectId: 'todo-firestore-d5d45',
    storageBucket: 'todo-firestore-d5d45.firebasestorage.app',
    iosBundleId: 'com.example.flutterStudy',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDW16NJdiEpLwpI1eIAe6QmJzVLrWvYA6U',
    appId: '1:442164789195:web:fdd1a4815618ba753c804e',
    messagingSenderId: '442164789195',
    projectId: 'todo-firestore-d5d45',
    authDomain: 'todo-firestore-d5d45.firebaseapp.com',
    storageBucket: 'todo-firestore-d5d45.firebasestorage.app',
  );
}
