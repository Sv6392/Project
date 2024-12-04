import 'package:flutter/material.dart';

class StyleScreen extends StatelessWidget {
  const StyleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Style'),
      ),
      body: const Center(
        child: Text(
          ' Style screen',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}