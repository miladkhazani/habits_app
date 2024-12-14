import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo and User Greeting
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: ClipOval(
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/default_pfp.png',
                            image: 'https://example.com/profile-pic.jpg',
                            fit: BoxFit.cover,
                            width: 60,
                            height: 60,
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/default_pfp.png',
                                fit: BoxFit.cover,
                                width: 60,
                                height: 60,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Hi, Zaire Saris 👋",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            "Let's make a change!",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              /*// Steps Card
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "5810 / 7000 Steps",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: 0.85,
                      color: Colors.white,
                      backgroundColor: Colors.white24,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              */

              // Health Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatCard(
                    "Avg. Heart Rate",
                    "68 bpm",
                    Icons.favorite,
                  ),
                  _buildStatCard(
                    "Sleep Quality Score",
                    "76",
                    Icons.nights_stay,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Habits in Progress
              _buildSectionTitle("Habits in Progress"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildHabitIcon("Sleep Routine", Icons.bed),
                  _buildHabitIcon("Run 2.5km", Icons.directions_run),
                  _buildHabitIcon("Healthy Meal", Icons.fastfood),
                  _buildHabitIcon("Read a Book", Icons.menu_book),
                ],
              ),
              const SizedBox(height: 20),

              // Group Activity
              _buildSectionTitle("Group Activity"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildGroupActivityCard("Jakob Torff", "Read a Book", 0.8),
                  _buildGroupActivityCard("Jakob Torff", "Didn't Smoke", 0.8),
                ],
              ),
              const SizedBox(height: 20),

              // Plan Activity and Leaderboard
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLargeCard("Create Your Plan Activity"),
                  _buildLargeCard("See The Leader Boards"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for small stat card
  static Widget _buildStatCard(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.lightBlue, size: 30),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Widget for habit icons
  static Widget _buildHabitIcon(String title, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
              'https://via.placeholder.com/150'), // Valid URL
          backgroundColor: Colors.grey, // Fallback background
        ),

        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }

  // Widget for group activity cards
  static Widget _buildGroupActivityCard(
      String name, String habit, double progress) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 20,
              child: Text(name[0], style: const TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 5),
            Text(
              name,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 5),
            Text(
              habit,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 5),
            LinearProgressIndicator(
              value: progress,
              color: Colors.lightBlue,
              backgroundColor: Colors.grey[800],
            ),
          ],
        ),
      ),
    );
  }

  // Widget for large cards
  static Widget _buildLargeCard(String title) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.lightBlue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: const TextStyle(color: Colors.lightBlue, fontSize: 16),
        ),
      ),
    );
  }

  // Widget for section titles
  static Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
