import '../../domain/entities/exercise_set.dart';

/// Data model for exercise_sets table
/// Handles SQLite representation and conversion to/from domain entities
class ExerciseSetModel {
  final int? id;
  final int? exerciseId; // Foreign key to workout_exercises table
  final int order;
  final int reps;
  final int? weight;
  final int? restTimeSeconds;
  final String setType;

  const ExerciseSetModel({
    this.id,
    required this.exerciseId,
    required this.order,
    required this.reps,
    this.weight,
    this.restTimeSeconds,
    this.setType = 'regular',
  });

  factory ExerciseSetModel.fromEntity({required ExerciseSet entity, required int exerciseId}) {
    return ExerciseSetModel(
      id: entity.id,
      exerciseId: exerciseId,
      order: entity.order,
      reps: entity.reps,
      weight: entity.weight,
      restTimeSeconds: entity.restTime?.inSeconds,
      setType: entity.setType.name,
    );
  }

  factory ExerciseSetModel.fromMap(Map<String, dynamic> map) {
    return ExerciseSetModel(
      id: map['id'] as int?,
      exerciseId: map['exercise_id'] as int,
      order: map['set_order'] as int,
      reps: map['reps'] as int,
      weight: map['weight'] as int?,
      restTimeSeconds: map['rest_time_seconds'] as int?,
      setType: map['set_type'] as String? ?? 'regular',
    );
  }

  ExerciseSet toEntity() {
    return ExerciseSet(
      id: id,
      order: order,
      reps: reps,
      weight: weight,
      restTime: restTimeSeconds != null ? Duration(seconds: restTimeSeconds!) : null,
      setType: SetType.values.firstWhere((e) => e.name == setType, orElse: () => SetType.working),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'exercise_id': exerciseId,
      'set_order': order,
      'reps': reps,
      'weight': weight,
      'rest_time_seconds': restTimeSeconds,
      'set_type': setType,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ExerciseSetModel && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'ExerciseSetModel{ id: ${id ?? 'null'}, workoutExerciseId: $exerciseId, set: $order }';
}
