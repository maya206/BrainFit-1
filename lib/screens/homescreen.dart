import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

class HomeScreen extends StatefulWidget {
  const HomeScreen ({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkIfNameExists();
  }

  Future<void> _checkIfNameExists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? name = prefs.getString('userName');

    if (name != null && name.isNotEmpty) {
      // Si prénom trouvé, naviguer directement vers MenuScreen
      Navigator.pushReplacementNamed(context, '/menu');
    } else {
      // Sinon, rester sur HomeScreen et afficher la page normalement
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      // Affiche un loader pendant la vérification
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Page d'accueil")),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Arrière-plan : image + superposition douce
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX:10,sigmaY:10),
            child: Container(
              color: Colors.black.withOpacity(0.15), // superposition légère comme de l'eau
            ),
            ),

          // Contenu centré
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontFamily: 'OpenDyslexic',
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: 'Brain',
                          style: TextStyle(color: Colors.orange),
                        ),
                        TextSpan(
                          text: 'Fit',
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Bienvenue',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'OpenDyslexic',
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Bouton Démarrer
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/welcomename');
                    },
                    child: const Text(
                      'Démarrer',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blueAccent,
                        fontFamily: 'OpenDyslexic',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Le pouvoir de changer',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'OpenDyslexic',
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
