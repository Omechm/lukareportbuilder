// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserClientAssignmentStruct extends BaseStruct {
  UserClientAssignmentStruct({
    String? clientName,
    String? clientAddress,
  })  : _clientName = clientName,
        _clientAddress = clientAddress;

  // "client_name" field.
  String? _clientName;
  String get clientName => _clientName ?? '';
  set clientName(String? val) => _clientName = val;

  bool hasClientName() => _clientName != null;

  // "client_address" field.
  String? _clientAddress;
  String get clientAddress => _clientAddress ?? '';
  set clientAddress(String? val) => _clientAddress = val;

  bool hasClientAddress() => _clientAddress != null;

  static UserClientAssignmentStruct fromMap(Map<String, dynamic> data) =>
      UserClientAssignmentStruct(
        clientName: data['client_name'] as String?,
        clientAddress: data['client_address'] as String?,
      );

  static UserClientAssignmentStruct? maybeFromMap(dynamic data) => data is Map
      ? UserClientAssignmentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'client_name': _clientName,
        'client_address': _clientAddress,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'client_name': serializeParam(
          _clientName,
          ParamType.String,
        ),
        'client_address': serializeParam(
          _clientAddress,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserClientAssignmentStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserClientAssignmentStruct(
        clientName: deserializeParam(
          data['client_name'],
          ParamType.String,
          false,
        ),
        clientAddress: deserializeParam(
          data['client_address'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserClientAssignmentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserClientAssignmentStruct &&
        clientName == other.clientName &&
        clientAddress == other.clientAddress;
  }

  @override
  int get hashCode => const ListEquality().hash([clientName, clientAddress]);
}

UserClientAssignmentStruct createUserClientAssignmentStruct({
  String? clientName,
  String? clientAddress,
}) =>
    UserClientAssignmentStruct(
      clientName: clientName,
      clientAddress: clientAddress,
    );
