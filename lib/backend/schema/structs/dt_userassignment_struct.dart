// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtUserassignmentStruct extends BaseStruct {
  DtUserassignmentStruct({
    String? userId,
    String? firstName,
    String? lastName,
    String? phone,
    String? lastSeen,
    String? companyName,
    String? userCompanyName,
    String? supervisorName,
    String? userEmail,
    String? userUsername,
    List<AssignmentsStruct>? assignments,
  })  : _userId = userId,
        _firstName = firstName,
        _lastName = lastName,
        _phone = phone,
        _lastSeen = lastSeen,
        _companyName = companyName,
        _userCompanyName = userCompanyName,
        _supervisorName = supervisorName,
        _userEmail = userEmail,
        _userUsername = userUsername,
        _assignments = assignments;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;

  bool hasPhone() => _phone != null;

  // "last_seen" field.
  String? _lastSeen;
  String get lastSeen => _lastSeen ?? '';
  set lastSeen(String? val) => _lastSeen = val;

  bool hasLastSeen() => _lastSeen != null;

  // "company_name" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  set companyName(String? val) => _companyName = val;

  bool hasCompanyName() => _companyName != null;

  // "user_company_name" field.
  String? _userCompanyName;
  String get userCompanyName => _userCompanyName ?? '';
  set userCompanyName(String? val) => _userCompanyName = val;

  bool hasUserCompanyName() => _userCompanyName != null;

  // "supervisor_name" field.
  String? _supervisorName;
  String get supervisorName => _supervisorName ?? '';
  set supervisorName(String? val) => _supervisorName = val;

  bool hasSupervisorName() => _supervisorName != null;

  // "user_email" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  set userEmail(String? val) => _userEmail = val;

  bool hasUserEmail() => _userEmail != null;

  // "user_username" field.
  String? _userUsername;
  String get userUsername => _userUsername ?? '';
  set userUsername(String? val) => _userUsername = val;

  bool hasUserUsername() => _userUsername != null;

  // "assignments" field.
  List<AssignmentsStruct>? _assignments;
  List<AssignmentsStruct> get assignments => _assignments ?? const [];
  set assignments(List<AssignmentsStruct>? val) => _assignments = val;

  void updateAssignments(Function(List<AssignmentsStruct>) updateFn) {
    updateFn(_assignments ??= []);
  }

  bool hasAssignments() => _assignments != null;

  static DtUserassignmentStruct fromMap(Map<String, dynamic> data) =>
      DtUserassignmentStruct(
        userId: data['user_id'] as String?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        phone: data['phone'] as String?,
        lastSeen: data['last_seen'] as String?,
        companyName: data['company_name'] as String?,
        userCompanyName: data['user_company_name'] as String?,
        supervisorName: data['supervisor_name'] as String?,
        userEmail: data['user_email'] as String?,
        userUsername: data['user_username'] as String?,
        assignments: getStructList(
          data['assignments'],
          AssignmentsStruct.fromMap,
        ),
      );

  static DtUserassignmentStruct? maybeFromMap(dynamic data) => data is Map
      ? DtUserassignmentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user_id': _userId,
        'first_name': _firstName,
        'last_name': _lastName,
        'phone': _phone,
        'last_seen': _lastSeen,
        'company_name': _companyName,
        'user_company_name': _userCompanyName,
        'supervisor_name': _supervisorName,
        'user_email': _userEmail,
        'user_username': _userUsername,
        'assignments': _assignments?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'last_seen': serializeParam(
          _lastSeen,
          ParamType.String,
        ),
        'company_name': serializeParam(
          _companyName,
          ParamType.String,
        ),
        'user_company_name': serializeParam(
          _userCompanyName,
          ParamType.String,
        ),
        'supervisor_name': serializeParam(
          _supervisorName,
          ParamType.String,
        ),
        'user_email': serializeParam(
          _userEmail,
          ParamType.String,
        ),
        'user_username': serializeParam(
          _userUsername,
          ParamType.String,
        ),
        'assignments': serializeParam(
          _assignments,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static DtUserassignmentStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DtUserassignmentStruct(
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        lastSeen: deserializeParam(
          data['last_seen'],
          ParamType.String,
          false,
        ),
        companyName: deserializeParam(
          data['company_name'],
          ParamType.String,
          false,
        ),
        userCompanyName: deserializeParam(
          data['user_company_name'],
          ParamType.String,
          false,
        ),
        supervisorName: deserializeParam(
          data['supervisor_name'],
          ParamType.String,
          false,
        ),
        userEmail: deserializeParam(
          data['user_email'],
          ParamType.String,
          false,
        ),
        userUsername: deserializeParam(
          data['user_username'],
          ParamType.String,
          false,
        ),
        assignments: deserializeStructParam<AssignmentsStruct>(
          data['assignments'],
          ParamType.DataStruct,
          true,
          structBuilder: AssignmentsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DtUserassignmentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DtUserassignmentStruct &&
        userId == other.userId &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        phone == other.phone &&
        lastSeen == other.lastSeen &&
        companyName == other.companyName &&
        userCompanyName == other.userCompanyName &&
        supervisorName == other.supervisorName &&
        userEmail == other.userEmail &&
        userUsername == other.userUsername &&
        listEquality.equals(assignments, other.assignments);
  }

  @override
  int get hashCode => const ListEquality().hash([
        userId,
        firstName,
        lastName,
        phone,
        lastSeen,
        companyName,
        userCompanyName,
        supervisorName,
        userEmail,
        userUsername,
        assignments
      ]);
}

DtUserassignmentStruct createDtUserassignmentStruct({
  String? userId,
  String? firstName,
  String? lastName,
  String? phone,
  String? lastSeen,
  String? companyName,
  String? userCompanyName,
  String? supervisorName,
  String? userEmail,
  String? userUsername,
}) =>
    DtUserassignmentStruct(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      lastSeen: lastSeen,
      companyName: companyName,
      userCompanyName: userCompanyName,
      supervisorName: supervisorName,
      userEmail: userEmail,
      userUsername: userUsername,
    );
