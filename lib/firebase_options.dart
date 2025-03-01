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
    apiKey: 'AIzaSyAxoRgn3JlrGs0Q4X-M7wHu3OuRnurpppU',
    appId: '1:702706199584:web:bd2e634d2dd06521dd6045',
    messagingSenderId: '702706199584',
    projectId: 'socialmidiaapp-5d0e2',
    authDomain: 'socialmidiaapp-5d0e2.firebaseapp.com',
    storageBucket: 'socialmidiaapp-5d0e2.appspot.com',
    measurementId: 'G-ED9EB6NXNZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAey6H3AHHMigF_8M0RWejcNhvtWXpkONw',
    appId: '1:702706199584:android:40dac42e6ecade65dd6045',
    messagingSenderId: '702706199584',
    projectId: 'socialmidiaapp-5d0e2',
    storageBucket: 'socialmidiaapp-5d0e2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDzJ3q_QMEIDAyYx1SlW1LJOaFoHslKEr4',
    appId: '1:702706199584:ios:f68f494c5595493add6045',
    messagingSenderId: '702706199584',
    projectId: 'socialmidiaapp-5d0e2',
    storageBucket: 'socialmidiaapp-5d0e2.appspot.com',
    iosBundleId: 'com.example.socialmidia',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDzJ3q_QMEIDAyYx1SlW1LJOaFoHslKEr4',
    appId: '1:702706199584:ios:d140f44a57559bc9dd6045',
    messagingSenderId: '702706199584',
    projectId: 'socialmidiaapp-5d0e2',
    storageBucket: 'socialmidiaapp-5d0e2.appspot.com',
    iosBundleId: 'com.example.socialmidia.RunnerTests',
  );
}
