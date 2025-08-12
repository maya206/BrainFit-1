import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeNameScreen extends StatefulWidget {
  const WelcomeNameScreen({super.key});

  @override
  State<WelcomeNameScreen> createState() => _WelcomeNameScreenState();
}

class _WelcomeNameScreenState extends State<WelcomeNameScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _saveNameAndGoToMenu() async {
    final String name = _nameController.text.trim();

    if (name.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userName', name);

      Navigator.pushNamed(context, '/menu');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez entrer votre prénom.')),
      );
    }
  }

  void _goBackToHome() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/home', // Nom de la route de ton HomeScreen
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Bienvenue",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: _goBackToHome,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Comment souhaitez-vous qu'on vous appelle ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Entrez votre prénom',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _saveNameAndGoToMenu,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Continuer',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
