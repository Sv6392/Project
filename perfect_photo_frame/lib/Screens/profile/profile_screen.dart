import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:perfect_photo_frame/utils/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _profileImage; // Variable to store the profile image

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile Picture
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
                child: _profileImage == null
                    ? Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
            SizedBox(height: 16),
            // Name
            Text(
              "Test Account", // Replace with dynamic data if needed
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Email (Optional)
            Text(
              "test@example.com", // Replace with actual email or remove if not needed
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            Spacer(),
            // Logout Button
            CooeeCustomElevatedButton(
              onPressed: () {
                // Add logout functionality
                  Get.offAllNamed('/welcome');
              },
              // icon: Icon(Icons.logout),
              // label:"Logout",
               backgroundColor: Colors.red, text: 'Logout', textColor: Colors.white,
             
            ),
            SizedBox(height: 16),
            // App Version
            Text(
              "Version 1.0.0", // Replace with dynamic version if needed
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
