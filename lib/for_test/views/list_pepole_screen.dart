import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:testing4_for_flutter/for_test/views/create_people_screen.dart';

import '../people_controller.dart';
import '../people_model.dart';

class ListPeopleScreen extends StatefulWidget {
  const ListPeopleScreen({Key? key}) : super(key: key);

  @override
  State<ListPeopleScreen> createState() => _ShowPeopleState();
}

class _ShowPeopleState extends State<ListPeopleScreen> {
  List<PeopleModel> list = [];
  bool isLoaded = false;
  _selectData() async {
    list = await PeopleController().selectPeople();
    isLoaded = true;
    setState(() {});
  }

  Image fromImageString(String imageString) {
    return Image.memory(base64Decode(imageString));
  }

  @override
  void initState() {
    _selectData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People List'),
        centerTitle: true,
      ),
      body: isLoaded
          ? ListView.separated(
              itemBuilder: (context, index) {
                var data = list[index];
                return ListTile(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => DetailPeople(peopleModel: data),
                    //   ),
                    // );
                  },
                  leading: CircleAvatar(
                    backgroundImage: data.photo.isNotEmpty
                        ? fromImageString(data.photo).image
                        : const AssetImage('assets/person.png'),
                  ),
                  title: Text(data.name),
                  subtitle: Text(data.address),
                  trailing: IconButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => DetailPeople(peopleModel: data),
                      //   ),
                      // );
                    },
                    icon: const Icon(Icons.edit, size: 20.0),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(height: 0.0);
              },
              itemCount: list.length,
            )
          : const Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreatePeopleScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
