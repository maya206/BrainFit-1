import 'package:flutter/material.dart';

class VoirPlusScreen extends StatelessWidget {
  const VoirPlusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Voir Plus"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Section Jeux
            const Text(
              "Jeux",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCard("Puzzle", "assets/icons/puzzle.png"),
                  _buildCard("Mémoire", "assets/icons/memoire.png"),
                  _buildCard("Quiz", "assets/icons/quiz.png"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Section Tutoriels
            const Text(
              "Tutoriels",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCard("Comment jouer", "assets/images/tuto1.jpg"),
                  _buildCard("Utiliser Brainfit", "assets/images/tuto2.jpg"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Section Yoga
            const Text(
              "Yoga",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCard("Relaxation", "assets/images/yoga1.jpg"),
                  _buildCard("Respiration", "assets/images/yoga2.jpg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildCard(String title, String imagePath) {
    return Container(
      width: 130,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
