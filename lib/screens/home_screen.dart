import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/models.dart';
import '../services/dictionary_service.dart';
import '../screens/saved_words_screen.dart';
import '../widgets/word_detail_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  SavedWord? result;

  Future<void> search() async {
    final word = _controller.text.trim();
    if (word.isEmpty) return;
    final data = await fetchWordData(word);
    setState(() => result = data);
  }

  void saveWord(SavedWord word) {
    final box = Hive.box<SavedWord>('savedWords');
    box.put(word.word, word);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Lookup'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SavedWordsScreen()),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Enter a word'),
            ),
            ElevatedButton(onPressed: search, child: const Text('Search')),
            const SizedBox(height: 20),
            if (result != null)
              Expanded(
                child: WordDetailWidget(
                  word: result!,
                  onSave: () => saveWord(result!),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
