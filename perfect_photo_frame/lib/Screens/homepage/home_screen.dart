
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 final String imageUrl = 'https://example.com/image.jpg'; // Replace with the URL of the photo

  // Future<void> downloadPhoto() async {
  //   // Request storage permission
  //   if (await Permission.storage.request().isGranted) {
  //     final externalDir = Directory('/storage/emulated/0/Download');

  //     await FlutterDownloader.enqueue(
  //       url: imageUrl,
  //       savedDir: externalDir.path,
  //       fileName: 'downloaded_image.jpg',
  //       showNotification: true,
  //       openFileFromNotification: true,
  //     );

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Download started! Check your Downloads folder.')),
  //     );
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Storage permission is required to download.')),
  //     );
  //   }
  // }


Future<void> downloadPhoto(String imageUrl) async {
  // Request storage permission
   var status = await Permission.storage.status;

  if (!status.isGranted) {
    print("not granted storage permission");
    status = await Permission.storage.request();
  }

  if (status.isGranted) {
    // Code to proceed with downloading and saving the photo
    print("yes");
   
    // Save or move the file to this directory
  } else {
    // Permission denied - inform the user or handle as necessary
    print("Storage permission denied.");
  }
  if (true) {
    try {
      // Download the image as bytes
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        // Save the image to the gallery
        final Uint8List bytes = response.bodyBytes;
        final result = await ImageGallerySaver.saveImage(bytes, quality: 80, name: "downloaded_photo");

        if (result['isSuccess']) {
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Image saved to gallery successfully! , check your gallery'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          print("Failed to save the image to the gallery.");
        }
      } else {
        print("Failed to download image.");
      }
    } catch (e) {
      print("Error downloading or saving image: $e");
    }
  } else {
    print("Storage permission denied.");
  }
}

