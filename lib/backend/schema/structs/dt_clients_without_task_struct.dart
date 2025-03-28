// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtClientsWithoutTaskStruct extends BaseStruct {
  DtClientsWithoutTaskStruct({
    String? clientName,
  }) : _clientName = clientName;

  // "client_name" field.
  String? _clientName;
  String get clientName => _clientName ?? '';
  set clientName(String? val) => _clientName = val;

  bool hasClientName() => _clientName != null;

  static DtClientsWithoutTaskStruct fromMap(Map<String, dynamic> data) =>
      DtClientsWithoutTaskStruct(
        clientName: data['client_name'] as String?,
      );

  static DtClientsWithoutTaskStruct? maybeFromMap(dynamic data) => data is Map
      ? DtClientsWithoutTaskStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'client_name': _clientName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'client_name': serializeParam(
          _clientName,
          ParamType.String,
        ),
      }.withoutNulls;

  static DtClientsWithoutTaskStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DtClientsWithoutTaskStruct(
        clientName: deserializeParam(
          data['client_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DtClientsWithoutTaskStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtClientsWithoutTaskStruct &&
        clientName == other.clientName;
  }

  @override
  int get hashCode => const ListEquality().hash([clientName]);
}

DtClientsWithoutTaskStruct createDtClientsWithoutTaskStruct({
  String? clientName,
}) =>
    DtClientsWithoutTaskStruct(
      clientName: clientName,
    );
