import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class HabitsProgressScreen extends StatelessWidget {
  const HabitsProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Habits in Progress",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle, color: Colors.white),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Toggle Between In Progress and Past
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildToggleButton(context, "In Progress", true),
                _buildToggleButton(context, "Past", false),
              ],
            ),
            const SizedBox(height: 20),

            // List of Habit Cards
            _buildHabitCard(
              "November 11, 2024",
              "4 Person Habit",
              "\$100 Payout",
              "\$25 Stake",
              "Run Club Competition",
              [
                _buildMember("milad.khazani", "Miles Run", 3, 5),
                _buildMember("koosha.yar", "Miles Run", 2, 5),
                _buildMember("milad.a.tajalli", "Miles Run", 1, 5),
                _buildMember("choups", "Miles Run", 0.5, 5),
              ],
            ),
            const SizedBox(height: 20),
            _buildHabitCard(
              "November 13, 2024",
              "4 Person Habit",
              "\$100 Payout",
              "\$25 Stake",
              "Run Club Competition",
              [
                _buildMember("milad.khazani", "Miles Run", 4, 5),
                _buildMember("koosha.yar", "Miles Run", 3, 5),
                _buildMember("milad.a.tajalli", "Miles Run", 2, 5),
                _buildMember("choups", "Miles Run", 1, 5),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Toggle Button Widget
  Widget _buildToggleButton(BuildContext context, String text, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Handle toggle logic
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: isSelected ? Colors.lightBlue : Colors.grey[800],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Habit Card Widget
  Widget _buildHabitCard(
    String date,
    String habitType,
    String payout,
    String stake,
    String competitionTitle,
    List<Widget> members,
  ) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(date, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 10),
          Text(
            "$habitType | $payout",
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(
            "Stake: $stake",
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 10),
          Text(
            competitionTitle,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 20),
          Row(children: members),
        ],
      ),
    );
  }

  // Member Widget
  Widget _buildMember(
      String username, String goalTitle, double progress, double total) {
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 20,
            child: Text(
              username[0].toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "@$username",
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          const SizedBox(height: 5),
          Text(
            goalTitle,
            style: const TextStyle(color: Colors.grey, fontSize: 10),
          ),
          const SizedBox(height: 5),
          Stack(
            children: [
              Container(
                height: 10,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                widthFactor: progress / total,
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            progress >= total
                ? "You're in the lead!"
                : "${progress.toStringAsFixed(1)} / ${total.toStringAsFixed(1)}",
            style: const TextStyle(color: Colors.grey, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
