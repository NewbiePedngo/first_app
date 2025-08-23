import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          height: 250,
          width: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                  child: const Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('Me.jpg'),
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        " ༉‧₊˚. Hi! Nice to meet you`•.¸✯ ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: SingleChildScrollView(
                          child: const Text(
                            "My name is Jiraporn Sresaisuk,\n"
                            "I'm a student at Silpakorn University,\n"
                            "Faculty of Science, Department of Information Technology.\n"
                            "*୨୧ ┈┈┈┈┈┈┈┈┈┈┈┈ ୨୧*\n"
                            "My favorite ʕ•ᴥ•ʔﾉ♡\n"
                            "I enjoy playing games, listening to music, and drawing.\n"
                            "Not my favorite ʕ ´•̥̥̥ ᴥ•̥̥̥`ʔ\n"
                            "I don't particularly like insects.",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.facebook),
                                  SizedBox(width: 5),
                                  Text(
                                    "Jiraporn Sresaisuk",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: const [
                                  Icon(Icons.camera_alt),
                                  SizedBox(width: 5),
                                  Text(
                                    "mami.pxkpox",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
