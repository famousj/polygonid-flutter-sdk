import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:polygonid_flutter_sdk/common/infrastructure/stacktrace_stream_manager.dart';
import 'package:polygonid_flutter_sdk/iden3comm/domain/use_cases/get_auth_inputs_use_case.dart';
import 'package:polygonid_flutter_sdk/iden3comm/domain/use_cases/get_auth_challenge_use_case.dart';
import 'package:polygonid_flutter_sdk/iden3comm/domain/use_cases/get_jwz_use_case.dart';
import 'package:polygonid_flutter_sdk/proof/domain/entities/zkproof_entity.dart';
import 'package:polygonid_flutter_sdk/proof/domain/use_cases/load_circuit_use_case.dart';
import 'package:polygonid_flutter_sdk/proof/domain/use_cases/prove_use_case.dart';

import '../../../common/domain/domain_logger.dart';
import '../../../common/domain/use_case.dart';
import '../../../proof/domain/entities/circuit_data_entity.dart';

class GetAuthTokenParam {
  final String genesisDid;
  final BigInt profileNonce;
  final String privateKey;
  final String message;

  GetAuthTokenParam({
    required this.genesisDid,
    required this.profileNonce,
    required this.privateKey,
    required this.message,
  });
}

class GetAuthTokenUseCase extends FutureUseCase<GetAuthTokenParam, String> {
  final LoadCircuitUseCase _loadCircuitUseCase;
  final GetJWZUseCase _getJWZUseCase;
  final GetAuthChallengeUseCase _getAuthChallengeUseCase;
  final GetAuthInputsUseCase _getAuthInputsUseCase;
  final ProveUseCase _proveUseCase;
  final StacktraceManager _stacktraceManager;

  GetAuthTokenUseCase(
    this._loadCircuitUseCase,
    this._getJWZUseCase,
    this._getAuthChallengeUseCase,
    this._getAuthInputsUseCase,
    this._proveUseCase,
    this._stacktraceManager,
  );

  @override
  Future<String> execute({required GetAuthTokenParam param}) async {
    Stopwatch stopwatch = Stopwatch()..start();

    try {
      // get jwz
      Stopwatch stopwatchjwz = Stopwatch()..start();
      String jwz = await _getJWZUseCase.execute(param: GetJWZParam(message: param.message));
      // get auth challenge
      String challenge = await _getAuthChallengeUseCase.execute(param: jwz);
      print("[GetAuthTokenUseCase] jwz + challenge -------->>>>: ${stopwatchjwz.elapsed}");

      // get auth inputs
      // Uint8List? authInputs = null;
      Uint8List authInputs = await  _getAuthInputsUseCase.execute(param: GetAuthInputsParam(challenge, param.genesisDid, param.profileNonce, param.privateKey));
      print("[GetAuthTokenUseCase] authInputs -------->>>>: ${stopwatchjwz.elapsed}");
      // load circuit
      // CircuitDataEntity? circuitDataEntity = null;
      CircuitDataEntity circuitDataEntity = await _loadCircuitUseCase.execute(param: "authV2");

      // List responses = await Future.wait([authInputsF, circuitDataEntityF]);
      // authInputs = responses[0];
      // circuitDataEntity = responses[1];
      print("[GetAuthTokenUseCase] circuitDataEntity -------->>>>: ${stopwatchjwz.elapsed}");

      // prove
      ZKProofEntity proof = await _proveUseCase.execute(param: ProveParam(authInputs!, circuitDataEntity!,),);
      // get authToken
      Future<String> authToken =  _getJWZUseCase.execute(param: GetJWZParam(message: param.message, proof: proof));

      // final stopwatchAuth = Stopwatch()
      //   ..start();
      // print(
      //     "[GetAuthTokenUseCase] started _getAuthInputsUseCase -------->>>>:");
      //
      // Uint8List? authInputs = null;
      // Future<Uint8List> authInputsF = _getAuthInputsUseCase.execute(param: GetAuthInputsParam(challenge, param.genesisDid, param.profileNonce, param.privateKey));
      // CircuitDataEntity? circuitDataEntity = null;
      // Future<CircuitDataEntity> circuitDataEntityF = _loadCircuitUseCase.execute(param: "authV2");
      //
      // print(
      //     "[GetAuthTokenUseCase] started _getAuthInputsUseCase -------->>>>: ${stopwatchAuth.elapsed}");
      //
      // List responses = await Future.wait([authInputsF, circuitDataEntityF]);
      //
      // authInputs = responses[0];
      // circuitDataEntity = responses[1];
      // stopwatchAuth.stop();
      //
      // print('[GetAuthTokenUseCase] ended _getAuthInputsUseCase -------->>>>:: ${stopwatchAuth.elapsed}');


      if (kDebugMode) {
        print(
            "[GetAuthTokenUseCase] after _getJWZUseCase stopWatch: ${stopwatch.elapsed}");
      }
      return authToken;
    } catch (error) {
      logger().e("[GetAuthTokenUseCase] Error: $error");
      _stacktraceManager.addTrace("[GetAuthTokenUseCase] Error: $error");
      _stacktraceManager.addError("[GetAuthTokenUseCase] Error: $error");
      rethrow;
    }

    return _getJWZUseCase
        .execute(param: GetJWZParam(message: param.message))
        .then((encoded) {
      if (kDebugMode) {
        print(
            "[GetAuthTokenUseCase] after getJWZUseCase stopWatch: ${stopwatch.elapsedMilliseconds}");
      }
      return _getAuthChallengeUseCase.execute(param: encoded);
    }).then((challenge) {
      if (kDebugMode) {
        print(
            "[GetAuthTokenUseCase] after _getAuthChallengeUseCase stopWatch: ${stopwatch.elapsedMilliseconds}");
      }
      return Future.wait([
        _getAuthInputsUseCase.execute(
            param: GetAuthInputsParam(challenge, param.genesisDid,
                param.profileNonce, param.privateKey)),
        _loadCircuitUseCase.execute(param: "authV2")
      ]);
    }).then((values) {
      if (kDebugMode) {
        print(
            "[GetAuthTokenUseCase] after _getAuthInputsUseCase/_loadCircuit stopWatch: ${stopwatch.elapsedMilliseconds}");
      }
      return _proveUseCase.execute(
          param: ProveParam(
              values[0] as Uint8List, values[1] as CircuitDataEntity));
    }).then((proof) {
      if (kDebugMode) {
        print(
            "[GetAuthTokenUseCase] after _proveUseCase stopWatch: ${stopwatch.elapsedMilliseconds}");
      }
      return _getJWZUseCase.execute(
          param: GetJWZParam(message: param.message, proof: proof));
    }).then((token) {
      if (kDebugMode) {
        print(
            "[GetAuthTokenUseCase] after _getJWZUseCase stopWatch: ${stopwatch.elapsedMilliseconds}");
      }
      logger().i("[GetAuthTokenUseCase] Message $param Auth token: $token");
      _stacktraceManager
          .addTrace("[GetAuthTokenUseCase] Message $param Auth token: $token");
      return token;
    }).catchError((error) {
      logger().e("[GetAuthTokenUseCase] Error: $error");
      _stacktraceManager.addTrace("[GetAuthTokenUseCase] Error: $error");
      _stacktraceManager.addError("[GetAuthTokenUseCase] Error: $error");
      throw error;
    });
  }
}
