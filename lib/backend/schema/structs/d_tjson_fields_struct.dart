// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DTjsonFieldsStruct extends BaseStruct {
  DTjsonFieldsStruct({
    String? value,
    String? fieldId,
    int? orderId,
    String? picName,
    String? valueId,
    String? fieldName,
    String? fieldType,
    String? fieldIndex,
    bool? isRequired,
    String? reportDate,
    String? companyName,
    bool? isPublished,
    String? submittedAt,
    String? defaultValue,
    String? fieldOptions,
    String? clientAddress,
    String? metaFieldName,
    String? metaFieldType,
    String? imgCapturedDate,
    String? metaCompanyName,
    String? clientLocationId,
  })  : _value = value,
        _fieldId = fieldId,
        _orderId = orderId,
        _picName = picName,
        _valueId = valueId,
        _fieldName = fieldName,
        _fieldType = fieldType,
        _fieldIndex = fieldIndex,
        _isRequired = isRequired,
        _reportDate = reportDate,
        _companyName = companyName,
        _isPublished = isPublished,
        _submittedAt = submittedAt,
        _defaultValue = defaultValue,
        _fieldOptions = fieldOptions,
        _clientAddress = clientAddress,
        _metaFieldName = metaFieldName,
        _metaFieldType = metaFieldType,
        _imgCapturedDate = imgCapturedDate,
        _metaCompanyName = metaCompanyName,
        _clientLocationId = clientLocationId;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;

  bool hasValue() => _value != null;

  // "field_id" field.
  String? _fieldId;
  String get fieldId => _fieldId ?? '';
  set fieldId(String? val) => _fieldId = val;

  bool hasFieldId() => _fieldId != null;

  // "order_id" field.
  int? _orderId;
  int get orderId => _orderId ?? 0;
  set orderId(int? val) => _orderId = val;

  void incrementOrderId(int amount) => orderId = orderId + amount;

  bool hasOrderId() => _orderId != null;

  // "pic_name" field.
  String? _picName;
  String get picName => _picName ?? '';
  set picName(String? val) => _picName = val;

  bool hasPicName() => _picName != null;

  // "value_id" field.
  String? _valueId;
  String get valueId => _valueId ?? '';
  set valueId(String? val) => _valueId = val;

  bool hasValueId() => _valueId != null;

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

  // "field_index" field.
  String? _fieldIndex;
  String get fieldIndex => _fieldIndex ?? '';
  set fieldIndex(String? val) => _fieldIndex = val;

  bool hasFieldIndex() => _fieldIndex != null;

  // "is_required" field.
  bool? _isRequired;
  bool get isRequired => _isRequired ?? false;
  set isRequired(bool? val) => _isRequired = val;

  bool hasIsRequired() => _isRequired != null;

  // "report_date" field.
  String? _reportDate;
  String get reportDate => _reportDate ?? '';
  set reportDate(String? val) => _reportDate = val;

  bool hasReportDate() => _reportDate != null;

  // "company_name" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  set companyName(String? val) => _companyName = val;

  bool hasCompanyName() => _companyName != null;

  // "is_published" field.
  bool? _isPublished;
  bool get isPublished => _isPublished ?? false;
  set isPublished(bool? val) => _isPublished = val;

  bool hasIsPublished() => _isPublished != null;

  // "submitted_at" field.
  String? _submittedAt;
  String get submittedAt => _submittedAt ?? '';
  set submittedAt(String? val) => _submittedAt = val;

  bool hasSubmittedAt() => _submittedAt != null;

  // "default_value" field.
  String? _defaultValue;
  String get defaultValue => _defaultValue ?? '';
  set defaultValue(String? val) => _defaultValue = val;

  bool hasDefaultValue() => _defaultValue != null;

  // "field_options" field.
  String? _fieldOptions;
  String get fieldOptions => _fieldOptions ?? '';
  set fieldOptions(String? val) => _fieldOptions = val;

  bool hasFieldOptions() => _fieldOptions != null;

  // "client_address" field.
  String? _clientAddress;
  String get clientAddress => _clientAddress ?? '';
  set clientAddress(String? val) => _clientAddress = val;

  bool hasClientAddress() => _clientAddress != null;

  // "meta_field_name" field.
  String? _metaFieldName;
  String get metaFieldName => _metaFieldName ?? '';
  set metaFieldName(String? val) => _metaFieldName = val;

  bool hasMetaFieldName() => _metaFieldName != null;

  // "meta_field_type" field.
  String? _metaFieldType;
  String get metaFieldType => _metaFieldType ?? '';
  set metaFieldType(String? val) => _metaFieldType = val;

  bool hasMetaFieldType() => _metaFieldType != null;

  // "img_captured_date" field.
  String? _imgCapturedDate;
  String get imgCapturedDate => _imgCapturedDate ?? '';
  set imgCapturedDate(String? val) => _imgCapturedDate = val;

  bool hasImgCapturedDate() => _imgCapturedDate != null;

  // "meta_company_name" field.
  String? _metaCompanyName;
  String get metaCompanyName => _metaCompanyName ?? '';
  set metaCompanyName(String? val) => _metaCompanyName = val;

  bool hasMetaCompanyName() => _metaCompanyName != null;

  // "client_location_id" field.
  String? _clientLocationId;
  String get clientLocationId => _clientLocationId ?? '';
  set clientLocationId(String? val) => _clientLocationId = val;

  bool hasClientLocationId() => _clientLocationId != null;

  static DTjsonFieldsStruct fromMap(Map<String, dynamic> data) =>
      DTjsonFieldsStruct(
        value: data['value'] as String?,
        fieldId: data['field_id'] as String?,
        orderId: castToType<int>(data['order_id']),
        picName: data['pic_name'] as String?,
        valueId: data['value_id'] as String?,
        fieldName: data['field_name'] as String?,
        fieldType: data['field_type'] as String?,
        fieldIndex: data['field_index'] as String?,
        isRequired: data['is_required'] as bool?,
        reportDate: data['report_date'] as String?,
        companyName: data['company_name'] as String?,
        isPublished: data['is_published'] as bool?,
        submittedAt: data['submitted_at'] as String?,
        defaultValue: data['default_value'] as String?,
        fieldOptions: data['field_options'] as String?,
        clientAddress: data['client_address'] as String?,
        metaFieldName: data['meta_field_name'] as String?,
        metaFieldType: data['meta_field_type'] as String?,
        imgCapturedDate: data['img_captured_date'] as String?,
        metaCompanyName: data['meta_company_name'] as String?,
        clientLocationId: data['client_location_id'] as String?,
      );

  static DTjsonFieldsStruct? maybeFromMap(dynamic data) => data is Map
      ? DTjsonFieldsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'value': _value,
        'field_id': _fieldId,
        'order_id': _orderId,
        'pic_name': _picName,
        'value_id': _valueId,
        'field_name': _fieldName,
        'field_type': _fieldType,
        'field_index': _fieldIndex,
        'is_required': _isRequired,
        'report_date': _reportDate,
        'company_name': _companyName,
        'is_published': _isPublished,
        'submitted_at': _submittedAt,
        'default_value': _defaultValue,
        'field_options': _fieldOptions,
        'client_address': _clientAddress,
        'meta_field_name': _metaFieldName,
        'meta_field_type': _metaFieldType,
        'img_captured_date': _imgCapturedDate,
        'meta_company_name': _metaCompanyName,
        'client_location_id': _clientLocationId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
        'field_id': serializeParam(
          _fieldId,
          ParamType.String,
        ),
        'order_id': serializeParam(
          _orderId,
          ParamType.int,
        ),
        'pic_name': serializeParam(
          _picName,
          ParamType.String,
        ),
        'value_id': serializeParam(
          _valueId,
          ParamType.String,
        ),
        'field_name': serializeParam(
          _fieldName,
          ParamType.String,
        ),
        'field_type': serializeParam(
          _fieldType,
          ParamType.String,
        ),
        'field_index': serializeParam(
          _fieldIndex,
          ParamType.String,
        ),
        'is_required': serializeParam(
          _isRequired,
          ParamType.bool,
        ),
        'report_date': serializeParam(
          _reportDate,
          ParamType.String,
        ),
        'company_name': serializeParam(
          _companyName,
          ParamType.String,
        ),
        'is_published': serializeParam(
          _isPublished,
          ParamType.bool,
        ),
        'submitted_at': serializeParam(
          _submittedAt,
          ParamType.String,
        ),
        'default_value': serializeParam(
          _defaultValue,
          ParamType.String,
        ),
        'field_options': serializeParam(
          _fieldOptions,
          ParamType.String,
        ),
        'client_address': serializeParam(
          _clientAddress,
          ParamType.String,
        ),
        'meta_field_name': serializeParam(
          _metaFieldName,
          ParamType.String,
        ),
        'meta_field_type': serializeParam(
          _metaFieldType,
          ParamType.String,
        ),
        'img_captured_date': serializeParam(
          _imgCapturedDate,
          ParamType.String,
        ),
        'meta_company_name': serializeParam(
          _metaCompanyName,
          ParamType.String,
        ),
        'client_location_id': serializeParam(
          _clientLocationId,
          ParamType.String,
        ),
      }.withoutNulls;

  static DTjsonFieldsStruct fromSerializableMap(Map<String, dynamic> data) =>
      DTjsonFieldsStruct(
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
        fieldId: deserializeParam(
          data['field_id'],
          ParamType.String,
          false,
        ),
        orderId: deserializeParam(
          data['order_id'],
          ParamType.int,
          false,
        ),
        picName: deserializeParam(
          data['pic_name'],
          ParamType.String,
          false,
        ),
        valueId: deserializeParam(
          data['value_id'],
          ParamType.String,
          false,
        ),
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
        fieldIndex: deserializeParam(
          data['field_index'],
          ParamType.String,
          false,
        ),
        isRequired: deserializeParam(
          data['is_required'],
          ParamType.bool,
          false,
        ),
        reportDate: deserializeParam(
          data['report_date'],
          ParamType.String,
          false,
        ),
        companyName: deserializeParam(
          data['company_name'],
          ParamType.String,
          false,
        ),
        isPublished: deserializeParam(
          data['is_published'],
          ParamType.bool,
          false,
        ),
        submittedAt: deserializeParam(
          data['submitted_at'],
          ParamType.String,
          false,
        ),
        defaultValue: deserializeParam(
          data['default_value'],
          ParamType.String,
          false,
        ),
        fieldOptions: deserializeParam(
          data['field_options'],
          ParamType.String,
          false,
        ),
        clientAddress: deserializeParam(
          data['client_address'],
          ParamType.String,
          false,
        ),
        metaFieldName: deserializeParam(
          data['meta_field_name'],
          ParamType.String,
          false,
        ),
        metaFieldType: deserializeParam(
          data['meta_field_type'],
          ParamType.String,
          false,
        ),
        imgCapturedDate: deserializeParam(
          data['img_captured_date'],
          ParamType.String,
          false,
        ),
        metaCompanyName: deserializeParam(
          data['meta_company_name'],
          ParamType.String,
          false,
        ),
        clientLocationId: deserializeParam(
          data['client_location_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DTjsonFieldsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DTjsonFieldsStruct &&
        value == other.value &&
        fieldId == other.fieldId &&
        orderId == other.orderId &&
        picName == other.picName &&
        valueId == other.valueId &&
        fieldName == other.fieldName &&
        fieldType == other.fieldType &&
        fieldIndex == other.fieldIndex &&
        isRequired == other.isRequired &&
        reportDate == other.reportDate &&
        companyName == other.companyName &&
        isPublished == other.isPublished &&
        submittedAt == other.submittedAt &&
        defaultValue == other.defaultValue &&
        fieldOptions == other.fieldOptions &&
        clientAddress == other.clientAddress &&
        metaFieldName == other.metaFieldName &&
        metaFieldType == other.metaFieldType &&
        imgCapturedDate == other.imgCapturedDate &&
        metaCompanyName == other.metaCompanyName &&
        clientLocationId == other.clientLocationId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        value,
        fieldId,
        orderId,
        picName,
        valueId,
        fieldName,
        fieldType,
        fieldIndex,
        isRequired,
        reportDate,
        companyName,
        isPublished,
        submittedAt,
        defaultValue,
        fieldOptions,
        clientAddress,
        metaFieldName,
        metaFieldType,
        imgCapturedDate,
        metaCompanyName,
        clientLocationId
      ]);
}

