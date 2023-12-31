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
    apiKey: 'AIzaSyAhvz-na2TF81vvFyVogdervGNj4tF_w2Q',
    appId: '1:533951211269:web:1b32d560fb7d9dace3f96c',
    messagingSenderId: '533951211269',
    projectId: 'testapp-8ca5c',
    authDomain: 'testapp-8ca5c.firebaseapp.com',
    storageBucket: 'testapp-8ca5c.appspot.com',
    measurementId: 'G-WKV4KV38GY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDzpGdg1eXb6XO9NkgBP47vz-GJ4PVTANw',
    appId: '1:533951211269:android:5dde10b75aefe538e3f96c',
    messagingSenderId: '533951211269',
    projectId: 'testapp-8ca5c',
    storageBucket: 'testapp-8ca5c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCL6atkVSZ9ZlDE4DPyNysE7_yI1vZX9s8',
    appId: '1:533951211269:ios:fd2ba61e91332a6de3f96c',
    messagingSenderId: '533951211269',
    projectId: 'testapp-8ca5c',
    storageBucket: 'testapp-8ca5c.appspot.com',
    iosClientId: '533951211269-tmaok8mogpb1409qn8uoarbcp9t1j2pc.apps.googleusercontent.com',
    iosBundleId: 'com.example.testApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCL6atkVSZ9ZlDE4DPyNysE7_yI1vZX9s8',
    appId: '1:533951211269:ios:dc062476681a8364e3f96c',
    messagingSenderId: '533951211269',
    projectId: 'testapp-8ca5c',
    storageBucket: 'testapp-8ca5c.appspot.com',
    iosClientId: '533951211269-kcehu6nnrecbgj095kfogcqchrel5glr.apps.googleusercontent.com',
    iosBundleId: 'com.example.testApp.RunnerTests',
  );
}
