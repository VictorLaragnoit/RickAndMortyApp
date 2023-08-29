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
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Locais em Rick and Morty')),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_locations == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        itemCount: _locations!.length,
        itemBuilder: (context, index) {
          final locations = _locations![index];
          return ListTile(
            title: Text(locations.name),
            trailing: Text(locations.dimension),
            subtitle: Text(locations.type),
          );
        },
      );
    }
  }
}
