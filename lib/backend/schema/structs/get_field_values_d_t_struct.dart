// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GetFieldValuesDTStruct extends BaseStruct {
  GetFieldValuesDTStruct({
    String? recordId,
    String? taskName,
    String? fieldName,
    String? userId,
    String? fullName,
    String? clientId,
    String? clientName,
    String? clientAddress,
    String? companyName,
    int? orderId,
    String? fieldType,
    String? reportDate,
    String? value,
  })  : _recordId = recordId,
        _taskName = taskName,
        _fieldName = fieldName,
        _userId = userId,
        _fullName = fullName,
        _clientId = clientId,
        _clientName = clientName,
        _clientAddress = clientAddress,
        _companyName = companyName,
        _orderId = orderId,
        _fieldType = fieldType,
        _reportDate = reportDate,
        _value = value;

  // "record_id" field.
  String? _recordId;
  String get recordId => _recordId ?? '';
  set recordId(String? val) => _recordId = val;

  bool hasRecordId() => _recordId != null;

  // "task_name" field.
  String? _taskName;
  String get taskName => _taskName ?? '';
  set taskName(String? val) => _taskName = val;

  bool hasTaskName() => _taskName != null;

  // "field_name" field.
  String? _fieldName;
  String get fieldName => _fieldName ?? '';
  set fieldName(String? val) => _fieldName = val;

  bool hasFieldName() => _fieldName != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;

  bool hasFullName() => _fullName != null;

  // "client_id" field.
  String? _clientId;
  String get clientId => _clientId ?? '';
  set clientId(String? val) => _clientId = val;

  bool hasClientId() => _clientId != null;

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

  // "company_name" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  set companyName(String? val) => _companyName = val;

  bool hasCompanyName() => _companyName != null;

  // "order_id" field.
  int? _orderId;
  int get orderId => _orderId ?? 0;
  set orderId(int? val) => _orderId = val;

  void incrementOrderId(int amount) => orderId = orderId + amount;

  bool hasOrderId() => _orderId != null;

  // "field_type" field.
  String? _fieldType;
  String get fieldType => _fieldType ?? '';
  set fieldType(String? val) => _fieldType = val;

  bool hasFieldType() => _fieldType != null;

  // "report_date" field.
  String? _reportDate;
  String get reportDate => _reportDate ?? '';
  set reportDate(String? val) => _reportDate = val;

  bool hasReportDate() => _reportDate != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;

  bool hasValue() => _value != null;

  static GetFieldValuesDTStruct fromMap(Map<String, dynamic> data) =>
      GetFieldValuesDTStruct(
        recordId: data['record_id'] as String?,
        taskName: data['task_name'] as String?,
        fieldName: data['field_name'] as String?,
        userId: data['user_id'] as String?,
        fullName: data['full_name'] as String?,
        clientId: data['client_id'] as String?,
        clientName: data['client_name'] as String?,
        clientAddress: data['client_address'] as String?,
        companyName: data['company_name'] as String?,
        orderId: castToType<int>(data['order_id']),
        fieldType: data['field_type'] as String?,
        reportDate: data['report_date'] as String?,
        value: data['value'] as String?,
      );

  static GetFieldValuesDTStruct? maybeFromMap(dynamic data) => data is Map
      ? GetFieldValuesDTStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'record_id': _recordId,
        'task_name': _taskName,
        'field_name': _fieldName,
        'user_id': _userId,
        'full_name': _fullName,
        'client_id': _clientId,
        'client_name': _clientName,
        'client_address': _clientAddress,
        'company_name': _companyName,
        'order_id': _orderId,
        'field_type': _fieldType,
        'report_date': _reportDate,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'record_id': serializeParam(
          _recordId,
          ParamType.String,
        ),
        'task_name': serializeParam(
          _taskName,
          ParamType.String,
        ),
        'field_name': serializeParam(
          _fieldName,
          ParamType.String,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'full_name': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'client_id': serializeParam(
          _clientId,
          ParamType.String,
        ),
        'client_name': serializeParam(
          _clientName,
          ParamType.String,
        ),
        'client_address': serializeParam(
          _clientAddress,
          ParamType.String,
        ),
        'company_name': serializeParam(
          _companyName,
          ParamType.String,
        ),
        'order_id': serializeParam(
          _orderId,
          ParamType.int,
        ),
        'field_type': serializeParam(
          _fieldType,
          ParamType.String,
        ),
        'report_date': serializeParam(
          _reportDate,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
      }.withoutNulls;

  static GetFieldValuesDTStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GetFieldValuesDTStruct(
        recordId: deserializeParam(
          data['record_id'],
          ParamType.String,
          false,
        ),
        taskName: deserializeParam(
          data['task_name'],
          ParamType.String,
          false,
        ),
        fieldName: deserializeParam(
          data['field_name'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        fullName: deserializeParam(
          data['full_name'],
          ParamType.String,
          false,
        ),
        clientId: deserializeParam(
          data['client_id'],
          ParamType.String,
          false,
        ),
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
        companyName: deserializeParam(
          data['company_name'],
          ParamType.String,
          false,
        ),
        orderId: deserializeParam(
          data['order_id'],
          ParamType.int,
          false,
        ),
        fieldType: deserializeParam(
          data['field_type'],
          ParamType.String,
          false,
        ),
        reportDate: deserializeParam(
          data['report_date'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GetFieldValuesDTStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GetFieldValuesDTStruct &&
        recordId == other.recordId &&
        taskName == other.taskName &&
        fieldName == other.fieldName &&
        userId == other.userId &&
        fullName == other.fullName &&
        clientId == other.clientId &&
        clientName == other.clientName &&
        clientAddress == other.clientAddress &&
        companyName == other.companyName &&
        orderId == other.orderId &&
        fieldType == other.fieldType &&
        reportDate == other.reportDate &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([
        recordId,
        taskName,
        fieldName,
        userId,
        fullName,
        clientId,
        clientName,
        clientAddress,
        companyName,
        orderId,
        fieldType,
        reportDate,
        value
      ]);
}

GetFieldValuesDTStruct createGetFieldValuesDTStruct({
  String? recordId,
  String? taskName,
  String? fieldName,
  String? userId,
  String? fullName,
  String? clientId,
  String? clientName,
  String? clientAddress,
  String? companyName,
  int? orderId,
  String? fieldType,
  String? reportDate,
  String? value,
}) =>
    GetFieldValuesDTStruct(
      recordId: recordId,
      taskName: taskName,
      fieldName: fieldName,
      userId: userId,
      fullName: fullName,
      clientId: clientId,
      clientName: clientName,
      clientAddress: clientAddress,
      companyName: companyName,
      orderId: orderId,
      fieldType: fieldType,
      reportDate: reportDate,
      value: value,
    );
