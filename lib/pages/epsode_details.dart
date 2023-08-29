import 'package:flutter/material.dart';

class EpisodeDetailsPage extends StatelessWidget {
  final Map<String, dynamic> episode;

  EpisodeDetailsPage(this.episode);

  @override
  Widget build(BuildContext context) {
    List<Widget> characterWidgets =
        episode['characters'].map<Widget>((characterUrl) {
      return Column(
        children: [
          Image.network(characterUrl['image']),
          const SizedBox(height: 8),
          Text('nome: ${characterUrl['name']}')
        ],
      );
    }).toList();

    List<Widget> locationWidgets = episode['locations'].map<Widget>((location) {
      return Column(
        children: [
          Text('Nome do Local: ${location['name']}'),
          Text('Dimensão: ${location['dimension']}'),
          const SizedBox(height: 16),
        ],
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Episódio'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Nome do Episódio: ${episode['name']}'),
            Text('Data de Lançamento: ${episode['air_date']}'),
            const SizedBox(height: 32),
            const Text('Personagens Usados:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Column(children: characterWidgets),
            const SizedBox(height: 32),
            const Text('Locais Usados:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Column(children: locationWidgets),
          ],
        ),
      ),
    );
  }
}
