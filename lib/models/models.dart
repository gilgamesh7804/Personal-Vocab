import 'package:hive/hive.dart';

part 'models.g.dart';

@HiveType(typeId: 0)
class SavedWord extends HiveObject {
  @HiveField(0)
  final String word;

  @HiveField(1)
  final List<Meaning> meanings;

  @HiveField(2)
  final String? audioUrl;

  SavedWord({required this.word, required this.meanings, this.audioUrl});
}

@HiveType(typeId: 1)
class Meaning {
  @HiveField(0)
  final String partOfSpeech;

  @HiveField(1)
  final List<Definition> definitions;

  Meaning({required this.partOfSpeech, required this.definitions});
}

@HiveType(typeId: 2)
class Definition {
  @HiveField(0)
  final String definition;

  @HiveField(1)
  final String? example;

  @HiveField(2)
  final List<String>? synonyms;

  Definition({required this.definition, this.example, this.synonyms});
}
