import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData extends StatefulWidget {
  const LocalData({super.key});

  @override
  State<LocalData> createState() => _LocalDataState();
}

class _LocalDataState extends State<LocalData> {
  final KeyName = 'Name';
  String? Name;
  List<String> NameList = [];

  late TextEditingController _controller;

  SaveData(String name) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? Names = prefs.getStringList(KeyName);
    if (Names != null) {
      Names.add(Name!);
      prefs.setStringList(KeyName, Names).then((value) {
        if (value) {
          ReadData();
        }
      });
      _controller.clear();
    } else {
      return;
    }
  }

  ReadData() async {
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove(KeyName);
    setState(() {
      NameList = prefs.getStringList(KeyName)!;
      // Name = prefs.getString(KeyName);
    });
  }

  @override
  void initState() {
    ReadData();
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Enter Name"),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: NameList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.green,
                      margin: EdgeInsets.symmetric(
                        vertical: 50,
                        horizontal: 50,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        child: Text(
                          NameList[index],
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          SaveData(_controller.text.trim());
        },
        child: Icon(
          Icons.share_arrival_time_rounded,
        ),
      ),
    );
  }
}
