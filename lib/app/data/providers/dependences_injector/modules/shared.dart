import 'package:credit_simulation/app/data/providers/dependences_injector/index.dart';
import 'package:dio/dio.dart';

import '../../http/http_client.dart';

void setupSharedInjections() {
  DependencesInjector.registerFactory<LogInterceptor>(
      () => LogInterceptor(requestBody: true, responseBody: true));
  DependencesInjector.registerFactory<Dio>(() => Dio());

  DependencesInjector.registerFactory<HttpClient>(() {
    return HttpClientImpl(
      DependencesInjector.get<Dio>(),
      'https://api.rispar.com.br',
      [
        DependencesInjector.get<LogInterceptor>(),
      ],
    );
  });
}
