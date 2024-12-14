import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class LeaderboardsScreen extends StatelessWidget {
  const LeaderboardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.black,
      body: const Center(
        child: Text(
          "Leaderboards Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
