import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/models.dart';
import '../widgets/word_detail_widget.dart';

class SavedWordsScreen extends StatelessWidget {
  const SavedWordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<SavedWord>('savedWords');
    final words = box.values.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Saved Words')),
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          final word = words[index];
          return ListTile(
            title: Text(word.word),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Scaffold(
                  appBar: AppBar(title: Text(word.word)),
                  body: Padding(
                    padding: const EdgeInsets.all(16),
                    child: WordDetailWidget(
                      word: word,
                      onSave: () {}, // No saving needed here
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
