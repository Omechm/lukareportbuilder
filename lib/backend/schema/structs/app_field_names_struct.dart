// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppFieldNamesStruct extends BaseStruct {
  AppFieldNamesStruct({
    String? fieldName,
    String? fieldId,
  })  : _fieldName = fieldName,
        _fieldId = fieldId;

  // "field_name" field.
  String? _fieldName;
  String get fieldName => _fieldName ?? 'nil';
  set fieldName(String? val) => _fieldName = val;

  bool hasFieldName() => _fieldName != null;

  // "field_id" field.
  String? _fieldId;
  String get fieldId => _fieldId ?? 'nil';
  set fieldId(String? val) => _fieldId = val;

  bool hasFieldId() => _fieldId != null;

  static AppFieldNamesStruct fromMap(Map<String, dynamic> data) =>
      AppFieldNamesStruct(
        fieldName: data['field_name'] as String?,
        fieldId: data['field_id'] as String?,
      );

  static AppFieldNamesStruct? maybeFromMap(dynamic data) => data is Map
      ? AppFieldNamesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'field_name': _fieldName,
        'field_id': _fieldId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'field_name': serializeParam(
          _fieldName,
          ParamType.String,
        ),
        'field_id': serializeParam(
          _fieldId,
          ParamType.String,
        ),
      }.withoutNulls;

  static AppFieldNamesStruct fromSerializableMap(Map<String, dynamic> data) =>
      AppFieldNamesStruct(
        fieldName: deserializeParam(
          data['field_name'],
          ParamType.String,
          false,
        ),
        fieldId: deserializeParam(
          data['field_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AppFieldNamesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AppFieldNamesStruct &&
        fieldName == other.fieldName &&
        fieldId == other.fieldId;
  }

  @override
  int get hashCode => const ListEquality().hash([fieldName, fieldId]);
}

AppFieldNamesStruct createAppFieldNamesStruct({
  String? fieldName,
  String? fieldId,
}) =>
    AppFieldNamesStruct(
      fieldName: fieldName,
      fieldId: fieldId,
    );
