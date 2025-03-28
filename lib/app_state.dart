import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _appDashBoardMenuIsSelected =
          prefs.getBool('ff_appDashBoardMenuIsSelected') ??
              _appDashBoardMenuIsSelected;
    });
    _safeInit(() {
      _appBuilderMenuIsSelected =
          prefs.getBool('ff_appBuilderMenuIsSelected') ??
              _appBuilderMenuIsSelected;
    });
    _safeInit(() {
      _appJobMenuIsSelected =
          prefs.getBool('ff_appJobMenuIsSelected') ?? _appJobMenuIsSelected;
    });
    _safeInit(() {
      _appTemplateMenuIsSelected =
          prefs.getBool('ff_appTemplateMenuIsSelected') ??
              _appTemplateMenuIsSelected;
    });
    _safeInit(() {
      _appNewTempateId =
          prefs.getString('ff_appNewTempateId') ?? _appNewTempateId;
    });
    _safeInit(() {
      _appIsTitleSet = prefs.getBool('ff_appIsTitleSet') ?? _appIsTitleSet;
    });
    _safeInit(() {
      _appIsANewReport =
          prefs.getBool('ff_appIsANewReport') ?? _appIsANewReport;
    });
    _safeInit(() {
      _appCurrentWeekExecutedReport = prefs
              .getStringList('ff_appCurrentWeekExecutedReport')
              ?.map((x) {
                try {
                  return ExecutedReportDtStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _appCurrentWeekExecutedReport;
    });
    _safeInit(() {
      _appAuthUserFirstName =
          prefs.getString('ff_appAuthUserFirstName') ?? _appAuthUserFirstName;
    });
    _safeInit(() {
      _appAuthUserCompanyName = prefs.getString('ff_appAuthUserCompanyName') ??
          _appAuthUserCompanyName;
    });
    _safeInit(() {
      _appAuthUserRole =
          prefs.getString('ff_appAuthUserRole') ?? _appAuthUserRole;
    });
    _safeInit(() {
      _appPageFullScreenToggle = prefs.getBool('ff_appPageFullScreenToggle') ??
          _appPageFullScreenToggle;
    });
    _safeInit(() {
      _AppGetFieldValues = prefs
              .getStringList('ff_AppGetFieldValues')
              ?.map((x) {
                try {
                  return GetFieldValuesDTStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _AppGetFieldValues;
    });
    _safeInit(() {
      _APIKEY = prefs.getString('ff_APIKEY') ?? _APIKEY;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _appClientManagementMenuIsSelected = false;
  bool get appClientManagementMenuIsSelected =>
      _appClientManagementMenuIsSelected;
  set appClientManagementMenuIsSelected(bool value) {
    _appClientManagementMenuIsSelected = value;
  }

  bool _appDashBoardMenuIsSelected = false;
  bool get appDashBoardMenuIsSelected => _appDashBoardMenuIsSelected;
  set appDashBoardMenuIsSelected(bool value) {
    _appDashBoardMenuIsSelected = value;
    prefs.setBool('ff_appDashBoardMenuIsSelected', value);
  }

  bool _appBuilderMenuIsSelected = false;
  bool get appBuilderMenuIsSelected => _appBuilderMenuIsSelected;
  set appBuilderMenuIsSelected(bool value) {
    _appBuilderMenuIsSelected = value;
    prefs.setBool('ff_appBuilderMenuIsSelected', value);
  }

  bool _appUserManIsSelected = false;
  bool get appUserManIsSelected => _appUserManIsSelected;
  set appUserManIsSelected(bool value) {
    _appUserManIsSelected = value;
  }

  bool _appJobMenuIsSelected = false;
  bool get appJobMenuIsSelected => _appJobMenuIsSelected;
  set appJobMenuIsSelected(bool value) {
    _appJobMenuIsSelected = value;
    prefs.setBool('ff_appJobMenuIsSelected', value);
  }

  bool _appTemplateMenuIsSelected = false;
  bool get appTemplateMenuIsSelected => _appTemplateMenuIsSelected;
  set appTemplateMenuIsSelected(bool value) {
    _appTemplateMenuIsSelected = value;
    prefs.setBool('ff_appTemplateMenuIsSelected', value);
  }

  String _appNewTempateId = '';
  String get appNewTempateId => _appNewTempateId;
  set appNewTempateId(String value) {
    _appNewTempateId = value;
    prefs.setString('ff_appNewTempateId', value);
  }

  bool _appIsTitleSet = false;
  bool get appIsTitleSet => _appIsTitleSet;
  set appIsTitleSet(bool value) {
    _appIsTitleSet = value;
    prefs.setBool('ff_appIsTitleSet', value);
  }

  bool _appIsANewReport = false;
  bool get appIsANewReport => _appIsANewReport;
  set appIsANewReport(bool value) {
    _appIsANewReport = value;
    prefs.setBool('ff_appIsANewReport', value);
  }

  bool _appPageDataRefreshRequested = false;
  bool get appPageDataRefreshRequested => _appPageDataRefreshRequested;
  set appPageDataRefreshRequested(bool value) {
    _appPageDataRefreshRequested = value;
  }

  List<InspectionFieldsDtStruct> _appInspectionFields = [];
  List<InspectionFieldsDtStruct> get appInspectionFields =>
      _appInspectionFields;
  set appInspectionFields(List<InspectionFieldsDtStruct> value) {
    _appInspectionFields = value;
  }

  void addToAppInspectionFields(InspectionFieldsDtStruct value) {
    appInspectionFields.add(value);
  }

  void removeFromAppInspectionFields(InspectionFieldsDtStruct value) {
    appInspectionFields.remove(value);
  }

  void removeAtIndexFromAppInspectionFields(int index) {
    appInspectionFields.removeAt(index);
  }

  void updateAppInspectionFieldsAtIndex(
    int index,
    InspectionFieldsDtStruct Function(InspectionFieldsDtStruct) updateFn,
  ) {
    appInspectionFields[index] = updateFn(_appInspectionFields[index]);
  }

  void insertAtIndexInAppInspectionFields(
      int index, InspectionFieldsDtStruct value) {
    appInspectionFields.insert(index, value);
  }

  int _appIterator = 0;
  int get appIterator => _appIterator;
  set appIterator(int value) {
    _appIterator = value;
  }

  bool _appListVisi = true;
  bool get appListVisi => _appListVisi;
  set appListVisi(bool value) {
    _appListVisi = value;
  }

  List<ExecutedReportDtStruct> _appCurrentWeekExecutedReport = [];
  List<ExecutedReportDtStruct> get appCurrentWeekExecutedReport =>
      _appCurrentWeekExecutedReport;
  set appCurrentWeekExecutedReport(List<ExecutedReportDtStruct> value) {
    _appCurrentWeekExecutedReport = value;
    prefs.setStringList('ff_appCurrentWeekExecutedReport',
        value.map((x) => x.serialize()).toList());
  }

  void addToAppCurrentWeekExecutedReport(ExecutedReportDtStruct value) {
    appCurrentWeekExecutedReport.add(value);
    prefs.setStringList('ff_appCurrentWeekExecutedReport',
        _appCurrentWeekExecutedReport.map((x) => x.serialize()).toList());
  }

  void removeFromAppCurrentWeekExecutedReport(ExecutedReportDtStruct value) {
    appCurrentWeekExecutedReport.remove(value);
    prefs.setStringList('ff_appCurrentWeekExecutedReport',
        _appCurrentWeekExecutedReport.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromAppCurrentWeekExecutedReport(int index) {
    appCurrentWeekExecutedReport.removeAt(index);
    prefs.setStringList('ff_appCurrentWeekExecutedReport',
        _appCurrentWeekExecutedReport.map((x) => x.serialize()).toList());
  }

  void updateAppCurrentWeekExecutedReportAtIndex(
    int index,
    ExecutedReportDtStruct Function(ExecutedReportDtStruct) updateFn,
  ) {
    appCurrentWeekExecutedReport[index] =
        updateFn(_appCurrentWeekExecutedReport[index]);
    prefs.setStringList('ff_appCurrentWeekExecutedReport',
        _appCurrentWeekExecutedReport.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInAppCurrentWeekExecutedReport(
      int index, ExecutedReportDtStruct value) {
    appCurrentWeekExecutedReport.insert(index, value);
    prefs.setStringList('ff_appCurrentWeekExecutedReport',
        _appCurrentWeekExecutedReport.map((x) => x.serialize()).toList());
  }

  int _appExecutedReportIterator = 0;
  int get appExecutedReportIterator => _appExecutedReportIterator;
  set appExecutedReportIterator(int value) {
    _appExecutedReportIterator = value;
  }

  List<AppFieldNamesStruct> _appReportDetailsFieldNames = [];
  List<AppFieldNamesStruct> get appReportDetailsFieldNames =>
      _appReportDetailsFieldNames;
  set appReportDetailsFieldNames(List<AppFieldNamesStruct> value) {
    _appReportDetailsFieldNames = value;
  }

  void addToAppReportDetailsFieldNames(AppFieldNamesStruct value) {
    appReportDetailsFieldNames.add(value);
  }

  void removeFromAppReportDetailsFieldNames(AppFieldNamesStruct value) {
    appReportDetailsFieldNames.remove(value);
  }

  void removeAtIndexFromAppReportDetailsFieldNames(int index) {
    appReportDetailsFieldNames.removeAt(index);
  }

  void updateAppReportDetailsFieldNamesAtIndex(
    int index,
    AppFieldNamesStruct Function(AppFieldNamesStruct) updateFn,
  ) {
    appReportDetailsFieldNames[index] =
        updateFn(_appReportDetailsFieldNames[index]);
  }

  void insertAtIndexInAppReportDetailsFieldNames(
      int index, AppFieldNamesStruct value) {
    appReportDetailsFieldNames.insert(index, value);
  }

  List<OptionsDtStruct> _appChoiceFieldOptions = [];
  List<OptionsDtStruct> get appChoiceFieldOptions => _appChoiceFieldOptions;
  set appChoiceFieldOptions(List<OptionsDtStruct> value) {
    _appChoiceFieldOptions = value;
  }

  void addToAppChoiceFieldOptions(OptionsDtStruct value) {
    appChoiceFieldOptions.add(value);
  }

  void removeFromAppChoiceFieldOptions(OptionsDtStruct value) {
    appChoiceFieldOptions.remove(value);
  }

  void removeAtIndexFromAppChoiceFieldOptions(int index) {
    appChoiceFieldOptions.removeAt(index);
  }

  void updateAppChoiceFieldOptionsAtIndex(
    int index,
    OptionsDtStruct Function(OptionsDtStruct) updateFn,
  ) {
    appChoiceFieldOptions[index] = updateFn(_appChoiceFieldOptions[index]);
  }

  void insertAtIndexInAppChoiceFieldOptions(int index, OptionsDtStruct value) {
    appChoiceFieldOptions.insert(index, value);
  }

  List<String> _appChoiceOptionsNew = [];
  List<String> get appChoiceOptionsNew => _appChoiceOptionsNew;
  set appChoiceOptionsNew(List<String> value) {
    _appChoiceOptionsNew = value;
  }

  void addToAppChoiceOptionsNew(String value) {
    appChoiceOptionsNew.add(value);
  }

  void removeFromAppChoiceOptionsNew(String value) {
    appChoiceOptionsNew.remove(value);
  }

  void removeAtIndexFromAppChoiceOptionsNew(int index) {
    appChoiceOptionsNew.removeAt(index);
  }

  void updateAppChoiceOptionsNewAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    appChoiceOptionsNew[index] = updateFn(_appChoiceOptionsNew[index]);
  }

  void insertAtIndexInAppChoiceOptionsNew(int index, String value) {
    appChoiceOptionsNew.insert(index, value);
  }

  String _appAuthUserFirstName = '';
  String get appAuthUserFirstName => _appAuthUserFirstName;
  set appAuthUserFirstName(String value) {
    _appAuthUserFirstName = value;
    prefs.setString('ff_appAuthUserFirstName', value);
  }

  String _appDataTablePageName = '';
  String get appDataTablePageName => _appDataTablePageName;
  set appDataTablePageName(String value) {
    _appDataTablePageName = value;
  }

  String _appAuthUserCompanyName = '';
  String get appAuthUserCompanyName => _appAuthUserCompanyName;
  set appAuthUserCompanyName(String value) {
    _appAuthUserCompanyName = value;
    prefs.setString('ff_appAuthUserCompanyName', value);
  }

  String _appAuthUserRole = '';
  String get appAuthUserRole => _appAuthUserRole;
  set appAuthUserRole(String value) {
    _appAuthUserRole = value;
    prefs.setString('ff_appAuthUserRole', value);
  }

  bool _appIsLoadingData = false;
  bool get appIsLoadingData => _appIsLoadingData;
  set appIsLoadingData(bool value) {
    _appIsLoadingData = value;
  }

  DateTime? _appDateFrom;
  DateTime? get appDateFrom => _appDateFrom;
  set appDateFrom(DateTime? value) {
    _appDateFrom = value;
  }

  DateTime? _appDateTo;
  DateTime? get appDateTo => _appDateTo;
  set appDateTo(DateTime? value) {
    _appDateTo = value;
  }

  bool _appDateFromSelectorVisi = false;
  bool get appDateFromSelectorVisi => _appDateFromSelectorVisi;
  set appDateFromSelectorVisi(bool value) {
    _appDateFromSelectorVisi = value;
  }

  bool _appDateToSelectorVisi = false;
  bool get appDateToSelectorVisi => _appDateToSelectorVisi;
  set appDateToSelectorVisi(bool value) {
    _appDateToSelectorVisi = value;
  }

  bool _appPageFullScreenToggle = false;
  bool get appPageFullScreenToggle => _appPageFullScreenToggle;
  set appPageFullScreenToggle(bool value) {
    _appPageFullScreenToggle = value;
    prefs.setBool('ff_appPageFullScreenToggle', value);
  }

  List<GetFieldValuesDTStruct> _AppGetFieldValues = [];
  List<GetFieldValuesDTStruct> get AppGetFieldValues => _AppGetFieldValues;
  set AppGetFieldValues(List<GetFieldValuesDTStruct> value) {
    _AppGetFieldValues = value;
    prefs.setStringList(
        'ff_AppGetFieldValues', value.map((x) => x.serialize()).toList());
  }

  void addToAppGetFieldValues(GetFieldValuesDTStruct value) {
    AppGetFieldValues.add(value);
    prefs.setStringList('ff_AppGetFieldValues',
        _AppGetFieldValues.map((x) => x.serialize()).toList());
  }

  void removeFromAppGetFieldValues(GetFieldValuesDTStruct value) {
    AppGetFieldValues.remove(value);
    prefs.setStringList('ff_AppGetFieldValues',
        _AppGetFieldValues.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromAppGetFieldValues(int index) {
    AppGetFieldValues.removeAt(index);
    prefs.setStringList('ff_AppGetFieldValues',
        _AppGetFieldValues.map((x) => x.serialize()).toList());
  }

  void updateAppGetFieldValuesAtIndex(
    int index,
    GetFieldValuesDTStruct Function(GetFieldValuesDTStruct) updateFn,
  ) {
    AppGetFieldValues[index] = updateFn(_AppGetFieldValues[index]);
    prefs.setStringList('ff_AppGetFieldValues',
        _AppGetFieldValues.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInAppGetFieldValues(
      int index, GetFieldValuesDTStruct value) {
    AppGetFieldValues.insert(index, value);
    prefs.setStringList('ff_AppGetFieldValues',
        _AppGetFieldValues.map((x) => x.serialize()).toList());
  }

  String _APIKEY =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ2Zm96bmhhZXBnZ2J5eWtrb2VhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjI1NzIyMDUsImV4cCI6MjAzODE0ODIwNX0.gTkzwmWjjrr3s5GxRBIiahlyaj2iqp3_Y0NOUsZceaA';
  String get APIKEY => _APIKEY;
  set APIKEY(String value) {
    _APIKEY = value;
    prefs.setString('ff_APIKEY', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
