import 'package:flutter/material.dart';

class VoirPlusScreen extends StatefulWidget {
  const VoirPlusScreen({super.key});

  @override
  State<VoirPlusScreen> createState() => _VoirPlusScreenState();
}

class _VoirPlusScreenState extends State<VoirPlusScreen> {

  final List<String> categories = const ["Jeux", "Tutos", "Yoga"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Voir plus'),
          bottom: TabBar(
            tabs: categories.map((c) => Tab(text: c)).toList(),
          ),
        ),
        body: TabBarView(
          children: [
            // TODO: liste complète des jeux
            Center(child: Text("Liste complète des jeux ici")),
            // TODO: liste des tutos
            Center(child: Text("Liste des tutoriels ici")),
            // TODO: vidéos yoga
            Center(child: Text("Vidéos yoga ici")),
          ],
        ),
      ),
    );
  }
}
