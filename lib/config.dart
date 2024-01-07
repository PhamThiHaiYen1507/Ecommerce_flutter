import 'base/app_config/app_config.dart';

void setAppDevelopment() {
  AppConfig(
    env: ENV.DEV,
    baseUrl: 'api.escuelajs.co',
    secure: true,
    fetchCount: 20,
  );
}
