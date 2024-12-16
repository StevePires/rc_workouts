// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_type.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class WorkoutType extends _WorkoutType
    with RealmEntity, RealmObjectBase, RealmObject {
  WorkoutType(
    ObjectId id,
    String label,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'label', label);
  }

  WorkoutType._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get label => RealmObjectBase.get<String>(this, 'label') as String;
  @override
  set label(String value) => RealmObjectBase.set(this, 'label', value);

  @override
  Stream<RealmObjectChanges<WorkoutType>> get changes =>
      RealmObjectBase.getChanges<WorkoutType>(this);

  @override
  WorkoutType freeze() => RealmObjectBase.freezeObject<WorkoutType>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'label': label.toEJson(),
    };
  }

  static EJsonValue _toEJson(WorkoutType value) => value.toEJson();
  static WorkoutType _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'label': EJsonValue label,
      } =>
        WorkoutType(
          fromEJson(id),
          fromEJson(label),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(WorkoutType._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, WorkoutType, 'WorkoutType', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('label', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