List<String > allImages =["https://firebasestorage.googleapis.com/v0/b/distributor-app-d166b.appspot.com/o/WhatsApp%20Image%202024-11-08%20at%2018.30.48%20(1).jpeg?alt=media&token=6db12544-4e4b-4608-8045-6f61d2ef9513",
"https://firebasestorage.googleapis.com/v0/b/distributor-app-d166b.appspot.com/o/WhatsApp%20Image%202024-11-08%20at%2018.30.47.jpeg?alt=media&token=10021771-338b-4a9b-b49c-1cac5249615b",
"https://firebasestorage.googleapis.com/v0/b/distributor-app-d166b.appspot.com/o/WhatsApp%20Image%202024-11-08%20at%2018.30.48%20(2).jpeg?alt=media&token=a5a3a188-2710-44bf-acef-69cd1d7e83eb",
"https://firebasestorage.googleapis.com/v0/b/distributor-app-d166b.appspot.com/o/WhatsApp%20Image%202024-11-08%20at%2018.30.48.jpeg?alt=media&token=2128ef45-981a-4344-8d41-6e2d4f3b7431",
"https://firebasestorage.googleapis.com/v0/b/distributor-app-d166b.appspot.com/o/WhatsApp%20Image%202024-11-08%20at%2018.30.47%20(4).jpeg?alt=media&token=80bda675-3e27-4ae3-a789-3b0c019bd0d7",
"https://firebasestorage.googleapis.com/v0/b/distributor-app-d166b.appspot.com/o/WhatsApp%20Image%202024-11-08%20at%2018.30.47%20(1).jpeg?alt=media&token=785ee6b1-3b7c-4e37-8765-2a90d884810f",

  ];


   Future<void> shareImage(String imageUrl) async {
    try {
      // Step 1: Download the image using http
      final response = await http.get(Uri.parse(imageUrl));

      // Check if the request was successful
      if (response.statusCode == 200) {
        final contentType = response.headers['content-type'];
        

        // Step 4: Share the image using Share Plus
        final image = XFile.fromData(
          response.bodyBytes,
          mimeType: contentType,
          );
          await Share.shareXFiles([image]);
        // await Share.shareXFiles([file], text: 'Check out this image!');
      } else {
        throw Exception('Failed to download image');
      }
    } catch (e) {
      print('Error sharing image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to share image')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      appBar: AppBar(
        // title: Text("Home"),
        actions: [
          SizedBox(width: 10,),
           Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Add Create action here
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 24.0,  // You can specify the size here
                        color: Colors.blue,  // And the color here
                      ),
                      
                      Text("Create"),
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                InkWell(
                  onTap: ()
                  {
                      Get.toNamed('/profile');
                  },
                   child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[300], // Background color for the placeholder
                    child: Icon(
                      Icons.person,
                      size: 20,
                      color: Colors.white,
                    ),
                                   ),
                 )
                ,
                SizedBox(width: 10,),

                
        ],
      ),
      body: Column(
        children: [
          // Search Bar and Create Button
          
          // Category Buttons
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryButton("All"),
                CategoryButton("Day's Special"),
                CategoryButton("Birthday"),
                CategoryButton("Chhath Puja"),
                CategoryButton("Anniversary"),
                CategoryButton("Political"),
                CategoryButton("Good Morning"),
                CategoryButton("Motivation"),
                CategoryButton("Love"),
                CategoryButton("New"),
                // Add more buttons as required
              ],
            ),
          ),
          SizedBox(height: 16),
          // Main Content


            SizedBox(
              height: 80.h,
              child: ListView.builder(
                itemCount: 30, // Number of items in the list
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return   Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
        // Background Network Image
        Container(
          width:  95.w ,
          height: 50.h,
          child: Image.network(
           allImages[index%6],
            fit: BoxFit.contain,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            errorBuilder: (context, error, stackTrace) => const Center(
              child: Text('Failed to load image'),
            ),
          ),
        ),
        
        
          //       Text(
          //         "मिले हुए समय को ही अच्छा बनाएं  \nअगर अच्छे समय की राह देखेंगे तो \n पूरा जीवन कम पड़ जाएगा",
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //           fontSize: 24,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.black,
          //         ),
          //       ),
          //       SizedBox(height: 30.h),
          //       CircleAvatar(
          //       radius: 50,
          //       backgroundColor: Colors.grey[300], // Background color for the placeholder
          //       child: Icon(
          //         Icons.person,
          //         size: 50,
          //         color: Colors.white,
          //       ),
          //     )
          // ,
          //       SizedBox(height: 8),
          //       Text(
          //         "Test",
          //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //       ),
                   Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Share functionality
                    shareImage(allImages[index%6]);
                  },
                  icon: Icon(Icons.share),
                  label: Text("Share"),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Download functionality
                    downloadPhoto(allImages[index%6]);
                  },
                  icon: Icon(Icons.download),
                  label: Text("Download"),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Edit functionality
                  },
                  icon: Icon(Icons.edit),
                  label: Text("Edit"),
                ),
              ],
            ),
          ),
      
              ],
            ),
          );
        
                },
              ),
            ),

          // Bottom Buttons
         ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;

  CategoryButton(this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: OutlinedButton(
        onPressed: () {
          // Action for button
        },
        child: Text(label),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Center(
//         child: Column(
//           children: [
            
//             //top section of suggestions
//             Expanded(
//               child: GridView.builder(
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 6, // Number of items per row
//                         childAspectRatio: 1.0, // Aspect ratio to make each cell square
//                       ),
//                       itemCount: 20,
//                       itemBuilder: (context, index) {
//                         return Card(
//               margin: const EdgeInsets.all(4),
//               color: Colors.blueAccent,
//               child: Center(
//                 child: Text(
//                   "Item ${index + 1}",
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ),
//                         );
//                       }),

                      
//             ),

//             //middle section of cta 
//             // ListView.builder(itemBuilder: itemBuilder)

//           ],
//         ),
//       ),
//     );
//   }
// }