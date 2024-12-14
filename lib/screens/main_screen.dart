import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'habits_progress_screen.dart';
import 'leaderboards_screen.dart';
import 'faq_screen.dart'; // Add this import


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(), // Replace with your actual HomeScreen widget
    const HabitsProgressScreen(), // Replace with Habits Progress Screen
    const LeaderboardsScreen(), // Replace with Leaderboards Screen
    const FAQScreen(), // Placeholder for FAQ Screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _screens[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20.0), // Adjust the radius as needed
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.deepPurple[900],
          selectedItemColor: Colors.lightBlue,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "My Habits"),
            BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: "Leaderboards"),
            BottomNavigationBarItem(icon: Icon(Icons.help), label: "FAQ"),
          ],
        ),
      ),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                // Handle the creation of a new habit group
              },
              backgroundColor: Colors.deepPurple[900],
              child: const Icon(Icons.add, color: Colors.black),
              shape: const CircleBorder(),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
