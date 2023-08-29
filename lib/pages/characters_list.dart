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
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Rick and Morty Characters')),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_characters == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        itemCount: _characters!.length,
        itemBuilder: (context, index) {
          final character = _characters![index];
          return ListTile(
            leading: Image.network(character.image),
            title: Text(character.name),
            subtitle: Text(character.species),
          );
        },
      );
    }
  }
}
