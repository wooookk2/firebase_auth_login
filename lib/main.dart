import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_login_project/screens/main_page.dart';
import 'package:firebase_auth_login_project/screens/page_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasData) {
            return MainPage(email: snapshot.data?.email);
          } else {
            return TestPage();
            // return ChangeNotifierProvider<JoinOrLogin>.value(
            //     value: JoinOrLogin(), child: AuthPage());
          }
        });
  }
}
