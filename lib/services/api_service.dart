import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:rickmorty/data/models.dart';

class ApiService {
  final String _baseUrl = 'rickandmortyapi.com';
  final String _charactersUrl = '/api/character';
  final String _localsUrl = '/api/location';
  final String _charactersJsonKey = 'results';
  final String _localsJsonKey = 'results';

  Future<List<Character>?> getCharacters() async {
    final uri = Uri.https(_baseUrl, _charactersUrl);
    final response = await _getJson(uri);

    if (response?[_charactersJsonKey] == null) {
      print('Api.getCharacters(): Error while retrieving characters');
      return null;
    }

    return _convert(response?[_charactersJsonKey]);
  }

  Future<List<Location>?> getLocations() async {
    final uri = Uri.https(_baseUrl, _localsUrl);
    final response = await _getJson(uri);

    if (response?[_localsJsonKey] == null) {
      print('Api.getLocations(): Error while retrieving locations');
      return null;
    }

    return _convertLocation(response?[_localsJsonKey]);
  }

  Future<Map<String, dynamic>?> _getJson(Uri uri) async {
    try {
      final response = await http.get(uri);

      if (response.statusCode != HttpStatus.ok) {
        print('Api._getJson($uri) status code is ${response.statusCode}');
        return null;
      }

      final responseBody = response.body;
      return json.decode(responseBody);
    } catch (e) {
      print('Api._getJson($uri) exception thrown: $e');
      return null;
    }
  }

  List<Character> _convert(List charactersJson) {
    List<Character> characters = <Character>[];

    for (var character in charactersJson) {
      characters.add(Character.fromJson(character));
    }

    return characters;
  }

  List<Location> _convertLocation(List locationsJson) {
    List<Location> locations = <Location>[];

    for (var location in locationsJson) {
      locations.add(Location.fromJson(location));
    }

    return locations;
  }
}
