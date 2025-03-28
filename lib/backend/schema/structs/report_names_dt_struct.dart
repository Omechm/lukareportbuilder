// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportNamesDtStruct extends BaseStruct {
  ReportNamesDtStruct({
    String? name,
  }) : _name = name;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static ReportNamesDtStruct fromMap(Map<String, dynamic> data) =>
      ReportNamesDtStruct(
        name: data['Name'] as String?,
      );

  static ReportNamesDtStruct? maybeFromMap(dynamic data) => data is Map
      ? ReportNamesDtStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static ReportNamesDtStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReportNamesDtStruct(
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ReportNamesDtStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReportNamesDtStruct && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([name]);
}

ReportNamesDtStruct createReportNamesDtStruct({
  String? name,
}) =>
    ReportNamesDtStruct(
      name: name,
    );
