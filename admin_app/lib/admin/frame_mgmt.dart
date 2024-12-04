import 'package:flutter/material.dart';

class FrameManagementScreen extends StatelessWidget {
  const FrameManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FrameManagement'),
      ),
      body: const Center(
        child: Text(
          ' FrameManagement screen',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}