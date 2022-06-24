import 'package:credit_simulation/app/data/models/simulation_request.dart';
import 'package:credit_simulation/app/data/models/simulation_response.dart';

import '../providers/http/http_client.dart';

abstract class CreditSimulationRepository {
  Future<SimulationResponse> createSimulation(
      SimulationRequest simulationRequest);
}

class CreditSimulationRepositoryImpl implements CreditSimulationRepository {
  const CreditSimulationRepositoryImpl(this._client);

  final HttpClient _client;

  @override
  Future<SimulationResponse> createSimulation(
      SimulationRequest simulationRequest) async {
    final response = await _client.post(
      '/acquisition/simulation',
      body: simulationRequest.toJson(),
      contentType: CustomContentType.applicationJson,
    );

    return SimulationResponse.fromJson(response.data);
  }
}
