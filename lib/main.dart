import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_pass_autj/Authentication_service.dart';
import 'package:login_pass_autj/Screens/Home_Screen.dart';
import 'package:login_pass_autj/Screens/Login_screen.dart';
import 'package:login_pass_autj/Screens/registration_screen.dart';
import 'package:provider/provider.dart';


Future  <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

//hjhjhjh
//llklkl


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChange, initialData: null, //initialData: null,
        ),
      ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.lightBlue,
      ),
      home: const AuthenticationWrapper(),
    ),
    );
  }
}
class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != true){
      return HomeScreen();
    }
    return RegistrationScreen();
  }
}


