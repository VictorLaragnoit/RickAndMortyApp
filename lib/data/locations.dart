class Location {
  final int id;
  final String name;
  final String type;
  final String dimension;

  Location.fromJson(Map jsonMap)
      : id = jsonMap['id'],
        name = valueOrDefaultValue(jsonMap['name']),
        type = valueOrDefaultValue(jsonMap['type']),
        dimension = valueOrDefaultValue(jsonMap['dimension']);
}

String valueOrDefaultValue(String value) {
  return (value == null || value.isEmpty) ? "-" : value;
}
