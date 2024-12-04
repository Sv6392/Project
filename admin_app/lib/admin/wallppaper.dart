import 'package:flutter/material.dart';

class WallpaperScreen extends StatelessWidget {
  const WallpaperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallpaper'),
      ),
      body: const Center(
        child: Text(
          ' Wallpaper screen',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}