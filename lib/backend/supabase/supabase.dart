import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

String _kSupabaseUrl = 'https://fvfoznhaepggbyykkoea.supabase.co';
String _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ2Zm96bmhhZXBnZ2J5eWtrb2VhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjI1NzIyMDUsImV4cCI6MjAzODE0ODIwNX0.gTkzwmWjjrr3s5GxRBIiahlyaj2iqp3_Y0NOUsZceaA';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
        authOptions:
            FlutterAuthClientOptions(authFlowType: AuthFlowType.implicit),
      );
}
