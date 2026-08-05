import 'package:flutter/material.dart';

void main() {
  runApp(const DocumentBookApp());
}

class DocumentBookApp extends StatelessWidget {
  const DocumentBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Document Book',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> documents = const [
    {'name': 'Aadhar Card.pdf', 'type': 'ID Proof'},
    {'name': 'PAN Card.pdf', 'type': 'ID Proof'},
    {'name': 'Marksheet 10th.pdf', 'type': 'Education'},
    {'name': 'Resume.pdf', 'type': 'Job'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Book'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: documents.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: const Icon(Icons.picture_as_pdf, color: Colors.red, size: 40),
              title: Text(documents[index]['name']!),
              subtitle: Text(documents[index]['type']!),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${documents[index]['name']} Opened')),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}