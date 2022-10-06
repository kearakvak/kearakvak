import 'package:flutter/material.dart';

class UserMessage extends StatelessWidget {
  const UserMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Message Page',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
