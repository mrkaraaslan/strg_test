// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCmq7NUDkEwdamo07Aw6RJAvolR8auw744',
    appId: '1:266658958210:web:fb48f604815792cf269d9b',
    messagingSenderId: '266658958210',
    projectId: 'strg-test',
    authDomain: 'strg-test.firebaseapp.com',
    storageBucket: 'strg-test.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2ZwwYuFe0qdvtnmpaAN0-fxXTkuVeEnQ',
    appId: '1:266658958210:android:1b0271473be1c970269d9b',
    messagingSenderId: '266658958210',
    projectId: 'strg-test',
    storageBucket: 'strg-test.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAwHP9Ljp4y33gq5StmTHPKP1NewNfxy78',
    appId: '1:266658958210:ios:d2b7fff81aa009e1269d9b',
    messagingSenderId: '266658958210',
    projectId: 'strg-test',
    storageBucket: 'strg-test.appspot.com',
    iosBundleId: 'com.example.strgTest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAwHP9Ljp4y33gq5StmTHPKP1NewNfxy78',
    appId: '1:266658958210:ios:b7184ea9dfea9201269d9b',
    messagingSenderId: '266658958210',
    projectId: 'strg-test',
    storageBucket: 'strg-test.appspot.com',
    iosBundleId: 'com.example.strgTest.RunnerTests',
  );
}