import 'package:realm/realm.dart';

part 'workout_history.realm.dart'; // Required for Realm model generation

@RealmModel()
class _WorkoutHistory {
  @PrimaryKey()
  late ObjectId id;

  late ObjectId workoutTypeId;

  late int duration;
  late int reps;
  late int sets;
  late bool personalRecord;
  late DateTime date;
}
