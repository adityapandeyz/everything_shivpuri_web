import 'package:everything_shivpuri_web/screens/error_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

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
      title: 'Everything Shivpuri',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        primarySwatch: Colors.blue,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()},
        ),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const HomeScreen();
            } else if (snapshot.hasError) {
              return const ErrorScreen();
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

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             // Sign in the user using Firebase authentication
//             final UserCredential userCredential =
//                 await FirebaseAuth.instance.signInAnonymously();

//             // Store the user's credentials in Firebase's authentication state
//             if (userCredential.user != null) {
//               FirebaseAuth.instance.signInWithCredential(
//                 userCredential.credential!,
//               );
//             }

//             // Store the user's credentials in the device's secure storage
//             final SharedPreferences prefs =
//                 await SharedPreferences.getInstance();
//             prefs.setString('userId', userCredential.user?.uid ?? '');
//             prefs.setString(
//                 'userToken', userCredential.credential?.token as String);

//             // Navigate to the home screen
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const HomeScreen(),
//               ),
//             );
//           },
//           child: const Text('Sign In Anonymously'),
//         ),
//       ),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late Future<Map<String, String>> _userData;

//   Future<Map<String, String>> getUserData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String userId = prefs.getString('userId') ?? '';
//     String userToken = prefs.getString('userToken') ?? '';
//     return {'userId': userId, 'userToken': userToken};
//   }

//   @override
//   void initState() {
//     super.initState();
//     _userData = getUserData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//       ),
//       body: FutureBuilder<Map<String, String>>(
//         future: _userData,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else {
//             final userId = snapshot.data?['userId'];
//             final userToken = snapshot.data?['userToken'];
//             // Render the UI with the user data
//             return Center(
//               child: Text('User ID: $userId\nUser Token: $userToken'),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
