// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedWordAdapter extends TypeAdapter<SavedWord> {
  @override
  final int typeId = 0;

  @override
  SavedWord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavedWord(
      word: fields[0] as String,
      meanings: (fields[1] as List).cast<Meaning>(),
    );
  }

  @override
  void write(BinaryWriter writer, SavedWord obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.word)
      ..writeByte(1)
      ..write(obj.meanings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedWordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MeaningAdapter extends TypeAdapter<Meaning> {
  @override
  final int typeId = 1;

  @override
  Meaning read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meaning(
      partOfSpeech: fields[0] as String,
      definitions: (fields[1] as List).cast<Definition>(),
    );
  }

  @override
  void write(BinaryWriter writer, Meaning obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.partOfSpeech)
      ..writeByte(1)
      ..write(obj.definitions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeaningAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DefinitionAdapter extends TypeAdapter<Definition> {
  @override
  final int typeId = 2;

  @override
  Definition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Definition(
      definition: fields[0] as String,
      example: fields[1] as String?,
      synonyms: (fields[2] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Definition obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.definition)
      ..writeByte(1)
      ..write(obj.example)
      ..writeByte(2)
      ..write(obj.synonyms);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DefinitionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
