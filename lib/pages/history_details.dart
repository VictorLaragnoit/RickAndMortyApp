import 'package:flutter/material.dart';
import 'package:rickmorty/pages/epsode_details.dart';

class EpisodeHistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> episodeHistory;

  const EpisodeHistoryPage(this.episodeHistory, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Episódios Gerados'),
      ),
      body: ListView.builder(
        itemCount: episodeHistory.length,
        itemBuilder: (context, index) {
          final episode = episodeHistory[index];
          return ListTile(
            title: Text('Nome do Episódio: ${episode['name']}'),
            subtitle: Text('Data de Lançamento: ${episode['air_date']}'),
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
