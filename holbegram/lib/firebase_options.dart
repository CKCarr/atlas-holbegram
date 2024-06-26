// lib/firebase_options.dart
import 'package:firebase_core/firebase_core.dart';
import 'env.dart';

const firebaseConfig = FirebaseOptions(
  apiKey: Env.firebaseApiKey,
  authDomain: Env.firebaseAuthDomain,
  projectId: Env.firebaseProjectId,
  storageBucket: Env.firebaseStorageBucket,
  messagingSenderId: Env.firebaseMessagingSenderId,
  appId: Env.firebaseAppId,
);
