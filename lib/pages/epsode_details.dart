import 'package:flutter/material.dart';

class EpisodeDetailsPage extends StatelessWidget {
  final Map<String, dynamic> episode;

  EpisodeDetailsPage(this.episode);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fontSize = screenWidth * 0.02;

    List<Widget> characterWidgets =
        episode['characters'].map<Widget>((characterUrl) {
      return Column(
        children: [
          Image.network(
            characterUrl['image'],
            width: screenWidth * 0.4,
            height: screenHeight * 0.2,
          ),
          SizedBox(height: 8),
          Text(
            'nome: ${characterUrl['name']}',
            style: TextStyle(fontSize: fontSize),
          )
        ],
      );
    }).toList();

    List<Widget> locationWidgets = episode['locations'].map<Widget>((location) {
      return Column(
        children: [
          Text(
            'Nome do Local: ${location['name']}',
            style: TextStyle(fontSize: fontSize),
          ),
          Text(
            'Dimensão: ${location['dimension']}',
            style: TextStyle(fontSize: fontSize),
          ),
          SizedBox(height: 16),
        ],
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Detalhes do Episódio',
            style: TextStyle(fontSize: fontSize),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Nome do Episódio: ${episode['name']}',
              style: TextStyle(fontSize: fontSize),
            ),
            Text(
              'Data de Lançamento: ${episode['air_date']}',
              style: TextStyle(fontSize: fontSize),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text('Personagens Usados:',
                style:
                    TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)),
            Column(children: characterWidgets),
            SizedBox(height: screenHeight * 0.02),
            Text('Locais Usados:',
                style:
                    TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)),
            Column(children: locationWidgets),
          ],
        ),
      ),
    );
  }
}
