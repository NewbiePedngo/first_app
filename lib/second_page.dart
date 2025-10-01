import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String name;
  final int age;
  
  const SecondPage({
    super.key,
    this.name = 'Dev',
    this.age = 22,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        backgroundColor: const Color.fromARGB(255, 126, 152, 249),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello, my name is $name',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'I am $age years old.',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('< Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}