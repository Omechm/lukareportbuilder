// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OptionsDtStruct extends BaseStruct {
  OptionsDtStruct({
    String? value,
  }) : _value = value;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;

  bool hasValue() => _value != null;

  static OptionsDtStruct fromMap(Map<String, dynamic> data) => OptionsDtStruct(
        value: data['value'] as String?,
      );

  static OptionsDtStruct? maybeFromMap(dynamic data) => data is Map
      ? OptionsDtStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
      }.withoutNulls;

  static OptionsDtStruct fromSerializableMap(Map<String, dynamic> data) =>
      OptionsDtStruct(
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OptionsDtStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OptionsDtStruct && value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([value]);
}

OptionsDtStruct createOptionsDtStruct({
  String? value,
}) =>
    OptionsDtStruct(
      value: value,
    );
