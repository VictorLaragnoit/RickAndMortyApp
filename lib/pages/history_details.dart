import 'package:flutter/material.dart';
import 'package:rickmorty/pages/epsode_details.dart';

class EpisodeHistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> episodeHistory;

  const EpisodeHistoryPage(this.episodeHistory, {super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // Calculate responsive values
    double imageWidth = screenWidth * 0.4;
    double imageHeight = screenHeight * 0.4;
    double fontSize = screenWidth * 0.04;
    double dropdownFontSize = screenWidth * 0.02;

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Historico de Episódios Gerados',
          style: TextStyle(fontSize: fontSize * 0.5),
        )),
      ),
      body: ListView.builder(
        itemCount: episodeHistory.length,
        itemBuilder: (context, index) {
          final episode = episodeHistory[index];
          return ListTile(
            title: Text(
              'Nome do Episódio: ${episode['name']}',
              style: TextStyle(fontSize: dropdownFontSize),
            ),
            subtitle: Text(
              'Data de Lançamento: ${episode['air_date']}',
              style: TextStyle(fontSize: dropdownFontSize),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EpisodeDetailsPage(episode),
              ));
            },
          );
        },
      ),
    );
  }
}
