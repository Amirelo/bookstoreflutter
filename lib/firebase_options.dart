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
    apiKey: 'AIzaSyBQyUWXLPi8wbXEdDvs6aNFUIdDul4822o',
    appId: '1:574540851190:web:e2a64094fae06a3dcd89d7',
    messagingSenderId: '574540851190',
    projectId: 'bookstore-2f626',
    authDomain: 'bookstore-2f626.firebaseapp.com',
    storageBucket: 'bookstore-2f626.appspot.com',
    measurementId: 'G-G608D5M4G4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDarcXCkRZgVJVJv63D2RdoFDJpxnwhTD4',
    appId: '1:574540851190:android:745dfd59992531d6cd89d7',
    messagingSenderId: '574540851190',
    projectId: 'bookstore-2f626',
    storageBucket: 'bookstore-2f626.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCn5Z-bz1ml9JTj-ybR28IiroMuK3ewOtM',
    appId: '1:574540851190:ios:956e2e61c2744fb2cd89d7',
    messagingSenderId: '574540851190',
    projectId: 'bookstore-2f626',
    storageBucket: 'bookstore-2f626.appspot.com',
    androidClientId: '574540851190-eog0jf0da0d1f8e5nsu1bggb23406sq9.apps.googleusercontent.com',
    iosClientId: '574540851190-kfdigeqs60hrtag3o3icl8b9b3kbk9sv.apps.googleusercontent.com',
    iosBundleId: 'com.example.bookstore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCn5Z-bz1ml9JTj-ybR28IiroMuK3ewOtM',
    appId: '1:574540851190:ios:956e2e61c2744fb2cd89d7',
    messagingSenderId: '574540851190',
    projectId: 'bookstore-2f626',
    storageBucket: 'bookstore-2f626.appspot.com',
    androidClientId: '574540851190-eog0jf0da0d1f8e5nsu1bggb23406sq9.apps.googleusercontent.com',
    iosClientId: '574540851190-kfdigeqs60hrtag3o3icl8b9b3kbk9sv.apps.googleusercontent.com',
    iosBundleId: 'com.example.bookstore',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBQyUWXLPi8wbXEdDvs6aNFUIdDul4822o',
    appId: '1:574540851190:web:e231b5ae86ebf37ccd89d7',
    messagingSenderId: '574540851190',
    projectId: 'bookstore-2f626',
    authDomain: 'bookstore-2f626.firebaseapp.com',
    storageBucket: 'bookstore-2f626.appspot.com',
    measurementId: 'G-VWBECE7FH3',
  );
}
