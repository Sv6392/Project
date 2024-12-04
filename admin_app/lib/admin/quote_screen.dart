import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:admin_app/utils/color_constant.dart';
import 'package:admin_app/utils/custom_button.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final TextEditingController _quoteController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Firestore instance
  // final CollectionReference _quotesCollection =
  //     FirebaseFirestore.instance.collection('quotes');

  // Function to save the quote to Firestore
  Future<void> saveQuote() async {
    String quoteText = _quoteController.text.trim();

    if (quoteText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a quote!')),
      );
      return;
    }

    try {
      // await _quotesCollection.add({
      //   'quote': quoteText,
      //   'timestamp': Timestamp.now(),
      // });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Quote saved successfully!')),
      );

      _quoteController.clear();
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save quote: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Hindi Quote'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter Your Quote:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _quoteController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'अपना हिंदी कोट यहाँ लिखें...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: TextStyle(fontSize: 16),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Quote cannot be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: CooeeCustomElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      saveQuote();
                    }
                  },
                  
                   backgroundColor: ColorConstant.appLightGreen, text: 'Save Quote', textColor: ColorConstant.appBlack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _quoteController.dispose();
    super.dispose();
  }
}
