import 'package:flutter/material.dart';
import 'package:rickmorty/data/models.dart';
import 'package:rickmorty/services/api_service.dart';

class LocalsListPage extends StatefulWidget {
  @override
  _LocalsListPageState createState() => _LocalsListPageState();
}

class _LocalsListPageState extends State<LocalsListPage> {
  final ApiService _apiService = ApiService();
  List<Location>? _locations;

  @override
  void initState() {
    super.initState();
    _loadLocations();
  }

  Future<void> _loadLocations() async {
    final locations = await _apiService.getLocations();
    setState(() {
      _locations = locations;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double fontSize = screenWidth * 0.015;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Locais em Rick and Morty',
          style: TextStyle(fontSize: fontSize),
        )),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    double screenWidth = MediaQuery.of(context).size.width;

    double fontSize = screenWidth * 0.01;
    if (_locations == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        itemCount: _locations!.length,
        itemBuilder: (context, index) {
          final locations = _locations![index];
          return ListTile(
            title: Text(
              locations.name,
              style: TextStyle(fontSize: fontSize),
            ),
            trailing: Text(
              locations.dimension,
              style: TextStyle(fontSize: fontSize),
            ),
            subtitle: Text(
              locations.type,
              style: TextStyle(fontSize: fontSize),
            ),
          );
        },
      );
    }
  }
}
