import 'package:brainfit/screens/menuscreen.dart';
import 'package:flutter/material.dart';

class Bottomnavigationbar extends StatefulWidget {
  const Bottomnavigationbar({super.key});

  @override
  State<Bottomnavigationbar> createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<Bottomnavigationbar> {
  int _currentIndex = 0;

  final String userName = "Maya"; // À remplacer par gestion utilisateur réelle
  final String avatarPath = "assets/images/avatar.jpg";

  // Liste des écrans que tu veux afficher
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      MenuScreen(
        userName: userName,
        avatarPath: avatarPath,
        onSeeMorePressed: () {
          // TODO: Ajouter navigation vers VoirPlusScreen
          print("Voir plus cliqué");
        },
      ),
      const Placeholder(), // écran recherche - à créer plus tard
      const Placeholder(), // écran rappels - à créer plus tard
      const Placeholder(), // écran profil - à créer plus tard
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Recherche"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Rappels"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}
