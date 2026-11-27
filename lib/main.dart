import 'package:bynas/firebase_options.dart';
import 'package:bynas/screens/form.dart';
import 'package:bynas/screens/jobBoard_company.dart';
import 'package:bynas/screens/login.dart';
import 'package:bynas/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bynas/screens/signup_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
     // home: const SplashScreen(),
     home: const SignupMainScreen(),
      routes:{
        '/splash': (context)=> SplashScreen(),
        '/login': (context)=> LoginScreen(),
        '/board': (context)=> JobBoardCompany(),
        '/form': (context)=> FormScreen(),

      }
    );
  }
}




