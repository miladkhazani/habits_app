import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("FAQ", style: TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Text(
          "FAQ Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
