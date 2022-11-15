import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  _login(BuildContext context) async {
    final UserCredential result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: 'tu@tu.tu', password: '123456');
    final User? user = result.user;

    if (user == null) {
      final snacBar = SnackBar(
        content: Text('Please try again later.'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snacBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Page'),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              Text('login test page~~'),
              Text('tu@tu.tu / 123456'),
              TextButton(
                onPressed: () {
                  _login(context);
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
