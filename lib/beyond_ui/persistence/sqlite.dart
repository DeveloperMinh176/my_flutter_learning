import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

void main() async {
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
  }
  WidgetsFlutterBinding.ensureInitialized();
  databaseFactory = databaseFactoryFfi;
  final database = openDatabase(
    join(await getDatabasesPath(), 'dogie_database'),
    onCreate: (db, version) => db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)'),
    version: 1,
  );
  Future<void> insertDog(Dog dog) async {
    final db = await database;
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Dog>> dogs() async {
    final db = await database;
    final List<Map<String, Object?>> dogMaps = await db.query('dogs');
    return [
      for (final {
            'id': id as int,
            'name': name as String,
            'age': age as int,
          } in dogMaps)
        Dog(id: id, name: name, age: age)
    ];
  }

  Future<void> updateDog(Dog dog) async {
    final db = await database;
    await db.update(
      'dogs',
      dog.toMap(),
      where: 'id = ?',
      whereArgs: [dog.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteDog(Dog dog) async {
    final db = await database;
    await db.delete(
      'dogs',
      where: 'id = ?',
      whereArgs: [dog.id],
    );
  }

  var fido = Dog(id: 1, name: 'Ki', age: 35);
  var fido1 = Dog(id: 2, name: 'Ki', age: 35);
  var fido2 = Dog(id: 3, name: 'Ki', age: 35);
  await insertDog(fido);
  await insertDog(fido1);
  await insertDog(fido2);
  print(await dogs());
  fido = Dog(id: fido.id, name: fido.name, age: fido.age + 7);
  await updateDog(fido);
  print(await dogs());
  await deleteDog(fido1);
  print(await dogs());
}

class Dog {
  final int id;
  final String name;
  final int age;

  Dog({required this.id, required this.name, required this.age});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'age': this.age,
    };
  }

  @override
  String toString() {
    return '{id: $id, name: $name, age: $age,}';
  }
}
