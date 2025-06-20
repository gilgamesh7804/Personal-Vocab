import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/models.dart';

class WordDetailWidget extends StatelessWidget {
  final SavedWord word;
  final VoidCallback onSave;

  const WordDetailWidget({required this.word, required this.onSave, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (word.audioUrl != null && word.audioUrl!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              children: [
                const Text('Pronunciation:'),
                IconButton(
                  icon: const Icon(Icons.volume_up),
                  onPressed: () async {
                    final player = AudioPlayer();
                    await player.play(UrlSource(word.audioUrl!));
                  },
                ),
              ],
            ),
          ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: word.meanings.map((meaning) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meaning.partOfSpeech,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...meaning.definitions.map((def) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• ${def.definition}'),
                            if (def.example != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  '"${def.example}"',
                                  style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            if ((def.synonyms ?? []).isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'Synonyms: ${(def.synonyms ?? []).join(', ')}',
                                  style: const TextStyle(color: Colors.green),
                                ),
                              ),
                          ],
                        ),
                      );
                    }),
                    const Divider(),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          child: ElevatedButton(onPressed: onSave, child: const Text('Save')),
        ),
      ],
    );
  }
}
