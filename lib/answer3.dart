import 'package:flutter/material.dart';

class Answer3CarWash extends StatefulWidget {
  const Answer3CarWash({super.key});

  @override
  State<Answer3CarWash> createState() => _Answer3CarWashState();
}

class _Answer3CarWashState extends State<Answer3CarWash> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int? _basePrice = 150; 
  
  final List<Map<String, dynamic>> _carOptions = const [
    {'name': 'รถเล็ก (Small)', 'price': 150},
    {'name': 'รถเก๋ง (Medium)', 'price': 200},
    {'name': 'รถ SUV/กระบะ (Large)', 'price': 250},
  ];

  bool _vacuum = false; 
  bool _wax = false; 


  int _calculateTotal() {
    int total = _basePrice ?? 0;
    
    if (_vacuum) {
      total += 50; 
    }
    if (_wax) {
      total += 100;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final int total = _calculateTotal(); 

    return Scaffold(
      appBar: AppBar(
        title: const Text('คำนวณค่าบริการล้างรถ'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        foregroundColor: const Color.fromARGB(255, 30, 30, 30),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form( 
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DropdownButtonFormField<int>(
                  value: _basePrice, 
                  decoration: const InputDecoration(
                    labelText: 'ขนาดรถ',
                    border: OutlineInputBorder(), 
                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple), 
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
                    ),
                    labelStyle: TextStyle(color: Colors.deepPurple),
                  ),
                  items: _carOptions.map((option) {
                    return DropdownMenuItem<int>(
                      value: option['price'] as int,
                      child: Text('${option['name']} - ${option['price']} บาท'),
                    );
                  }).toList(),
                  onChanged: (int? newValue) {
                    setState(() {
                      _basePrice = newValue;
                    });
                  },
                ),
                
                const SizedBox(height: 20),

                CheckboxListTile(
                  title: const Text('ดูดฝุ่น (+50 บาท)'),
                  value: _vacuum,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _vacuum = newValue ?? false;
                    });
                  },
                  activeColor: Colors.deepPurple, 
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.trailing,
                ),

                CheckboxListTile(
                  title: const Text('เคลือบแว็กซ์ (+100 บาท)'),
                  value: _wax,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _wax = newValue ?? false;
                    });
                  },
                  activeColor: Colors.deepPurple, 
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.trailing,
                ),

                const SizedBox(height: 30),                
                const Divider(height: 1, thickness: 0.8, color: Colors.black45),
                const SizedBox(height: 30),

                Center(
                  child: Text(
                    'ราคารวม: $total บาท',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, 
                    ),
                  ),
                ),

              //  const SizedBox(height: 30),
                //ElevatedButton(
                  //onPressed: () {
                    //ScaffoldMessenger.of(context).showSnackBar(
                      //const SnackBar(content: Text('ราคาได้รับการคำนวณและอัปเดตอัตโนมัติแล้ว')),
                   // );
                 // },
                 // child: const Text('คํานวณราคา'),
               // ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}