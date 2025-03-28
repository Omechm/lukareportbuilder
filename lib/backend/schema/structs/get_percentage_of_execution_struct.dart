// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GetPercentageOfExecutionStruct extends BaseStruct {
  GetPercentageOfExecutionStruct({
    String? clientname,
    double? executionpercentage,
  })  : _clientname = clientname,
        _executionpercentage = executionpercentage;

  // "clientname" field.
  String? _clientname;
  String get clientname => _clientname ?? '';
  set clientname(String? val) => _clientname = val;

  bool hasClientname() => _clientname != null;

  // "executionpercentage" field.
  double? _executionpercentage;
  double get executionpercentage => _executionpercentage ?? 0.0;
  set executionpercentage(double? val) => _executionpercentage = val;

  void incrementExecutionpercentage(double amount) =>
      executionpercentage = executionpercentage + amount;

  bool hasExecutionpercentage() => _executionpercentage != null;

  static GetPercentageOfExecutionStruct fromMap(Map<String, dynamic> data) =>
      GetPercentageOfExecutionStruct(
        clientname: data['clientname'] as String?,
        executionpercentage: castToType<double>(data['executionpercentage']),
      );

  static GetPercentageOfExecutionStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? GetPercentageOfExecutionStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'clientname': _clientname,
        'executionpercentage': _executionpercentage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'clientname': serializeParam(
          _clientname,
          ParamType.String,
        ),
        'executionpercentage': serializeParam(
          _executionpercentage,
          ParamType.double,
        ),
      }.withoutNulls;

  static GetPercentageOfExecutionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GetPercentageOfExecutionStruct(
        clientname: deserializeParam(
          data['clientname'],
          ParamType.String,
          false,
        ),
        executionpercentage: deserializeParam(
          data['executionpercentage'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'GetPercentageOfExecutionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GetPercentageOfExecutionStruct &&
        clientname == other.clientname &&
        executionpercentage == other.executionpercentage;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([clientname, executionpercentage]);
}

GetPercentageOfExecutionStruct createGetPercentageOfExecutionStruct({
  String? clientname,
  double? executionpercentage,
}) =>
    GetPercentageOfExecutionStruct(
      clientname: clientname,
      executionpercentage: executionpercentage,
    );
