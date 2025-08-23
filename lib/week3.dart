import 'package:flutter/material.dart';

class Week3 extends StatelessWidget {
  const Week3({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listProduct = ['Apple', 'Samsung','Oppo','Blackberry'];
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: listProduct.length,
        itemBuilder: (context, index){
          return ListTile(
            leading: Text('$index'),
            title: Text(listProduct[index]),
            trailing: Image.asset(
              'leopard2.png',
              height: 50,
              width: 50,
              ),
          );
        },
      
      ),
    );
  }
}