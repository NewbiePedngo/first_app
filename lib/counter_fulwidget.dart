import 'package:flutter/material.dart';

class CounterFulwidget extends StatefulWidget {
  const CounterFulwidget({super.key});

  @override
  State<CounterFulwidget> createState() => _CounterFulwidgetState();
}

class _CounterFulwidgetState extends State<CounterFulwidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter Value:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$counter',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                  child: const Text('+ Increment'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter--;
                    });
                  },
                  child: const Text('- Decrement'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter = 0;
                    });
                  },
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}