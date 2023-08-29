class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Origin origin;
  final String image;

  Character.fromJson(Map jsonMap)
      : id = jsonMap['id'],
        name = valueOrDefaultValue(jsonMap['name']),
        status = valueOrDefaultValue(jsonMap['status']),
        species = valueOrDefaultValue(jsonMap['species']),
        type = valueOrDefaultValue(jsonMap['type']),
        gender = valueOrDefaultValue(jsonMap['gender']),
        origin = Origin.fromJson(jsonMap['origin']),
        image = valueOrDefaultValue(jsonMap['image']);
  // assert(origin != null),
  // assert(location != null);
}

class Origin {
  final String name;

  Origin.fromJson(Map jsonMap) : name = valueOrDefaultValue(jsonMap['name']);
}

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

class Episode {
  final int numCharacters;
  final int numLocations;
  final List<Character> characters; // Lista de personagens
  final List<Location> locations;

  Episode(
      this.numCharacters, this.numLocations, this.characters, this.locations);
}

String valueOrDefaultValue(String value) {
  return (value == null || value.isEmpty) ? "-" : value;
}
