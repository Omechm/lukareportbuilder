// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InspectionFieldsDtStruct extends BaseStruct {
  InspectionFieldsDtStruct({
    String? fieldName,
    String? fieldType,
    bool? isRequired,
    bool? isPublished,
    String? fieldId,
  })  : _fieldName = fieldName,
        _fieldType = fieldType,
        _isRequired = isRequired,
        _isPublished = isPublished,
        _fieldId = fieldId;

  // "field_name" field.
  String? _fieldName;
  String get fieldName => _fieldName ?? '';
  set fieldName(String? val) => _fieldName = val;

  bool hasFieldName() => _fieldName != null;

  // "field_type" field.
  String? _fieldType;
  String get fieldType => _fieldType ?? '';
  set fieldType(String? val) => _fieldType = val;

  bool hasFieldType() => _fieldType != null;

  // "is_required" field.
  bool? _isRequired;
  bool get isRequired => _isRequired ?? false;
  set isRequired(bool? val) => _isRequired = val;

  bool hasIsRequired() => _isRequired != null;

  // "is_published" field.
  bool? _isPublished;
  bool get isPublished => _isPublished ?? false;
  set isPublished(bool? val) => _isPublished = val;

  bool hasIsPublished() => _isPublished != null;

  // "field_id" field.
  String? _fieldId;
  String get fieldId => _fieldId ?? '';
  set fieldId(String? val) => _fieldId = val;

  bool hasFieldId() => _fieldId != null;

  static InspectionFieldsDtStruct fromMap(Map<String, dynamic> data) =>
      InspectionFieldsDtStruct(
        fieldName: data['field_name'] as String?,
        fieldType: data['field_type'] as String?,
        isRequired: data['is_required'] as bool?,
        isPublished: data['is_published'] as bool?,
        fieldId: data['field_id'] as String?,
      );

  static InspectionFieldsDtStruct? maybeFromMap(dynamic data) => data is Map
      ? InspectionFieldsDtStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'field_name': _fieldName,
        'field_type': _fieldType,
        'is_required': _isRequired,
        'is_published': _isPublished,
        'field_id': _fieldId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'field_name': serializeParam(
          _fieldName,
          ParamType.String,
        ),
        'field_type': serializeParam(
          _fieldType,
          ParamType.String,
        ),
        'is_required': serializeParam(
          _isRequired,
          ParamType.bool,
        ),
        'is_published': serializeParam(
          _isPublished,
          ParamType.bool,
        ),
        'field_id': serializeParam(
          _fieldId,
          ParamType.String,
        ),
      }.withoutNulls;

  static InspectionFieldsDtStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      InspectionFieldsDtStruct(
        fieldName: deserializeParam(
          data['field_name'],
          ParamType.String,
          false,
        ),
        fieldType: deserializeParam(
          data['field_type'],
          ParamType.String,
          false,
        ),
        isRequired: deserializeParam(
          data['is_required'],
          ParamType.bool,
          false,
        ),
        isPublished: deserializeParam(
          data['is_published'],
          ParamType.bool,
          false,
        ),
        fieldId: deserializeParam(
          data['field_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'InspectionFieldsDtStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InspectionFieldsDtStruct &&
        fieldName == other.fieldName &&
        fieldType == other.fieldType &&
        isRequired == other.isRequired &&
        isPublished == other.isPublished &&
        fieldId == other.fieldId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([fieldName, fieldType, isRequired, isPublished, fieldId]);
}

InspectionFieldsDtStruct createInspectionFieldsDtStruct({
  String? fieldName,
  String? fieldType,
  bool? isRequired,
  bool? isPublished,
  String? fieldId,
}) =>
    InspectionFieldsDtStruct(
      fieldName: fieldName,
      fieldType: fieldType,
      isRequired: isRequired,
      isPublished: isPublished,
      fieldId: fieldId,
    );
