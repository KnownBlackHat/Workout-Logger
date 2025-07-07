import "package:flutter/foundation.dart";
import "package:mongo_dart/mongo_dart.dart";

class ExerciseProvider extends ChangeNotifier {
  List<String> _exercises = [];
  bool _isloading = false;
  String? _error;
  String mongourl =
      'mongodb+srv://test:test@cluster0.yvlq9mj.mongodb.net/workout_logger?retryWrites=true&w=majority&appName=Cluster0';

  List<String> get exercises => _exercises;
  bool get isLoading => _isloading;
  String? get error => _error;

  Future<void> fetchExercise(String muscleGroup) async {
    _isloading = true;
    _error = null;
    notifyListeners();

    try {
      final db = await Db.create(mongourl);
      await db.open();
      final collection = db.collection(muscleGroup);

      final exercise = await collection.find().toList();
      await db.close();
      _exercises = exercise.map((doc) => doc['name'] as String).toList();
    } catch (e) {
      _error = "Error fetching exercises: $e";
      print(_error);
    } finally {
      _isloading = false;
      notifyListeners();
    }
  }

  Future<void> addExcercise(String excerciseName, String muscleGroup) async {
    try {
      final db = await Db.create(mongourl);
      await db.open();
      final collection = db.collection(muscleGroup);

      await collection.insertOne({'name': excerciseName});
      await db.close();
      await fetchExercise(muscleGroup);
    } catch (e) {
      print("Error connecting to MongoDB: $e");
      rethrow;
    }
  }

  Future<void> addCurrent(
    String exerciseName,
    String split,
    int set,
    int reps,
  ) async {
    try {
      final db = await Db.create(mongourl);
      await db.open();
      final collection = db.collection(split);

      await collection.updateOne(
        {'name': exerciseName},
        {'name': exerciseName, set: reps},
      );
      await db.close();
      await fetchExercise(split);
    } catch (e) {
      print("Error connecting to MongoDB: $e");
      rethrow;
    }
  }

  Future<void> getPr(String exerciseName, String split) async {
    try {
      final db = await Db.create(mongourl);
      await db.open();
      final collection = db.collection(split);

      final exercise = await collection.find().toList();
      db.close();
    } catch (err) {}
  }

  Future<void> getCurrent(String exerciseName, String split) async {}
}
