import 'package:flutter/material.dart';

class ColorManagementScreen extends StatelessWidget {
  const ColorManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ColorManagement'),
      ),
      body: const Center(
        child: Text(
          ' ColorManagement screen',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}