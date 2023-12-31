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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC_zuJNUiMCHmSewf3qLyTem_uKmKt2Oa8',
    appId: '1:202644670015:web:9b4de0daefc951ead1da8a',
    messagingSenderId: '202644670015',
    projectId: 'learnstorm',
    authDomain: 'learnstorm.firebaseapp.com',
    storageBucket: 'learnstorm.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkHDYOmCuSaQDICzEGAh5FY17m9wBlz54',
    appId: '1:202644670015:ios:f8e4f74f35bb1557d1da8a',
    messagingSenderId: '202644670015',
    projectId: 'learnstorm',
    storageBucket: 'learnstorm.appspot.com',
    iosBundleId: 'com.example.learnstorm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDkHDYOmCuSaQDICzEGAh5FY17m9wBlz54',
    appId: '1:202644670015:ios:f8e4f74f35bb1557d1da8a',
    messagingSenderId: '202644670015',
    projectId: 'learnstorm',
    storageBucket: 'learnstorm.appspot.com',
    iosBundleId: 'com.example.learnstorm',
  );
}
