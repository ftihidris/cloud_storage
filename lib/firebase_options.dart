import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'YOUR_API',
    appId: '1:575096738084:web:3ea694eba4202a00cce3b1',
    messagingSenderId: '575096738084',
    projectId: 'flutter-990bd',
    authDomain: 'flutter-990bd.firebaseapp.com',
    storageBucket: 'flutter-990bd.appspot.com',
    measurementId: 'G-FJF3VEY6SL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'YOUR_API',
    appId: '1:575096738084:android:e170dc6c7931a237cce3b1',
    messagingSenderId: '575096738084',
    projectId: 'flutter-990bd',
    storageBucket: 'flutter-990bd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'YOUR_API',
    appId: '1:575096738084:ios:a85a20d9f5c6346acce3b1',
    messagingSenderId: '575096738084',
    projectId: 'flutter-990bd',
    storageBucket: 'flutter-990bd.appspot.com',
    androidClientId: '575096738084-s5qfr68inbbffpudiqosuuoavghcn66t.apps.googleusercontent.com',
    iosClientId: '575096738084-akf4bf143cqn6sd7ei2335o4cfbskk2j.apps.googleusercontent.com',
    iosBundleId: 'com.example.cloudStorage',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'YOUR_API',
    appId: '1:575096738084:ios:9e907e159782c06dcce3b1',
    messagingSenderId: '575096738084',
    projectId: 'flutter-990bd',
    storageBucket: 'flutter-990bd.appspot.com',
    androidClientId: '575096738084-s5qfr68inbbffpudiqosuuoavghcn66t.apps.googleusercontent.com',
    iosClientId: '575096738084-53afdr2eenc5ivenq81k32v8lb6elche.apps.googleusercontent.com',
    iosBundleId: 'com.example.cloudStorage.RunnerTests',
  );
}
