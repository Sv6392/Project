import 'package:flutter/material.dart';

class PlanManagementScreen extends StatelessWidget {
  const PlanManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PlanManagement'),
      ),
      body: const Center(
        child: Text(
          ' PlanManagement screen',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}