// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActionListItemStruct extends BaseStruct {
  ActionListItemStruct({
    String? actionname,
  }) : _actionname = actionname;

  // "actionname" field.
  String? _actionname;
  String get actionname => _actionname ?? '';
  set actionname(String? val) => _actionname = val;

  bool hasActionname() => _actionname != null;

  static ActionListItemStruct fromMap(Map<String, dynamic> data) =>
      ActionListItemStruct(
        actionname: data['actionname'] as String?,
      );

  static ActionListItemStruct? maybeFromMap(dynamic data) => data is Map
      ? ActionListItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'actionname': _actionname,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'actionname': serializeParam(
          _actionname,
          ParamType.String,
        ),
      }.withoutNulls;

  static ActionListItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      ActionListItemStruct(
        actionname: deserializeParam(
          data['actionname'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ActionListItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ActionListItemStruct && actionname == other.actionname;
  }

  @override
  int get hashCode => const ListEquality().hash([actionname]);
}

ActionListItemStruct createActionListItemStruct({
  String? actionname,
}) =>
    ActionListItemStruct(
      actionname: actionname,
    );
