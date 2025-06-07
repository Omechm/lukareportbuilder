// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AssignmentsStruct extends BaseStruct {
  AssignmentsStruct({
    String? city,
    String? state,
    String? address,
    String? clientId,
    String? userRole,
    String? clientName,
  })  : _city = city,
        _state = state,
        _address = address,
        _clientId = clientId,
        _userRole = userRole,
        _clientName = clientName;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;

  bool hasState() => _state != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "client_id" field.
  String? _clientId;
  String get clientId => _clientId ?? '';
  set clientId(String? val) => _clientId = val;

  bool hasClientId() => _clientId != null;

  // "user_role" field.
  String? _userRole;
  String get userRole => _userRole ?? '';
  set userRole(String? val) => _userRole = val;

  bool hasUserRole() => _userRole != null;

  // "client_name" field.
  String? _clientName;
  String get clientName => _clientName ?? '';
  set clientName(String? val) => _clientName = val;

  bool hasClientName() => _clientName != null;

  static AssignmentsStruct fromMap(Map<String, dynamic> data) =>
      AssignmentsStruct(
        city: data['city'] as String?,
        state: data['state'] as String?,
        address: data['address'] as String?,
        clientId: data['client_id'] as String?,
        userRole: data['user_role'] as String?,
        clientName: data['client_name'] as String?,
      );

  static AssignmentsStruct? maybeFromMap(dynamic data) => data is Map
      ? AssignmentsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'city': _city,
        'state': _state,
        'address': _address,
        'client_id': _clientId,
        'user_role': _userRole,
        'client_name': _clientName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'client_id': serializeParam(
          _clientId,
          ParamType.String,
        ),
        'user_role': serializeParam(
          _userRole,
          ParamType.String,
        ),
        'client_name': serializeParam(
          _clientName,
          ParamType.String,
        ),
      }.withoutNulls;

  static AssignmentsStruct fromSerializableMap(Map<String, dynamic> data) =>
      AssignmentsStruct(
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        clientId: deserializeParam(
          data['client_id'],
          ParamType.String,
          false,
        ),
        userRole: deserializeParam(
          data['user_role'],
          ParamType.String,
          false,
        ),
        clientName: deserializeParam(
          data['client_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AssignmentsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AssignmentsStruct &&
        city == other.city &&
        state == other.state &&
        address == other.address &&
        clientId == other.clientId &&
        userRole == other.userRole &&
        clientName == other.clientName;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([city, state, address, clientId, userRole, clientName]);
}

AssignmentsStruct createAssignmentsStruct({
  String? city,
  String? state,
  String? address,
  String? clientId,
  String? userRole,
  String? clientName,
}) =>
    AssignmentsStruct(
      city: city,
      state: state,
      address: address,
      clientId: clientId,
      userRole: userRole,
      clientName: clientName,
    );
