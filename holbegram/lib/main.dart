import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'env.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/auth/upload_image_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: firebaseConfig,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String apiKey = Env.googleApiKey;

    return MaterialApp(
      title: 'Holbegram',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(apiKey: apiKey),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.apiKey});

  final String apiKey;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginScreen(
                            emailController: TextEditingController(),
                            passwordController: TextEditingController(),
                          )),
                );
              },
              child: const Text('Go to Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignUp(
                            emailController: TextEditingController(),
                            usernameController: TextEditingController(),
                            passwordController: TextEditingController(),
                            passwordConfirmController: TextEditingController(),
                          )),
                );
              },
              child: const Text('Go to Sign Up'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddPicture(
                            email: 'user@example.com',
                            password: 'password123',
                            username: 'username',
                          )),
                );
              },
              child: const Text('Go to Add Picture'),
            ),
          ],
        ),
      ),
    );
  }
}
