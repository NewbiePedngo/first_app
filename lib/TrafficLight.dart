import 'package:flutter/material.dart';

void main() {
  runApp(const TrafficLightApp());
}

const int RED_INDEX = 0;
const int YELLOW_INDEX = 1;
const int GREEN_INDEX = 2;

class TrafficLightApp extends StatelessWidget {
  const TrafficLightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traffic Light Animation',
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: true,
      ),
      home: const TrafficLightScreen(),
    );
  }
}

class TrafficLightScreen extends StatefulWidget {
  const TrafficLightScreen({super.key});

  @override
  State<TrafficLightScreen> createState() => _TrafficLightScreenState();
}

class _TrafficLightScreenState extends State<TrafficLightScreen> {
  int _currentStateIndex = RED_INDEX; 
  
  static const double _onOpacity = 1.0;
  static const double _offOpacity = 0.3;

  static const Duration _transitionDuration = Duration(milliseconds: 500);

  void _changeLight() {
    setState(() {
      _currentStateIndex = (_currentStateIndex + 1) % 3; 
    });
  }
  Widget _buildLight({required Color color, required int lightIndex}) {
    double opacity = (_currentStateIndex == lightIndex) ? _onOpacity : _offOpacity;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: AnimatedOpacity(
        opacity: opacity,
        duration: _transitionDuration,
        child: Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.5),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Traffic Light Animation'),
        backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      ),
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: <Widget>[
                  _buildLight(color: Colors.red, lightIndex: RED_INDEX),
                  _buildLight(color: Colors.yellow, lightIndex: YELLOW_INDEX),
                  _buildLight(color: Colors.green, lightIndex: GREEN_INDEX),
                ],
              ),
            ),
            
            const SizedBox(height: 50.0),

            ElevatedButton(
              onPressed: _changeLight, 
              child: const Text('เปลี่ยนไฟ'),
            ),
          ],
        ),
      ),
    );
  }
}