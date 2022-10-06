import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser3 extends StatelessWidget {
  final ValueNotifier firstName;
  final ValueNotifier lastName;
  final ValueNotifier age;
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    age.dispose();
  }

  AddUser3({
    required this.firstName,
    required this.lastName,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'First_name': firstName, // John Doe
            'Last_name': lastName, // Stokes and Sons
            'age': age, // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addUser,
      onLongPress: dispose,
      child: Text(
        "Add User",
      ),
    );
  }
}
