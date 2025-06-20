import 'package:hive/hive.dart';
part 'models.g.dart';

@HiveType(typeId: 0)
class SavedWord extends HiveObject {
  @HiveField(0)
  String word;

  @HiveField(1)
  List<Meaning> meanings;

  SavedWord({required this.word, required this.meanings});
}

@HiveType(typeId: 1)
class Meaning extends HiveObject {
  @HiveField(0)
  String partOfSpeech;

  @HiveField(1)
  List<Definition> definitions;

  Meaning({required this.partOfSpeech, required this.definitions});
}

@HiveType(typeId: 2)
class Definition extends HiveObject {
  @HiveField(0)
  String definition;

  @HiveField(1)
  String? example;

  @HiveField(2)
  List<String>? synonyms;

  Definition({required this.definition, this.example, this.synonyms});
}