DTjsonFieldsStruct createDTjsonFieldsStruct({
  String? value,
  String? fieldId,
  int? orderId,
  String? picName,
  String? valueId,
  String? fieldName,
  String? fieldType,
  String? fieldIndex,
  bool? isRequired,
  String? reportDate,
  String? companyName,
  bool? isPublished,
  String? submittedAt,
  String? defaultValue,
  String? fieldOptions,
  String? clientAddress,
  String? metaFieldName,
  String? metaFieldType,
  String? imgCapturedDate,
  String? metaCompanyName,
  String? clientLocationId,
}) =>
    DTjsonFieldsStruct(
      value: value,
      fieldId: fieldId,
      orderId: orderId,
      picName: picName,
      valueId: valueId,
      fieldName: fieldName,
      fieldType: fieldType,
      fieldIndex: fieldIndex,
      isRequired: isRequired,
      reportDate: reportDate,
      companyName: companyName,
      isPublished: isPublished,
      submittedAt: submittedAt,
      defaultValue: defaultValue,
      fieldOptions: fieldOptions,
      clientAddress: clientAddress,
      metaFieldName: metaFieldName,
      metaFieldType: metaFieldType,
      imgCapturedDate: imgCapturedDate,
      metaCompanyName: metaCompanyName,
      clientLocationId: clientLocationId,
    );
