// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_history.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class WorkoutHistory extends _WorkoutHistory
    with RealmEntity, RealmObjectBase, RealmObject {
  WorkoutHistory(
    ObjectId id,
    ObjectId workoutTypeId,
    int duration,
    int reps,
    int sets,
    bool personalRecord,
    DateTime date,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'workoutTypeId', workoutTypeId);
    RealmObjectBase.set(this, 'duration', duration);
    RealmObjectBase.set(this, 'reps', reps);
    RealmObjectBase.set(this, 'sets', sets);
    RealmObjectBase.set(this, 'personalRecord', personalRecord);
    RealmObjectBase.set(this, 'date', date);
  }

  WorkoutHistory._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  ObjectId get workoutTypeId =>
      RealmObjectBase.get<ObjectId>(this, 'workoutTypeId') as ObjectId;
  @override
  set workoutTypeId(ObjectId value) =>
      RealmObjectBase.set(this, 'workoutTypeId', value);

  @override
  int get duration => RealmObjectBase.get<int>(this, 'duration') as int;
  @override
  set duration(int value) => RealmObjectBase.set(this, 'duration', value);

  @override
  int get reps => RealmObjectBase.get<int>(this, 'reps') as int;
  @override
  set reps(int value) => RealmObjectBase.set(this, 'reps', value);

  @override
  int get sets => RealmObjectBase.get<int>(this, 'sets') as int;
  @override
  set sets(int value) => RealmObjectBase.set(this, 'sets', value);

  @override
  bool get personalRecord =>
      RealmObjectBase.get<bool>(this, 'personalRecord') as bool;
  @override
  set personalRecord(bool value) =>
      RealmObjectBase.set(this, 'personalRecord', value);

  @override
  DateTime get date => RealmObjectBase.get<DateTime>(this, 'date') as DateTime;
  @override
  set date(DateTime value) => RealmObjectBase.set(this, 'date', value);

  @override
  Stream<RealmObjectChanges<WorkoutHistory>> get changes =>
      RealmObjectBase.getChanges<WorkoutHistory>(this);

  @override
  WorkoutHistory freeze() => RealmObjectBase.freezeObject<WorkoutHistory>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'workoutTypeId': workoutTypeId.toEJson(),
      'duration': duration.toEJson(),
      'reps': reps.toEJson(),
      'sets': sets.toEJson(),
      'personalRecord': personalRecord.toEJson(),
      'date': date.toEJson(),
    };
  }

  static EJsonValue _toEJson(WorkoutHistory value) => value.toEJson();
  static WorkoutHistory _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'workoutTypeId': EJsonValue workoutTypeId,
        'duration': EJsonValue duration,
        'reps': EJsonValue reps,
        'sets': EJsonValue sets,
        'personalRecord': EJsonValue personalRecord,
        'date': EJsonValue date,
      } =>
        WorkoutHistory(
          fromEJson(id),
          fromEJson(workoutTypeId),
          fromEJson(duration),
          fromEJson(reps),
          fromEJson(sets),
          fromEJson(personalRecord),
          fromEJson(date),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(WorkoutHistory._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, WorkoutHistory, 'WorkoutHistory', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('workoutTypeId', RealmPropertyType.objectid),
      SchemaProperty('duration', RealmPropertyType.int),
      SchemaProperty('reps', RealmPropertyType.int),
      SchemaProperty('sets', RealmPropertyType.int),
      SchemaProperty('personalRecord', RealmPropertyType.bool),
      SchemaProperty('date', RealmPropertyType.timestamp),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
