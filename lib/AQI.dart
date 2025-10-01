import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const AQIApp());
}

class AQIApp extends StatelessWidget {
  const AQIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AQI Checker',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const AQIScreen(),
    );
  }
}

class AQIScreen extends StatefulWidget {
  const AQIScreen({super.key});

  @override
  State<AQIScreen> createState() => _AQIScreenState();
}

class _AQIScreenState extends State<AQIScreen> {
  int? aqi;
  String? city;
  double? temperature;
  String status = "";
  Color statusColor = Colors.grey;

  final String token = "f34f6156492e7472148be2b34d09ccb5fcc50555";

  Future<void> fetchAQI() async {
    final url =
        "https://api.waqi.info/feed/bangkok/?token=$token"; 
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data["status"] == "ok") {
        setState(() {
          aqi = data["data"]["aqi"];
          city = data["data"]["city"]["name"];
          temperature = data["data"]["iaqi"]["t"]["v"]?.toDouble();
          updateStatus();
        });
      }
    } else {
      throw Exception("Failed to load AQI");
    }
  }

  void updateStatus() {
    if (aqi == null) return;
    if (aqi! <= 50) {
      status = "Good";
      statusColor = Colors.green;
    } else if (aqi! <= 100) {
      status = "Moderate";
      statusColor = Colors.yellow.shade700;
    } else if (aqi! <= 150) {
      status = "Unhealthy (Sensitive)";
      statusColor = Colors.orange;
    } else if (aqi! <= 200) {
      status = "Unhealthy";
      statusColor = Colors.red;
    } else if (aqi! <= 300) {
      status = "Very Unhealthy";
      statusColor = Colors.purple;
    } else {
      status = "Hazardous";
      statusColor = Colors.brown;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAQI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Air Quality Index (AQI)"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 216, 197, 236),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF7B1FA2), 
              Color(0xFF9C27B0), 
              Color(0xFFE1BEE7), 
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: aqi == null
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      city ?? "",
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "$aqi",
                      style: const TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: statusColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Temperature: ${temperature?.toStringAsFixed(1) ?? "-"}°C",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: fetchAQI,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6A1B9A),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                      ),
                      child: const Text(
                        "Refresh",
                        style: TextStyle(
                          fontSize: 18, 
                          color: Colors.white
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
