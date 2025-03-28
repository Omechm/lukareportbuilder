// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NonCompliantLocationCountStruct extends BaseStruct {
  NonCompliantLocationCountStruct({
    String? location,
    int? count,
  })  : _location = location,
        _count = count;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  static NonCompliantLocationCountStruct fromMap(Map<String, dynamic> data) =>
      NonCompliantLocationCountStruct(
        location: data['location'] as String?,
        count: castToType<int>(data['count']),
      );

  static NonCompliantLocationCountStruct? maybeFromMap(dynamic data) => data
          is Map
      ? NonCompliantLocationCountStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'location': _location,
        'count': _count,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
      }.withoutNulls;

  static NonCompliantLocationCountStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NonCompliantLocationCountStruct(
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'NonCompliantLocationCountStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NonCompliantLocationCountStruct &&
        location == other.location &&
        count == other.count;
  }

  @override
  int get hashCode => const ListEquality().hash([location, count]);
}

NonCompliantLocationCountStruct createNonCompliantLocationCountStruct({
  String? location,
  int? count,
}) =>
    NonCompliantLocationCountStruct(
      location: location,
      count: count,
    );
