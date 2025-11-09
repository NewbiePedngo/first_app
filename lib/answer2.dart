import 'package:flutter/material.dart';

class Answer2ConcertTicket extends StatelessWidget {
  const Answer2ConcertTicket ({super.key});

  static const Color ticketBackgroundColor = Color.fromARGB(255, 230, 234, 236); 
  static const Color barcodeSectionColor = Color.fromARGB(255, 69, 90, 100); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 220, 220, 220),
      appBar: AppBar(
        title: const Text('Concert Ticket'),
        backgroundColor: const Color.fromARGB(255, 82, 92, 96),
        foregroundColor: const Color.fromARGB(255, 9, 9, 9),
      ),
      body: Center(
        child: Container(
          width: 300, 
          height: 180, 
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 199, 209, 212), 
            borderRadius: BorderRadius.circular(15), 
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3, 
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, 
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Flutter Live',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12),
                          
                          Text('Band: The Widgets'), 
                          SizedBox(height: 8),
                          Text('Date: 8 NOV 2025'), 
                          SizedBox(height: 8),
                          Text('Gate: 7'), 
                        ],
                      ),
                    ),
                  ),
                  
                  Expanded(
                    flex: 1, 
                    child: Container(
                      color: const Color.fromARGB(255, 73, 80, 83), 
                      child: const Center(
                        child: Icon(
                          Icons.qr_code_sharp, 
                          color: Colors.white, 
                          size: 50
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const Positioned(
                top: 0,
                bottom: 0,
                left: 210, 
                child: Center(
                  child: Icon(
                    Icons.more_vert, 
                    color: Colors.white,
                    size: 16,
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