import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing4_for_flutter/add_user_screen.dart';
import 'package:testing4_for_flutter/home_screen.dart';
import 'package:testing4_for_flutter/insert_data.dart';
import 'package:testing4_for_flutter/register_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showLoginPage = true;
  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      backgroundColor: Color.fromARGB(255, 0, 255, 200),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.school_sharp,
                  color: Color.fromARGB(255, 236, 33, 33),
                  size: 150,
                ),
                SizedBox(
                  height: 20,
                ),

                Container(
                  decoration: BoxDecoration(
                    // color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: TextField(
                      obscureText: false,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 248, 5, 5)),
                      controller: usernameController,
                      decoration: InputDecoration(
                        //border: InputBorder.none,
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 28, 30, 31)),
                        hintText: 'Enter Username',
                      ),
                    ),
                  ),
                ),

                // TextField(
                //   controller: usernameController,
                //   decoration: InputDecoration(
                //     labelText: 'Enter Username',
                //   ),
                // ),

                SizedBox(
                  height: 30,
                ),
                TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Enter password'),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 74, 77, 235),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    disabledForegroundColor:
                        const Color.fromARGB(255, 240, 14, 14)
                            .withOpacity(0.38),
                    textStyle: const TextStyle(fontSize: 28),
                    backgroundColor: const Color.fromARGB(255, 99, 177, 241),
                  ),
                  onPressed: () => login(
                    usernameController.text.trim(),
                    passwordController.text.trim(),
                    context,
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                // ElevatedButton(
                //   style: TextButton.styleFrom(
                //     padding: EdgeInsets.symmetric(
                //       horizontal: 50,
                //       vertical: 10,
                //     ),
                //     disabledBackgroundColor: Colors.green,
                //     // backgroundColor: Colors.white,
                //   ),
                //   child: Text(
                //     "Register",
                //     style: TextStyle(
                //       fontSize: 20,
                //       color: Colors.red,
                //     ),
                //   ),
                //   onPressed: (() => RegisterSceen()),
                // )

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CupertinoButton(
                      // color: Colors.green,
                      // disabledColor: Colors.white,
                      child: Text(
                        'Not a member?',
                        // selectionColor: Colors.red,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                      onPressed: (() => RegisterSceen()),
                    ),
                    CupertinoButton(
                      // color: Colors.green,
                      // disabledColor: Colors.white,
                      child: Text(
                        'Register',
                        // selectionColor: Colors.red,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterSceen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future login(String username, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: username,
        password: password,
      )
          .then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HomeScreenAdd(),
          ),
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    }
  }
}
