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
    apiKey: 'AIzaSyD-R8yC5DWuJzynfKK_TcpNKQQ5Hegmh44',
    appId: '1:368468542544:web:697893547be83d543d3d55',
    messagingSenderId: '368468542544',
    projectId: 'shary-app-6aace',
    authDomain: 'shary-app-6aace.firebaseapp.com',
    storageBucket: 'shary-app-6aace.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA5SzxPgPiVPffdZg9W8ZMiRlSC2VuTkwQ',
    appId: '1:368468542544:android:4584c0d7c175dbfa3d3d55',
    messagingSenderId: '368468542544',
    projectId: 'shary-app-6aace',
    storageBucket: 'shary-app-6aace.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCB6QFBWas1ycW7QCLCPX3zV2mEfe-RA_k',
    appId: '1:368468542544:ios:36206c80f60ab65b3d3d55',
    messagingSenderId: '368468542544',
    projectId: 'shary-app-6aace',
    storageBucket: 'shary-app-6aace.appspot.com',
    iosBundleId: 'com.example.testGradleApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCB6QFBWas1ycW7QCLCPX3zV2mEfe-RA_k',
    appId: '1:368468542544:ios:36206c80f60ab65b3d3d55',
    messagingSenderId: '368468542544',
    projectId: 'shary-app-6aace',
    storageBucket: 'shary-app-6aace.appspot.com',
    iosBundleId: 'com.example.testGradleApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD-R8yC5DWuJzynfKK_TcpNKQQ5Hegmh44',
    appId: '1:368468542544:web:d8e585506bb5903e3d3d55',
    messagingSenderId: '368468542544',
    projectId: 'shary-app-6aace',
    authDomain: 'shary-app-6aace.firebaseapp.com',
    storageBucket: 'shary-app-6aace.appspot.com',
  );
}
