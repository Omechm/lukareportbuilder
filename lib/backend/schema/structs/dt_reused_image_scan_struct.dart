// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtReusedImageScanStruct extends BaseStruct {
  DtReusedImageScanStruct({
    String? cso,
    String? location,
    String? reportdate,
    String? imageoriginaldate,
    String? fieldname,
  })  : _cso = cso,
        _location = location,
        _reportdate = reportdate,
        _imageoriginaldate = imageoriginaldate,
        _fieldname = fieldname;

  // "cso" field.
  String? _cso;
  String get cso => _cso ?? '';
  set cso(String? val) => _cso = val;

  bool hasCso() => _cso != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "reportdate" field.
  String? _reportdate;
  String get reportdate => _reportdate ?? '';
  set reportdate(String? val) => _reportdate = val;

  bool hasReportdate() => _reportdate != null;

  // "imageoriginaldate" field.
  String? _imageoriginaldate;
  String get imageoriginaldate => _imageoriginaldate ?? '';
  set imageoriginaldate(String? val) => _imageoriginaldate = val;

  bool hasImageoriginaldate() => _imageoriginaldate != null;

  // "fieldname" field.
  String? _fieldname;
  String get fieldname => _fieldname ?? '';
  set fieldname(String? val) => _fieldname = val;

  bool hasFieldname() => _fieldname != null;

  static DtReusedImageScanStruct fromMap(Map<String, dynamic> data) =>
      DtReusedImageScanStruct(
        cso: data['cso'] as String?,
        location: data['location'] as String?,
        reportdate: data['reportdate'] as String?,
        imageoriginaldate: data['imageoriginaldate'] as String?,
        fieldname: data['fieldname'] as String?,
      );

  static DtReusedImageScanStruct? maybeFromMap(dynamic data) => data is Map
      ? DtReusedImageScanStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'cso': _cso,
        'location': _location,
        'reportdate': _reportdate,
        'imageoriginaldate': _imageoriginaldate,
        'fieldname': _fieldname,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cso': serializeParam(
          _cso,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'reportdate': serializeParam(
          _reportdate,
          ParamType.String,
        ),
        'imageoriginaldate': serializeParam(
          _imageoriginaldate,
          ParamType.String,
        ),
        'fieldname': serializeParam(
          _fieldname,
          ParamType.String,
        ),
      }.withoutNulls;

  static DtReusedImageScanStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DtReusedImageScanStruct(
        cso: deserializeParam(
          data['cso'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        reportdate: deserializeParam(
          data['reportdate'],
          ParamType.String,
          false,
        ),
        imageoriginaldate: deserializeParam(
          data['imageoriginaldate'],
          ParamType.String,
          false,
        ),
        fieldname: deserializeParam(
          data['fieldname'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DtReusedImageScanStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtReusedImageScanStruct &&
        cso == other.cso &&
        location == other.location &&
        reportdate == other.reportdate &&
        imageoriginaldate == other.imageoriginaldate &&
        fieldname == other.fieldname;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([cso, location, reportdate, imageoriginaldate, fieldname]);
}

DtReusedImageScanStruct createDtReusedImageScanStruct({
  String? cso,
  String? location,
  String? reportdate,
  String? imageoriginaldate,
  String? fieldname,
}) =>
    DtReusedImageScanStruct(
      cso: cso,
      location: location,
      reportdate: reportdate,
      imageoriginaldate: imageoriginaldate,
      fieldname: fieldname,
    );
