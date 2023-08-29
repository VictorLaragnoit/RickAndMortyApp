class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;

  Character.fromJson(Map jsonMap)
      : id = jsonMap['id'],
        name = valueOrDefaultValue(jsonMap['name']),
        status = valueOrDefaultValue(jsonMap['status']),
        species = valueOrDefaultValue(jsonMap['species']),
        type = valueOrDefaultValue(jsonMap['type']),
        gender = valueOrDefaultValue(jsonMap['gender']),
        image = valueOrDefaultValue(jsonMap['image']);
  // assert(origin != null),
  // assert(location != null);
}

String valueOrDefaultValue(String value) {
  return (value == null || value.isEmpty) ? "-" : value;
}
