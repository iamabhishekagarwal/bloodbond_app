import 'package:flutter/material.dart';

class receiveblood extends StatefulWidget {
  const receiveblood({super.key});

  @override
  State<receiveblood> createState() => _receivebloodState();
}

// ignore: camel_case_types
class _receivebloodState extends State<receiveblood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Receive blood"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
