import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:simpson_app/core/services/dio/config_client.dart';

class ServiceLocator {
  static final GetIt sl = GetIt.instance;

  static Future<void> init() async {
    sl.registerSingleton<Dio>(ConfigClient().client);
  }
}
