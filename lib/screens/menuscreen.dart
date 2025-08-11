import 'package:flutter/material.dart';
import 'dart:math';

class MenuScreen extends StatelessWidget{
  final String userName;
  final String avatarPath;
  final VoidCallback onSeeMorePressed;

  MenuScreen({
    Key? key,
    required this.userName,
    required this.avatarPath,
    required this.onSeeMorePressed,
  }): super(key: key);

  // Listes phrases par moment de la journée
  final List<String> morningPhrases = [
    "Commence ta journée avec un sourire ☀️",
    "Chaque jour est une nouvelle chance 🌅",
    "Tu es capable d'accomplir de grandes choses aujourd'hui 💪",
  ];

  final List<String> noonPhrases = [
    "Continue comme ça, tu es sur la bonne voie 🕛",
    "Fais une petite pause, tu le mérites 🍽️",
    "Ta mémoire est comme un muscle, elle devient plus forte 👟",
  ];

  final List<String> eveningPhrases = [
    "Tu as fait de ton mieux aujourd'hui 🌙",
    "Repose-toi, demain sera encore plus beau 🌌",
    "La paix vient du calme intérieur 🧘",
  ];

  String getCurrentMotivationPhrase() {
    final hour = DateTime.now().hour;
    final rand = Random();

    if (hour >= 5 && hour < 12) {
      return morningPhrases[rand.nextInt(morningPhrases.length)];
    } else if (hour >= 12 && hour < 17) {
      return noonPhrases[rand.nextInt(noonPhrases.length)];
    } else if (hour >= 17 && hour < 23) {
      return eveningPhrases[rand.nextInt(eveningPhrases.length)];
    } else {
      return "Bonne nuit, tu peux être fier de toi 😴";
    }
  }

  final List<GameItem> visibleGames = const [
    GameItem("Puzzle", "assets/icons/puzzle.png"),
    GameItem("Memory", "assets/icons/memory.png"),
  ];

  @override
  Widget build(BuildContext context) {
    final String currentMotivation = getCurrentMotivationPhrase();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Salut + avatar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Salut $userName",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenDyslexic',
                    ),
                  ),
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(avatarPath),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Carte motivation
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/motivation.png',
                      width: 60,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        currentMotivation,
                        style: const TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'OpenDyslexic',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Titre jeux + Voir plus cliquable
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Livre de jeux cognitifs",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenDyslexic',
                    ),
                  ),
                  GestureDetector(
                    onTap: onSeeMorePressed,
                    child: const Text(
                      "Voir plus",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        fontFamily: 'OpenDyslexic',
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Liste horizontale limitée des jeux
              SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: visibleGames.length,
                  itemBuilder: (context, index) {
                    final game = visibleGames[index];
                    return buildGameCard(context, game);
                  },
                ),
              ),

              const SizedBox(height: 24),

              // Rappel médicament (statique)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Image.asset('assets/icons/medic.png', width: 60),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        "N'oublie pas de prendre ton médicament à 10h 🕙",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'OpenDyslexic',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGameCard(BuildContext context, GameItem game) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Ouverture du jeu : ${game.title}")),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 4,
              offset: const Offset(2, 2),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(game.iconPath, width: 36),
            const SizedBox(height: 8),
            Text(
              game.title,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'OpenDyslexic',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class GameItem {
  final String title;
  final String iconPath;

  const GameItem(this.title, this.iconPath);
}
