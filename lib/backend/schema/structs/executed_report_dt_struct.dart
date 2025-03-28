// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExecutedReportDtStruct extends BaseStruct {
  ExecutedReportDtStruct({
    String? reportName,
    String? supervisorFullName,
    String? clientName,
    DateTime? reportDate,
    String? recordID,
    String? location,
    String? compsiteKey,
    int? id,
    String? userId,
  })  : _reportName = reportName,
        _supervisorFullName = supervisorFullName,
        _clientName = clientName,
        _reportDate = reportDate,
        _recordID = recordID,
        _location = location,
        _compsiteKey = compsiteKey,
        _id = id,
        _userId = userId;

  // "ReportName" field.
  String? _reportName;
  String get reportName => _reportName ?? '';
  set reportName(String? val) => _reportName = val;

  bool hasReportName() => _reportName != null;

  // "SupervisorFullName" field.
  String? _supervisorFullName;
  String get supervisorFullName => _supervisorFullName ?? '';
  set supervisorFullName(String? val) => _supervisorFullName = val;

  bool hasSupervisorFullName() => _supervisorFullName != null;

  // "ClientName" field.
  String? _clientName;
  String get clientName => _clientName ?? '';
  set clientName(String? val) => _clientName = val;

  bool hasClientName() => _clientName != null;

  // "ReportDate" field.
  DateTime? _reportDate;
  DateTime? get reportDate => _reportDate;
  set reportDate(DateTime? val) => _reportDate = val;

  bool hasReportDate() => _reportDate != null;

  // "RecordID" field.
  String? _recordID;
  String get recordID => _recordID ?? '';
  set recordID(String? val) => _recordID = val;

  bool hasRecordID() => _recordID != null;

  // "Location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "compsiteKey" field.
  String? _compsiteKey;
  String get compsiteKey => _compsiteKey ?? '';
  set compsiteKey(String? val) => _compsiteKey = val;

  bool hasCompsiteKey() => _compsiteKey != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  static ExecutedReportDtStruct fromMap(Map<String, dynamic> data) =>
      ExecutedReportDtStruct(
        reportName: data['ReportName'] as String?,
        supervisorFullName: data['SupervisorFullName'] as String?,
        clientName: data['ClientName'] as String?,
        reportDate: data['ReportDate'] as DateTime?,
        recordID: data['RecordID'] as String?,
        location: data['Location'] as String?,
        compsiteKey: data['compsiteKey'] as String?,
        id: castToType<int>(data['id']),
        userId: data['user_id'] as String?,
      );

  static ExecutedReportDtStruct? maybeFromMap(dynamic data) => data is Map
      ? ExecutedReportDtStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ReportName': _reportName,
        'SupervisorFullName': _supervisorFullName,
        'ClientName': _clientName,
        'ReportDate': _reportDate,
        'RecordID': _recordID,
        'Location': _location,
        'compsiteKey': _compsiteKey,
        'id': _id,
        'user_id': _userId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ReportName': serializeParam(
          _reportName,
          ParamType.String,
        ),
        'SupervisorFullName': serializeParam(
          _supervisorFullName,
          ParamType.String,
        ),
        'ClientName': serializeParam(
          _clientName,
          ParamType.String,
        ),
        'ReportDate': serializeParam(
          _reportDate,
          ParamType.DateTime,
        ),
        'RecordID': serializeParam(
          _recordID,
          ParamType.String,
        ),
        'Location': serializeParam(
          _location,
          ParamType.String,
        ),
        'compsiteKey': serializeParam(
          _compsiteKey,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
      }.withoutNulls;

  static ExecutedReportDtStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ExecutedReportDtStruct(
        reportName: deserializeParam(
          data['ReportName'],
          ParamType.String,
          false,
        ),
        supervisorFullName: deserializeParam(
          data['SupervisorFullName'],
          ParamType.String,
          false,
        ),
        clientName: deserializeParam(
          data['ClientName'],
          ParamType.String,
          false,
        ),
        reportDate: deserializeParam(
          data['ReportDate'],
          ParamType.DateTime,
          false,
        ),
        recordID: deserializeParam(
          data['RecordID'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['Location'],
          ParamType.String,
          false,
        ),
        compsiteKey: deserializeParam(
          data['compsiteKey'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ExecutedReportDtStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExecutedReportDtStruct &&
        reportName == other.reportName &&
        supervisorFullName == other.supervisorFullName &&
        clientName == other.clientName &&
        reportDate == other.reportDate &&
        recordID == other.recordID &&
        location == other.location &&
        compsiteKey == other.compsiteKey &&
        id == other.id &&
        userId == other.userId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        reportName,
        supervisorFullName,
        clientName,
        reportDate,
        recordID,
        location,
        compsiteKey,
        id,
        userId
      ]);
}

ExecutedReportDtStruct createExecutedReportDtStruct({
  String? reportName,
  String? supervisorFullName,
  String? clientName,
  DateTime? reportDate,
  String? recordID,
  String? location,
  String? compsiteKey,
  int? id,
  String? userId,
}) =>
    ExecutedReportDtStruct(
      reportName: reportName,
      supervisorFullName: supervisorFullName,
      clientName: clientName,
      reportDate: reportDate,
      recordID: recordID,
      location: location,
      compsiteKey: compsiteKey,
      id: id,
      userId: userId,
    );
