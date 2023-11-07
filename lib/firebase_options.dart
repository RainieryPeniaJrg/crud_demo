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
    apiKey: 'AIzaSyCJs47ObpDWBTK2x_DUvTL6elepHmH4EoY',
    appId: '1:916869484006:web:5d7ae53a40a9172037da27',
    messagingSenderId: '916869484006',
    projectId: 'flutter-crud-demo-e6ac4',
    authDomain: 'flutter-crud-demo-e6ac4.firebaseapp.com',
    storageBucket: 'flutter-crud-demo-e6ac4.appspot.com',
    measurementId: 'G-GKGPXD0HRZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyClq3b5elQOG8pxlF1aRlnDTauO0LK1HKE',
    appId: '1:916869484006:android:3e2c3f813102902a37da27',
    messagingSenderId: '916869484006',
    projectId: 'flutter-crud-demo-e6ac4',
    storageBucket: 'flutter-crud-demo-e6ac4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4FB7kR8g1xLgi9rKjadIqD8LZLP8KeVE',
    appId: '1:916869484006:ios:5d6207f92ac1b32b37da27',
    messagingSenderId: '916869484006',
    projectId: 'flutter-crud-demo-e6ac4',
    storageBucket: 'flutter-crud-demo-e6ac4.appspot.com',
    iosBundleId: 'com.example.crudDemo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD4FB7kR8g1xLgi9rKjadIqD8LZLP8KeVE',
    appId: '1:916869484006:ios:46f8e260c382507537da27',
    messagingSenderId: '916869484006',
    projectId: 'flutter-crud-demo-e6ac4',
    storageBucket: 'flutter-crud-demo-e6ac4.appspot.com',
    iosBundleId: 'com.example.crudDemo.RunnerTests',
  );
}