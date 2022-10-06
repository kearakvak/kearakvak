import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  // final List _posts = [
  //   'post 1',
  //   'post 2',
  //   'post 3',
  //   'post 4',
  //   'post 5',
  //   'post 6',
  //   'post 7',
  //   'post 8',
  //   'post 9',
  //   'post 1',
  //   'post 2',
  //   'post 3',
  //   'post 4',
  //   'post 5',
  //   'post 6',
  //   'post 7',
  //   'post 8',
  //   'post 9',
  // ];
  final List _stories = [
    'post 1',
    'post 2',
    'post 3',
    'post 4',
    'post 5',
    'post 6',
    'post 7',
    'post 8',
    'post 9',
    'post 1',
    'post 2',
    'post 3',
    'post 4',
    'post 5',
    'post 6',
    'post 7',
    'post 8',
    'post 9',
  ];
  final List<String> imageList = [
    'assets/images/1.jpg',
    'assets/images/81GPK9hogwL._AC_SX679_.jpg',
    'assets/images/279068057_4928880287221741_6612076994450425408_n.jpg',
    'assets/images/289351371_5941997422494034_2077580732090375964_n.jpg',
    'assets/images/f8a995cfc702081dc3d084a75d1fa4c7.jpg',
    'assets/images/photo.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: ListView.builder(
              itemCount: _stories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Center(
                  child: Text(
                    'Message Page',
                    style: TextStyle(fontSize: 20),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            flex: 10,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(imageList.length, (index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    height: 200.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(imageList[index]),
                      ),
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                }),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
              child: GestureDetector(
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 74, 77, 235),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    textStyle: const TextStyle(fontSize: 28),
                    disabledForegroundColor:
                        const Color.fromARGB(255, 240, 14, 14)
                            .withOpacity(0.38),
                    backgroundColor: const Color.fromARGB(255, 99, 177, 241),
                  ),
                  onPressed: () {
                    // const Icon(Icons.person);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => SecondScreen(),
                    //   ),
                    // );
                  },
                  child: const Text(
                    "Advent",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.yellowAccent,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
