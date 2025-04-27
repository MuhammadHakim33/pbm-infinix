import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const HomePage(),
    },
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Fetch data from the database when the app initializes
    readData();
  }

  bool isLoading = true; // Flag to indicate if data is still loading
  List<dynamic> data = []; // List to store the fetched data

  // Function to fetch data from Firebase Realtime Database
  Future<void> readData() async {
    // Replace the URL with your Firebase Realtime Database URL
    var url = "https://tugas-pbm-caf58-default-rtdb.asia-southeast1.firebasedatabase.app/" + "user.json"; // Keep "data.json" as it is

    try {
      // Send a GET request to the database
      final response = await http.get(Uri.parse(url));

      // Decode the JSON response
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      // If the response is null, return early
      if (extractedData == null) {
        return;
      }

      // Iterate through the data and add titles to the list
      // extractedData.forEach((id, data) {
      //   list.add(data);
      // });
      extractedData.forEach((id, value) {
        data.add({
          'id': id, // <-- simpan id
          'nama': value['nama'],
        });
      });

      // Update the state to indicate data loading is complete
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      // Handle any errors that occur during the request
      throw error;
    }
  }

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
        body: isLoading 
            ? CircularProgressIndicator()
            : ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(id: data[index]['id']),
                      ),
                    );
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    margin: const EdgeInsets.all(15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      data[index]["nama"],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }
            )
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  final String id;

  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Map<String, dynamic>? userData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    var url = "https://tugas-pbm-caf58-default-rtdb.asia-southeast1.firebasedatabase.app/user/${widget.id}.json";

    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body);

      setState(() {
        userData = extractedData;
        isLoading = false;
      });
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
        backgroundColor: const Color.fromARGB(255, 33, 52, 72),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : userData == null
              ? const Center(child: Text("Data tidak ditemukan"))
              : Center(
                  child: Text(
                    "Nama: ${userData!['nama']}",
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
    );
  }
}
