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
    apiKey: 'AIzaSyAJ7fQiCqzU4QUNIKjxGGk46ApZcMSAupo',
    appId: '1:948612703968:web:b00e477f61a565f7869285',
    messagingSenderId: '948612703968',
    projectId: 'loja-online-994b1',
    authDomain: 'loja-online-994b1.firebaseapp.com',
    storageBucket: 'loja-online-994b1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCN5xTlLfadFxgmF8V38_3Pxg2LXP1_Mvc',
    appId: '1:948612703968:android:a5bf83980f466e7f869285',
    messagingSenderId: '948612703968',
    projectId: 'loja-online-994b1',
    storageBucket: 'loja-online-994b1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDffmmJcLoe6hETWsuq3XjzgvdmfHWiSAA',
    appId: '1:948612703968:ios:4bb5e89140c86daa869285',
    messagingSenderId: '948612703968',
    projectId: 'loja-online-994b1',
    storageBucket: 'loja-online-994b1.appspot.com',
    iosBundleId: 'br.com.iseppe.appLojaOnline',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDffmmJcLoe6hETWsuq3XjzgvdmfHWiSAA',
    appId: '1:948612703968:ios:93c82e71089ddb42869285',
    messagingSenderId: '948612703968',
    projectId: 'loja-online-994b1',
    storageBucket: 'loja-online-994b1.appspot.com',
    iosBundleId: 'br.com.iseppe.appLojaOnline.RunnerTests',
  );
}
