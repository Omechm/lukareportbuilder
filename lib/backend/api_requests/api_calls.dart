import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetAggregatedNoCompliantTasksCall {
  static Future<ApiCallResponse> call({
    String? startDate = '2025-02-01',
    String? endDate = '2025-12-31',
    String? companyName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "start_date_str": "${escapeStringForJson(startDate)}",
  "end_date_str": "${escapeStringForJson(endDate)}",
  "param_company_name": "${escapeStringForJson(companyName)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetAggregatedNoCompliantTasks',
      apiUrl:
          'https://fvfoznhaepggbyykkoea.supabase.co/rest/v1/rpc/get_aggregated_non_compliant_tasks',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ2Zm96bmhhZXBnZ2J5eWtrb2VhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjI1NzIyMDUsImV4cCI6MjAzODE0ODIwNX0.gTkzwmWjjrr3s5GxRBIiahlyaj2iqp3_Y0NOUsZceaA',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ2Zm96bmhhZXBnZ2J5eWtrb2VhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjI1NzIyMDUsImV4cCI6MjAzODE0ODIwNX0.gTkzwmWjjrr3s5GxRBIiahlyaj2iqp3_Y0NOUsZceaA',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? location(dynamic response) => (getJsonField(
        response,
        r'''$[:].location''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? count(dynamic response) => (getJsonField(
        response,
        r'''$[:].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class GetFieldValuesCall {
  static Future<ApiCallResponse> call({
    String? startDate = '2025-02-15',
    String? endDate = '2025-02-15',
    String? companyName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "start_date": "${escapeStringForJson(startDate)}",
  "end_date": "${escapeStringForJson(endDate)}",
  "param_company_name": "${escapeStringForJson(companyName)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetFieldValues',
      apiUrl:
          'https://fvfoznhaepggbyykkoea.supabase.co/rest/v1/rpc/get_field_values',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ2Zm96bmhhZXBnZ2J5eWtrb2VhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjI1NzIyMDUsImV4cCI6MjAzODE0ODIwNX0.gTkzwmWjjrr3s5GxRBIiahlyaj2iqp3_Y0NOUsZceaA',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ2Zm96bmhhZXBnZ2J5eWtrb2VhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjI1NzIyMDUsImV4cCI6MjAzODE0ODIwNX0.gTkzwmWjjrr3s5GxRBIiahlyaj2iqp3_Y0NOUsZceaA',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? reportdate(dynamic response) => (getJsonField(
        response,
        r'''$[:].report_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? fieldname(dynamic response) => (getJsonField(
        response,
        r'''$[:].field_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? value(dynamic response) => (getJsonField(
        response,
        r'''$[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].full_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? location(dynamic response) => (getJsonField(
        response,
        r'''$[:].client_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetExecutedTasksDyDateRangeCall {
  static Future<ApiCallResponse> call({
    String? startDate = '2025-02-17',
    String? endDate = '2025-02-17',
    String? companyName = 'Sonafem',
  }) async {
    final ffApiRequestBody = '''
{
  "start_date": "${escapeStringForJson(startDate)}",
  "end_date": "${escapeStringForJson(endDate)}",
  "param_company_name": "${escapeStringForJson(companyName)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetExecutedTasksDyDateRange',
      apiUrl:
          'https://fvfoznhaepggbyykkoea.supabase.co/rest/v1/rpc/get_executed_tasks_by_date_range',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ2Zm96bmhhZXBnZ2J5eWtrb2VhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjI1NzIyMDUsImV4cCI6MjAzODE0ODIwNX0.gTkzwmWjjrr3s5GxRBIiahlyaj2iqp3_Y0NOUsZceaA',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ2Zm96bmhhZXBnZ2J5eWtrb2VhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjI1NzIyMDUsImV4cCI6MjAzODE0ODIwNX0.gTkzwmWjjrr3s5GxRBIiahlyaj2iqp3_Y0NOUsZceaA',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetExecutionPercentageCall {
  static Future<ApiCallResponse> call({
    String? supabaseKey = '',
    String? startDate = '',
    String? endDate = '',
    String? companyName = '',
    String? jwt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "start_date": "${escapeStringForJson(startDate)}",
  "end_date": "${escapeStringForJson(endDate)}",
  "company_name_param": "${escapeStringForJson(companyName)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetExecutionPercentage',
      apiUrl:
          'https://fvfoznhaepggbyykkoea.supabase.co/rest/v1/rpc/get_execution_percentage',
      callType: ApiCallType.POST,
      headers: {
        'apikey': '${supabaseKey}',
        'Authorization': 'Bearer ${jwt}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? client(dynamic response) => (getJsonField(
        response,
        r'''$[:].client_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? percentage(dynamic response) => (getJsonField(
        response,
        r'''$[:].execution_percentage''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
}

class GetClientsWithoutTaskCall {
  static Future<ApiCallResponse> call({
    String? supabaseKey = '',
    String? companyName = 'Sonafem',
    String? jwt = '',
    String? taskName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "company_name_param": "${escapeStringForJson(companyName)}",
  "task_name": "${escapeStringForJson(taskName)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetClientsWithoutTask',
      apiUrl:
          'https://fvfoznhaepggbyykkoea.supabase.co/rest/v1/rpc/get_clients_without_task',
      callType: ApiCallType.POST,
      headers: {
        'apikey': '${supabaseKey}',
        'Authorization': 'Bearer ${jwt}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
