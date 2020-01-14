import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:todoey_flutter/models/task.dart';

class TaskDatabase {
  Future<Database> database;

  TaskDatabase() {
    this.database = setupDatabase();
  }

  Future<Database> setupDatabase() async {
    final Future<Database> database = openDatabase(
      // Set the path to the database.
      join(await getDatabasesPath(), 'tasks_database.db'),
      // When the database is first created, create a table to store tasks.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          "CREATE TABLE tasks(id INTEGER PRIMARY KEY, name TEXT, isDone INTEGER, timestamp TEXT)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );

    return database;
  }

  Future<void> insertTask(Task task) async {
    // Get a reference to the database.
    final Database db = await database;

    // Insert the Task into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same task is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateTask(Task task) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Task.
    await db.update(
      'tasks',
      task.toMap(),
      // Ensure that the Task has a matching id.
      where: "id = ?",
      // Pass the Task's id as a whereArg to prevent SQL injection.
      whereArgs: [task.id],
    );
  }

  Future<void> deleteTask(Task task) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Task from the Database.
    await db.delete(
      'tasks',
      // Use a `where` clause to delete a specific task.
      where: "id = ?",
      // Pass the Task's id as a whereArg to prevent SQL injection.
      whereArgs: [task.id],
    );
  }

  Future<List<Task>> tasksList() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('tasks');

    // Convert the List<Map<String, dynamic> into a List<Task>.
    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]['id'],
        name: maps[i]['name'],
        isDone: maps[i]['isDone'] == 0 ? false : true,
        timestamp: maps[i]['timestamp'],
      );
    });
  }
}
