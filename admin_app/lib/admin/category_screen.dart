import 'package:admin_app/utils/text_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  // Sample Data
  List<Map<String, String>> categories = [
    {'name': 'Quotes', 'status': 'active', 'createdAt': '10/11/2024'},
    {'name': 'Morning 2', 'status': 'active', 'createdAt': '10/11/2024'},
    {'name': 'Festvals', 'status': 'active', 'createdAt': '11/11/2024'},
    {'name': 'Daily', 'status': 'active', 'createdAt': '12/11/2024'},
  ];

  // Controllers and variables for adding new category
  final TextEditingController _nameController = TextEditingController();
  String _selectedStatus = 'active';

  // Method to delete a category
  void deleteCategory(int index) {
    setState(() {
      categories.removeAt(index);
    });
  }

  // Method to add a new category
  void addCategory() {
    if (_nameController.text.isNotEmpty) {
      setState(() {
        categories.add({
          'name': _nameController.text,
          'status': _selectedStatus,
          'createdAt': DateFormat('dd/MM/yyyy').format(DateTime.now()),

        });
      });
      Navigator.of(context).pop();
      _nameController.clear();
    }
  }



  // Method to show the Add Category Dialog
  void showAddCategoryDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return  AlertDialog(
              contentPadding: EdgeInsets.all(10),
              insetPadding: EdgeInsets.all(40),
              title: Text('Add New Category'),
              content:  SizedBox(
                width: 90.w,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                
                
                
                   EnsoTextFormField(fontSize: 16,
                      controller:  _nameController,
                      hint: "Enter Category",
                      keyboardType: TextInputType.text,
                        // autoFocus: true,
                        borderRadius: 12,
                        
                        
                      ),
                      // TextField(
                      //   controller: _nameController,
                      //   decoration: InputDecoration(
                      //     labelText: 'Name',
                      //     border: OutlineInputBorder(),
                      //   ),
                      // ),
                      SizedBox(height: 20),
                      Text('Status:'),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'active',
                            groupValue: _selectedStatus,
                            onChanged: (value) {
                              setState(() {
                                _selectedStatus = value!;
                              });
                            },
                          ),
                          Text('Active'),
                          Radio<String>(
                            value: 'inactive',
                            groupValue: _selectedStatus,
                            onChanged: (value) {
                              setState(() {
                                _selectedStatus = value!;
                              });
                            },
                          ),
                          Text('Inactive'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        _nameController.clear();
                      },
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: addCategory,
                      child: Text('Add Category'),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category List'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: showAddCategoryDialog,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('+ Add category', style: TextStyle( color: Colors.white),),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: Text(
                        (index + 1).toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(categories[index]['name']!),
                      subtitle: Text(
                          'Status: ${categories[index]['status']}\nCreated At: ${categories[index]['createdAt']}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deleteCategory(index),
                      ),
                      isThreeLine: true,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
