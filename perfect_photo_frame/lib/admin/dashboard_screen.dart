import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AdminDashboard extends StatelessWidget {
  final List<Map<String, dynamic>> _dashboardItems = [
    {'title': 'Dashboard', 'icon': Icons.home, 'route': AppRoutes.dashboard},
    {'title': 'Cat Mgmt', 'icon': Icons.category, 'route': AppRoutes.catMgmt},
    {'title': 'Sub Cat Mgmt', 'icon': Icons.subtitles, 'route': AppRoutes.subCatMgmt},
    {'title': 'Users Mgmt', 'icon': Icons.people, 'route': AppRoutes.usersMgmt},
    {'title': 'Wallpapers', 'icon': Icons.wallpaper, 'route': AppRoutes.wallpapers},
    {'title': 'Quotes Mgmt', 'icon': Icons.format_quote, 'route': AppRoutes.quotesMgmt},
    {'title': 'Color Mgmt', 'icon': Icons.color_lens, 'route': AppRoutes.colorMgmt},
    {'title': 'Plan Mgmt', 'icon': Icons.event_note, 'route': AppRoutes.planMgmt},
    {'title': 'Style Mgmt', 'icon': Icons.style, 'route': AppRoutes.styleMgmt},
    {'title': 'Frame Mgmt', 'icon': Icons.crop_free, 'route': AppRoutes.frameMgmt},
    {'title': 'Subscriptions', 'icon': Icons.subscriptions, 'route': AppRoutes.subscriptions},
    {'title': 'History', 'icon': Icons.history, 'route': AppRoutes.history},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      drawer: _buildDrawer(context), // Added Drawer
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        itemCount: _dashboardItems.length,
        itemBuilder: (context, index) {
          final item = _dashboardItems[index];
          return GestureDetector(
            onTap: () {
              Get.toNamed(item['route']);
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item['icon'], size: 40, color: Colors.blue),
                  SizedBox(height: 10),
                  Text(item['title'], style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Drawer Widget
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Admin'),
            accountEmail: Text('admin@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40, color: Colors.blue),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Get.toNamed('/settings');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  // Logout Confirmation Dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Get.offAllNamed('/welcome'); // Redirect to login screen
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'app_routes.dart';

// class AdminDashboard extends StatelessWidget {
//   final List<Map<String, dynamic>> _dashboardItems = [
//     {'title': 'Dashboard', 'icon': Icons.home, 'route': AppRoutes.dashboard},
//     {'title': 'Cat Mgmt', 'icon': Icons.category, 'route': AppRoutes.catMgmt},
//     {'title': 'Sub Cat Mgmt', 'icon': Icons.subtitles, 'route': AppRoutes.subCatMgmt},
//     {'title': 'Users Mgmt', 'icon': Icons.people, 'route': AppRoutes.usersMgmt},
//     {'title': 'Wallpapers', 'icon': Icons.wallpaper, 'route': AppRoutes.wallpapers},
//     {'title': 'Quotes Mgmt', 'icon': Icons.format_quote, 'route': AppRoutes.quotesMgmt},
//     {'title': 'Color Mgmt', 'icon': Icons.color_lens, 'route': AppRoutes.colorMgmt},
//     {'title': 'Plan Mgmt', 'icon': Icons.event_note, 'route': AppRoutes.planMgmt},
//     {'title': 'Style Mgmt', 'icon': Icons.style, 'route': AppRoutes.styleMgmt},
//     {'title': 'Frame Mgmt', 'icon': Icons.crop_free, 'route': AppRoutes.frameMgmt},
//     {'title': 'Subscriptions', 'icon': Icons.subscriptions, 'route': AppRoutes.subscriptions},
//     {'title': 'History', 'icon': Icons.history, 'route': AppRoutes.history},
//   ];

//    AdminDashboard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Admin Dashboard'),
//       ),
//       body: GridView.builder(
//         padding: EdgeInsets.all(16.0),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         itemCount: _dashboardItems.length,
//         itemBuilder: (context, index) {
//           final item = _dashboardItems[index];
//           return GestureDetector(
//             onTap: () {
//               Get.toNamed(item['route']);
//             },
//             child: Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(item['icon'], size: 40, color: Colors.blue),
//                   SizedBox(height: 10),
//                   Text(item['title'], style: TextStyle(fontSize: 16)),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
