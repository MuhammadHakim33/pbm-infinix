import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infinix',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Home', 
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              )
          ),
          backgroundColor: const Color.fromARGB(255, 33, 52, 72),
        ),
        body: Column(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(3),
              ),
              transform: Matrix4.rotationZ(0.03),
              child: Text(
                'Muhammad Hakim',
                style: TextStyle(
                    color: Colors.white
                  ),
                ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(3),
              ),
              transform: Matrix4.rotationZ(-0.03),
              child: Text(
                'Muhammad Rachel Fathan Idzhany',
                style: TextStyle(
                    color: Colors.white
                  ),
                ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(3),
              ),
              transform: Matrix4.rotationZ(0.03),
              child: Text(
                'Muhammad Azhar Rabbani',
                style: TextStyle(
                    color: Colors.white
                  ),
                ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(3),
              ),
              transform: Matrix4.rotationZ(-0.03),
              child: Text(
                'Dhandi Adam',
                style: TextStyle(
                    color: Colors.white
                  ),
                ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(3),
              ),
              transform: Matrix4.rotationZ(0.03),
              child: Text(
                'Antonius Valentino Dharma Kusuma',
                style: TextStyle(
                    color: Colors.white
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}

