import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterSceen extends StatelessWidget {
  RegisterSceen({super.key});

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    const SizedBox mainSpacing = SizedBox(height: 20);
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: username,
                decoration: InputDecoration(
                  labelText: 'Enter Username',
                ),
              ),
              mainSpacing,
              TextField(
                controller: password,
                decoration: InputDecoration(
                  labelText: 'Enter PassWord',
                ),
              ),
              mainSpacing,
              CupertinoButton(
                color: Colors.red,
                child: Text('Register'),
                onPressed: () {
                  register();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future register() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: username.text,
        password: password.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
