import 'package:flutter/material.dart';

class Donateblood extends StatefulWidget {
  const Donateblood({super.key});

  @override
  State<Donateblood> createState() => _LearnflutterpageState();
}

class _LearnflutterpageState extends State<Donateblood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("donate blood"),
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
