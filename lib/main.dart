import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const HomePage(),
      '/message': (context) => const MessagePage(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              margin: EdgeInsets.all(15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(3),
              ),
              transform: Matrix4.rotationZ(0.01),
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
              margin: EdgeInsets.all(15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(3),
              ),
              transform: Matrix4.rotationZ(-0.01),
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
              margin: EdgeInsets.all(15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(3),
              ),
              transform: Matrix4.rotationZ(0.01),
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
              margin: EdgeInsets.all(15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(3),
              ),
              transform: Matrix4.rotationZ(-0.01),
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
              margin: EdgeInsets.all(15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(3),
              ),
              transform: Matrix4.rotationZ(0.01),
              child: Text(
                'Antonius Valentino Dharma Kusuma',
                style: TextStyle(
                    color: Colors.white
                  ),
                ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 33, 52, 72),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)
                  )
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/message');
                }, 
                child: Text(
                  'Tulis Pesan',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<MessagePage> {

  late String name;
  late String alamat;
  late String pesan;

  String message = '';

  void submit() {
    setState(() {
      message = '''
        Pengirim : $name
        Alamat : $alamat
        Pesan : $pesan
      ''';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infinix - Message',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Message', 
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              )
          ),
          backgroundColor: const Color.fromARGB(255, 33, 52, 72),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) => name = value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                decoration: const InputDecoration(labelText: 'Alamat'),
                onChanged: (value) => alamat = value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                decoration: const InputDecoration(labelText: 'Pesan'),
                onChanged: (value) => pesan = value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 2, 88, 180),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)
                  )
                ),
                onPressed: submit, 
                child: Text(
                  'Kirim',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(message),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 33, 52, 72),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)
                  )
                ),
                onPressed: () {
                  Navigator.pop(context);
                }, 
                child: Text(
                  'Kembali',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}