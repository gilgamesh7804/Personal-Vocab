// hive_boxes.dart
import 'package:hive/hive.dart';
import 'package:personal_vocabulary_builder/models/models.dart';

class HiveBoxes {
  static Box<SavedWord> get savedWordsBox => Hive.box<SavedWord>('savedWords');
}
