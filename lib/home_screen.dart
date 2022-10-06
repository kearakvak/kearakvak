import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_user_3.dart';

class HomeScreenAdd extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomeScreenAdd({super.key});
  final TextEditingController FirstName = TextEditingController();
  final TextEditingController LastName = TextEditingController();
  final TextEditingController Age = TextEditingController();

  void dispose() {
    FirstName.dispose();
    LastName.dispose();
    Age.dispose();
  }

  // CollectionReference users = FirebaseFirestore.instance.collection('users');
  // String fullName = 'phak kearakvak';
  // String company = 'Noky';
  // int age = 23;
  // Future<void> addUser() {
  //   // Call the user's CollectionReference to add a new user
  //   return users
  //       .add({
  //         'full_name': fullName, // John Doe
  //         'company': company, // Stokes and Sons
  //         'age': age // 42
  //       })
  //       .then((value) => print("User Added"))
  //       .catchError((error) => print("Failed to add user: $error"));
  // }

  @override
  Widget build(BuildContext context) {
    var firstName2 = FirstName;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Screen for Add User'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hello Ther",
                  style: GoogleFonts.bahiana(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //First Name Textfield
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: FirstName,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Firest Name',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //Last Name Textfield
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: LastName,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Last Name',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                // //Email Textfield
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 25.0),
                //   child: TextField(
                //     controller: _emailController,
                //     decoration: InputDecoration(
                //       enabledBorder: OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: Colors.white,
                //         ),
                //         borderRadius: BorderRadius.circular(12),
                //       ),
                //       hintText: 'Email',
                //       fillColor: Colors.grey[200],
                //       filled: true,
                //     ),
                //   ),
                // ),
                // PassWord Textfield
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 25.0),
                //   child: TextField(
                //     controller: _passwordController,
                //     decoration: InputDecoration(
                //       enabledBorder: OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: Colors.white,
                //         ),
                //         borderRadius: BorderRadius.circular(12),
                //       ),
                //       hintText: 'PassWord',
                //       fillColor: Colors.grey[200],
                //       filled: true,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                SizedBox(
                  height: 10,
                ),
                //Age Textfield
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: Age,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Age ',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //Confirm Textfield
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 25.0),
                //   child: TextField(
                //     controller: _confirmpasswordContorller,
                //     decoration: InputDecoration(
                //       enabledBorder: OutlineInputBorder(
                //         borderSide: BorderSide(
                //           color: Colors.white,
                //         ),
                //         borderRadius: BorderRadius.circular(12),
                //       ),
                //       hintText: 'Confirm password',
                //       fillColor: Colors.grey[200],
                //       filled: true,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: CupertinoButton(
                    onPressed: dispose,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                          child: Text(
                        'Sing In',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                AddUser3(
                  firstName: FirstName,
                  lastName: LastName,
                  age: Age,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: null,
                      child: Text(
                        'Register Now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          // child: Padding(
          // padding: EdgeInsets.all(8.0),
          // child: CupertinoButton(
          //   color: Colors.red,
          //   onPressed: addUser,
          //   child: Text('Add User'),

          // () {
          //   // addUser().then((value) => Navigator.push(context,MaterialPageRoute(builder: (context){
          //   //   return UserScreen();
          //   // })));
          // },
        ),
      ),
      // ),
      // ),
    );
  }
}
