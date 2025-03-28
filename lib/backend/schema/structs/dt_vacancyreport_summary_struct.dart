// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtVacancyreportSummaryStruct extends BaseStruct {
  DtVacancyreportSummaryStruct({
    String? location,
    String? nameofguard,
    String? phonenumber,
    String? supoincharge,
    int? vacancyperiod,
    String? meansofexit,
    String? remark,
  })  : _location = location,
        _nameofguard = nameofguard,
        _phonenumber = phonenumber,
        _supoincharge = supoincharge,
        _vacancyperiod = vacancyperiod,
        _meansofexit = meansofexit,
        _remark = remark;

  // "LOCATION" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "NAMEOFGUARD" field.
  String? _nameofguard;
  String get nameofguard => _nameofguard ?? '';
  set nameofguard(String? val) => _nameofguard = val;

  bool hasNameofguard() => _nameofguard != null;

  // "PHONENUMBER" field.
  String? _phonenumber;
  String get phonenumber => _phonenumber ?? '';
  set phonenumber(String? val) => _phonenumber = val;

  bool hasPhonenumber() => _phonenumber != null;

  // "SUPOINCHARGE" field.
  String? _supoincharge;
  String get supoincharge => _supoincharge ?? '';
  set supoincharge(String? val) => _supoincharge = val;

  bool hasSupoincharge() => _supoincharge != null;

  // "VACANCYPERIOD" field.
  int? _vacancyperiod;
  int get vacancyperiod => _vacancyperiod ?? 0;
  set vacancyperiod(int? val) => _vacancyperiod = val;

  void incrementVacancyperiod(int amount) =>
      vacancyperiod = vacancyperiod + amount;

  bool hasVacancyperiod() => _vacancyperiod != null;

  // "MEANSOFEXIT" field.
  String? _meansofexit;
  String get meansofexit => _meansofexit ?? '';
  set meansofexit(String? val) => _meansofexit = val;

  bool hasMeansofexit() => _meansofexit != null;

  // "REMARK" field.
  String? _remark;
  String get remark => _remark ?? '';
  set remark(String? val) => _remark = val;

  bool hasRemark() => _remark != null;

  static DtVacancyreportSummaryStruct fromMap(Map<String, dynamic> data) =>
      DtVacancyreportSummaryStruct(
        location: data['LOCATION'] as String?,
        nameofguard: data['NAMEOFGUARD'] as String?,
        phonenumber: data['PHONENUMBER'] as String?,
        supoincharge: data['SUPOINCHARGE'] as String?,
        vacancyperiod: castToType<int>(data['VACANCYPERIOD']),
        meansofexit: data['MEANSOFEXIT'] as String?,
        remark: data['REMARK'] as String?,
      );

  static DtVacancyreportSummaryStruct? maybeFromMap(dynamic data) => data is Map
      ? DtVacancyreportSummaryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'LOCATION': _location,
        'NAMEOFGUARD': _nameofguard,
        'PHONENUMBER': _phonenumber,
        'SUPOINCHARGE': _supoincharge,
        'VACANCYPERIOD': _vacancyperiod,
        'MEANSOFEXIT': _meansofexit,
        'REMARK': _remark,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'LOCATION': serializeParam(
          _location,
          ParamType.String,
        ),
        'NAMEOFGUARD': serializeParam(
          _nameofguard,
          ParamType.String,
        ),
        'PHONENUMBER': serializeParam(
          _phonenumber,
          ParamType.String,
        ),
        'SUPOINCHARGE': serializeParam(
          _supoincharge,
          ParamType.String,
        ),
        'VACANCYPERIOD': serializeParam(
          _vacancyperiod,
          ParamType.int,
        ),
        'MEANSOFEXIT': serializeParam(
          _meansofexit,
          ParamType.String,
        ),
        'REMARK': serializeParam(
          _remark,
          ParamType.String,
        ),
      }.withoutNulls;

  static DtVacancyreportSummaryStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DtVacancyreportSummaryStruct(
        location: deserializeParam(
          data['LOCATION'],
          ParamType.String,
          false,
        ),
        nameofguard: deserializeParam(
          data['NAMEOFGUARD'],
          ParamType.String,
          false,
        ),
        phonenumber: deserializeParam(
          data['PHONENUMBER'],
          ParamType.String,
          false,
        ),
        supoincharge: deserializeParam(
          data['SUPOINCHARGE'],
          ParamType.String,
          false,
        ),
        vacancyperiod: deserializeParam(
          data['VACANCYPERIOD'],
          ParamType.int,
          false,
        ),
        meansofexit: deserializeParam(
          data['MEANSOFEXIT'],
          ParamType.String,
          false,
        ),
        remark: deserializeParam(
          data['REMARK'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DtVacancyreportSummaryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtVacancyreportSummaryStruct &&
        location == other.location &&
        nameofguard == other.nameofguard &&
        phonenumber == other.phonenumber &&
        supoincharge == other.supoincharge &&
        vacancyperiod == other.vacancyperiod &&
        meansofexit == other.meansofexit &&
        remark == other.remark;
  }

  @override
  int get hashCode => const ListEquality().hash([
        location,
        nameofguard,
        phonenumber,
        supoincharge,
        vacancyperiod,
        meansofexit,
        remark
      ]);
}

DtVacancyreportSummaryStruct createDtVacancyreportSummaryStruct({
  String? location,
  String? nameofguard,
  String? phonenumber,
  String? supoincharge,
  int? vacancyperiod,
  String? meansofexit,
  String? remark,
}) =>
    DtVacancyreportSummaryStruct(
      location: location,
      nameofguard: nameofguard,
      phonenumber: phonenumber,
      supoincharge: supoincharge,
      vacancyperiod: vacancyperiod,
      meansofexit: meansofexit,
      remark: remark,
    );
