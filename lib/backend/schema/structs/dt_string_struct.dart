// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtStringStruct extends BaseStruct {
  DtStringStruct({
    String? fieldType,
  }) : _fieldType = fieldType;

  // "field_type" field.
  String? _fieldType;
  String get fieldType => _fieldType ?? '';
  set fieldType(String? val) => _fieldType = val;

  bool hasFieldType() => _fieldType != null;

  static DtStringStruct fromMap(Map<String, dynamic> data) => DtStringStruct(
        fieldType: data['field_type'] as String?,
      );

  static DtStringStruct? maybeFromMap(dynamic data) =>
      data is Map ? DtStringStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'field_type': _fieldType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'field_type': serializeParam(
          _fieldType,
          ParamType.String,
        ),
      }.withoutNulls;

  static DtStringStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtStringStruct(
        fieldType: deserializeParam(
          data['field_type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DtStringStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtStringStruct && fieldType == other.fieldType;
  }

  @override
  int get hashCode => const ListEquality().hash([fieldType]);
}

DtStringStruct createDtStringStruct({
  String? fieldType,
}) =>
    DtStringStruct(
      fieldType: fieldType,
    );
