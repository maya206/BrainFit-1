import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Arrière-plan avec image et couleur bleue superposée
          Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
              color: Colors.blue.shade300.withOpacity(0.5),
            ),
          ),
          // Contenu principal
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Titre Brainfit
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Brain',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                          TextSpan(
                            text: 'Fit',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Bienvenue',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Bouton Se connecter
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        _showRoleDialog(context, 'Connexion');
                      },
                      icon: const Icon(Icons.login),
                      label: const Text('Se connecter'),
                    ),
                    const SizedBox(height: 20),

                    // Bouton S'inscrire
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        _showRoleDialog(context, 'Inscription');
                      },
                      icon: const Icon(Icons.person_add),
                      label: const Text("S'inscrire"),
                    ),

                    const SizedBox(height: 60),

                    // Slogan
                    const Text(
                      'Le pouvoir de changer',
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Boîte de dialogue pour choisir le rôle
  void _showRoleDialog(BuildContext context, String action) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$action en tant que...'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Patient'),
              onTap: () {
                Navigator.pop(context);
                // Naviguer vers l’écran patient
              },
            ),
            ListTile(
              leading: const Icon(Icons.medical_services),
              title: const Text('Médecin'),
              onTap: () {
                Navigator.pop(context);
                // Naviguer vers l’écran médecin
              },
            ),
          ],
        ),
      ),
    );
  }
}



    