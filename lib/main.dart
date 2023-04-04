import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialise app based on platform- web or mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB9aE0oe9FyGJLAFjmryZqEkS1_ezhB8Tw",
          authDomain: "everything-shivpuri-sem6.firebaseapp.com",
          projectId: "everything-shivpuri-sem6",
          storageBucket: "everything-shivpuri-sem6.appspot.com",
          messagingSenderId: "873277361262",
          appId: "1:873277361262:web:0a8b9f9d2b5d1158b96a7f",
          measurementId: "G-VMJH6B4X13"),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const HomeScreen();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }

          // means connection to future hasnt been made yet
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return const HomeScreen();
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, String> userData = {};

  Future<Map<String, String>> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('displayName') ?? '';
    String email = prefs.getString('email') ?? '';
    return {'name': name, 'email': email};
  }

  @override
  void initState() async {
    userData = await getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('everything shivpuri web'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Name: ${userData['name']}',
            ),
            Text(
              'Email: ${userData['email']}',
            ),
          ],
        ),
      ),
    );
  }
}
