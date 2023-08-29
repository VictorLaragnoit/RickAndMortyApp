import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rickmorty/data/models.dart';
import 'package:rickmorty/pages/characters_list.dart';
import 'package:rickmorty/pages/epsode_details.dart';
import 'package:rickmorty/pages/history_details.dart';
import 'package:rickmorty/pages/locals_list.dart';
import 'package:rickmorty/services/api_service.dart';
import 'package:rickmorty/shared/custom_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final ApiService apiService = ApiService();
  // all general vars to use the api results
  List<Character> characters = [];
  List<Location> locations = [];
  Map<String, dynamic> episode = {};
  List<Location>? _locations_list;
  List<Character>? _characters_list;
  int numLocationChoose = 1;
  int numCharacterChoose = 1;
  List<Map<String, dynamic>> episodeHistory = [];

  @override
  void initState() {
    super.initState();
    _loadEpisodeHistory();
    _loadCharacters();
    _loadLocations();
  }

  // function to call api and get locations
  Future<void> _loadLocations() async {
    final locationsData = await apiService.getLocations();
    setState(() {
      _locations_list = locationsData;
    });
  }

  // fuction to call api and get characters
  Future<void> _loadCharacters() async {
    final charactersData = await apiService.getCharacters();
    setState(() {
      _characters_list = charactersData;
    });
  }

  // function to load a generate epsode using persistent storage
  void _loadEpisodeHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final historyJson = prefs.getString('episode_history');
    if (historyJson != null) {
      final List<dynamic> historyData = json.decode(historyJson);
      setState(() {
        episodeHistory = historyData.cast<Map<String, dynamic>>();
      });
    }
  }

  // function to save a epsode after create it. also using persistent storage
  void _saveEpisodeHistory(Map<String, dynamic> episode) async {
    episodeHistory.insert(0, episode);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('episode_history', json.encode(episodeHistory));
  }

  void _generateEpisode(int characterCount, int locationCount) async {
    characters = (await apiService.getCharacters())!;
    locations = (await apiService.getLocations())!;

    // Randomly select characters and locations
    List<Character> selectedCharacters = characters.toList()..shuffle();
    selectedCharacters = selectedCharacters.sublist(0, characterCount);

    List<Location> selectedLocations = locations.toList()..shuffle();
    selectedLocations = selectedLocations.sublist(0, locationCount);

    // Convert selected character URLs to strings
    List<Map<String, dynamic>> characterUrls = selectedCharacters
        .map((character) => {
              'name': character.name,
              'image': character.image,
            })
        .toList();

    // Convert selected locations to a list of maps
    List<Map<String, dynamic>> locationDataList = selectedLocations
        .map((location) => {
              'name': location.name,
              'dimension': location.dimension,
            })
        .toList();

    // Create the episode object
    episode = {
      'id': episodeHistory.length + 1,
      'name': 'Episode ${episodeHistory.length + 1}',
      'air_date': DateTime.now().toString(),
      'episode': 'S${episodeHistory.length + 1}',
      'characters': characterUrls,
      'locations': locationDataList,
    };

    _saveEpisodeHistory(episode);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EpisodeDetailsPage(episode)),
    );

    // Display the episode or perform other actions based on UI
  }

  @override
  Widget build(BuildContext context) {
    var drawerHeader = UserAccountsDrawerHeader(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 46, 113, 141),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage(_characters_list![0].image),
      ),
      accountEmail: null,
      accountName: Text(
        _characters_list![0].name,
        style: const TextStyle(fontSize: 20),
      ),
    );
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        CustomListTitle(
          Icons.history_rounded,
          'Historico de episodios gerados',
          () {
            print(episodeHistory);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    EpisodeHistoryPage(episodeHistory)));
          },
        ),
        CustomListTitle(
          Icons.person,
          'Personagens',
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CharacterListPage()),
          ),
        ),
        CustomListTitle(
          Icons.place,
          'Locais',
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LocalsListPage()),
          ),
        ),
      ],
    );
    final double media = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: Container(
        width: media * 0.8,
        child: Drawer(
          child: drawerItems,
        ),
      ),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Rick e Morty App',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: media * 0.05),
              child: Image.network(
                _characters_list![1].image,
                width: media * 0.5,
                height: media * 0.5,
              ),
            ),
            SizedBox(height: media * 0.02),
            Text(
              'Criar Episodio',
              style: TextStyle(fontSize: media * 0.07),
            ),
            SizedBox(height: media * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Numero de Personagens:  ',
                  style: TextStyle(fontSize: media * 0.04),
                ),
                SizedBox(height: media * 0.09),
                DropdownButton<int>(
                  value: numCharacterChoose,
                  onChanged: (newValue) {
                    setState(() {
                      numCharacterChoose = newValue!;
                    });
                  },
                  items: List.generate(
                    _characters_list?.length ?? 0,
                    (index) {
                      return DropdownMenuItem<int>(
                        value: index,
                        child: Text('$index'),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: media * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Numero de Locais:  ',
                  style: TextStyle(fontSize: media * 0.04),
                ),
                SizedBox(height: media * 0.09),
                DropdownButton<int>(
                  value: numLocationChoose,
                  onChanged: (newValue) {
                    setState(() {
                      numLocationChoose = newValue!;
                    });
                  },
                  items: List.generate(
                    _locations_list?.length ?? 0,
                    (index) {
                      return DropdownMenuItem<int>(
                        value: index,
                        child: Text('${index}'),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: media * 0.02),
            ElevatedButton(
              onPressed: () async {
                _generateEpisode(numCharacterChoose, numLocationChoose);
              },
              child: const Text('Criar Episódio'),
            ),
          ],
        ),
      ),
    );
  }
}
