import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen ({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page d'accueil")),
      body: Stack(
        children: [
          // Arrière-plan : image + superposition douce
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
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
