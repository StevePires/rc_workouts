import 'package:realm/realm.dart';

part 'workout_type.realm.dart'; // Required for Realm model generation

@RealmModel()
class _WorkoutType {
  @PrimaryKey()
  late ObjectId id;
  late String label;
}
