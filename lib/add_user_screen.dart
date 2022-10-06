import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddUser extends StatelessWidget {
  AddUser({
    super.key,
  });

  TextEditingController fullName = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController age = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'full_name': fullName, // John Doe
          'company': company, // Stokes and Sons
          'age': age // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  // String textval;
  // void plzclickme() {
  //   StepState(() {
  //     textval = age.text;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Screen for Add User'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: fullName,
                decoration: InputDecoration(
                  labelText: 'Enter Username',
                ),
              ),
              TextField(
                controller: company,
                decoration: InputDecoration(
                  labelText: 'Enter PassWord',
                ),
              ),
              TextField(
                controller: age,
                decoration: InputDecoration(
                  labelText: 'age',
                ),
              ),
              CupertinoButton(
                color: Colors.red,
                child: Text('Register'),
                onPressed: () {
                  Navigator.pop(context);
                  addUser();
                },
                //   actions:[
                //    FlatButton(
                //   color: Colors.red,
                //   child: Text('Register'),
                //   onPressed: () {
                //     Navigator.pop(context);
                //     addUser();
                //   },
                // ),
              ),
            ],
          ),
        ),
      ),
      // body: SafeArea(
      //   child: Center(
      //     child: SingleChildScrollView(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           SizedBox(
      //             height: 10,
      //           ),
      //           //First Name Textfield
      //           Padding(
      //             padding: EdgeInsets.symmetric(horizontal: 25.0),
      //             child: TextField('git' is not recognized as an internal or external command
      //               controller: fullName,
      //               decoration: InputDecoration(
      //                 enabledBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(
      //                     color: Colors.white,
      //                   ),
      //                   borderRadius: BorderRadius.circular(12),
      //                 ),
      //                 hintText: 'Firest Name',
      //                 fillColor: Colors.grey[200],
      //                 filled: true,
      //               ),
      //             ),
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           //Last Name Textfield
      //           Padding(
      //             padding: EdgeInsets.symmetric(horizontal: 25.0),
      //             child: TextField(
      //               controller: company,
      //               decoration: InputDecoration(
      //                 enabledBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(
      //                     color: Colors.white,
      //                   ),
      //                   borderRadius: BorderRadius.circular(12),
      //                 ),
      //                 hintText: 'Last Name',
      //                 fillColor: Colors.grey[200],
      //                 filled: true,
      //               ),
      //             ),
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Padding(
      //             padding: EdgeInsets.symmetric(horizontal: 25.0),
      //             child: TextField(
      //               controller: age,
      //               decoration: InputDecoration(
      //                 enabledBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(
      //                     color: Colors.white,
      //                   ),
      //                   borderRadius: BorderRadius.circular(12),
      //                 ),
      //                 hintText: 'Agepha',
      //                 fillColor: Colors.grey[200],
      //                 filled: true,
      //               ),
      //             ),
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Padding(
      //             padding: EdgeInsets.symmetric(
      //               horizontal: 25.0,
      //             ),
      //             child: CupertinoButton(
      //               onPressed: addUser,
      //               child: Container(
      //                 padding: EdgeInsets.all(20),
      //                 decoration: BoxDecoration(
      //                   color: Colors.deepPurple,
      //                   borderRadius: BorderRadius.circular(12),
      //                 ),
      //                 child: Center(
      //                     child: Text(
      //                   'Add Uer',
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                     fontWeight: FontWeight.bold,
      //                     fontSize: 18,
      //                   ),
      //                 )),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
    // return CupertinoButton(
    //   color: Colors.red,
    //   onPressed: addUser,
    //   child: Text(
    //     "Add User",
    //   ),
    // );
  }
}
