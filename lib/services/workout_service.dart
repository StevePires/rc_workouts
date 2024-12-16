import 'package:realm/realm.dart';
import '../models/workout_type.dart';
import '../models/workout_history.dart';

class WorkoutService {
  final Realm realm;

  WorkoutService()
      : realm = Realm(Configuration.local([
          WorkoutType.schema,
          WorkoutHistory.schema,
        ]));

  void addWorkoutType(String label) {
    final workoutType = WorkoutType(ObjectId(), label);
    realm.write(() {
      realm.add(workoutType);
    });
  }

  void addWorkoutHistory(WorkoutType type, int duration, int reps, int sets,
      bool personalRecord, DateTime date) {
    final workoutHistory = WorkoutHistory(
        ObjectId(), type, duration, reps, sets, personalRecord, date);
    realm.write(() {
      realm.add(workoutHistory);
    });
  }

  List<WorkoutHistory> getAllWorkoutHistories() {
    return realm.all<WorkoutHistory>().toList();
  }

  void close() {
    realm.close();
  }
}
