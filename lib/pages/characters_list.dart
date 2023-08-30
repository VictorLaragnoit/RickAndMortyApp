import 'package:flutter/material.dart';
import 'package:rickmorty/data/models.dart';
import 'package:rickmorty/services/api_service.dart';

class CharacterListPage extends StatefulWidget {
  @override
  _CharacterListPageState createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  final ApiService _apiService = ApiService();
  List<Character>? _characters;

  @override
  void initState() {
    super.initState();
    _loadCharacters();
  }

  Future<void> _loadCharacters() async {
    final characters = await _apiService.getCharacters();
    setState(() {
      _characters = characters;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Calculate responsive values
    double fontSize = screenWidth * 0.015;

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Personagens em Rick and Morty',
          style: TextStyle(fontSize: fontSize),
        )),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    double screenWidth = MediaQuery.of(context).size.width;

    double fontSize = screenWidth * 0.02;

    if (_characters == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        itemCount: _characters!.length,
        itemBuilder: (context, index) {
          final character = _characters![index];
          return ListTile(
            leading: Image.network(
              character.image,
            ),
            title: Text(
              character.name,
              style: TextStyle(fontSize: fontSize),
            ),
            subtitle: Text(
              character.species,
              style: TextStyle(fontSize: fontSize),
            ),
          );
        },
      );
    }
  }
}
