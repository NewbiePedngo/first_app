import 'package:first_app/counter_fulwidget.dart';
import 'package:first_app/second_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {

  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
        backgroundColor: const Color.fromARGB(255, 96, 213, 233),
      ),
      body: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(name: 'Dev', age: 22),
                  ),
                );
              },
              child: const Text('Second Page >'),
            ),
            SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CounterFulwidget(),
                  ),
                );
              },
              child: const Text('Counter Page >'),
            ),
          ],
        ),
      ),
    );
  }
}