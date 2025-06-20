import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:personal_vocabulary_builder/models/models.dart';

Future<SavedWord?> fetchWordData(String word) async {
  final url =
      'https://api.dictionaryapi.dev/api/v2/entries/en/${word.toLowerCase()}';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode != 200) {
    print('Dictionary API error: ${response.statusCode}');
    return null;
  }

  final data = jsonDecode(response.body);

  if (data == null || data.isEmpty) return null;

  List<Meaning> meanings = [];

  for (var meaning in data[0]['meanings']) {
    String partOfSpeech = meaning['partOfSpeech'];
    List<Definition> definitions = [];

    for (var def in meaning['definitions']) {
      final definition = def['definition'] ?? 'No definition';
      final example = def['example'];
      final synonyms = def['synonyms'] != null
          ? List<String>.from(def['synonyms'])
          : <String>[];

      definitions.add(
        Definition(
          definition: definition,
          example: example,
          synonyms: synonyms,
        ),
      );
    }

    meanings.add(Meaning(partOfSpeech: partOfSpeech, definitions: definitions));
  }

  return SavedWord(word: word, meanings: meanings);
}
