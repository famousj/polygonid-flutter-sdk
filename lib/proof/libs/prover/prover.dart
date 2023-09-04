import 'dart:convert';
import 'dart:ffi' as ffi;
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:polygonid_flutter_sdk/common/domain/domain_logger.dart';

import 'native_prover.dart';

@injectable
class ProverLib {
  static NativeProverLib get _nativeProverLib {
    return Platform.isAndroid
        ? NativeProverLib(ffi.DynamicLibrary.open("librapidsnark.so"))
        : NativeProverLib(ffi.DynamicLibrary.process());
  }

  ProverLib();

  Future<Map<String, dynamic>?> prove(
      String circuitId, Uint8List zkeyBytes, Uint8List wtnsBytes) async {
    Map<String, dynamic> map = {};

    Stopwatch stopwatch = Stopwatch()..start();
    print("[Prover] stopwatch started");

    int zkeySize = zkeyBytes.length;
    print("[Prover] stopwatch started");
    ffi.Pointer<ffi.Char> zkeyBuffer = malloc<ffi.Char>(zkeySize);
    print("[Prover] zkeyBuffer ${stopwatch.elapsedMilliseconds}");
    final data = zkeyBytes;
    for (int i = 0; i < zkeySize; i++) {
      zkeyBuffer[i] = data[i];
    }
    print("[Prover] zkeyBuffer ${stopwatch.elapsedMilliseconds}");

    int wtnsSize = wtnsBytes.length;
    ffi.Pointer<ffi.Char> wtnsBuffer = malloc<ffi.Char>(wtnsSize);
    final data2 = wtnsBytes.buffer.asUint8List();
    print("[Prover] wtnsBuffer ${stopwatch.elapsedMilliseconds}");
    for (int i = 0; i < wtnsSize; i++) {
      wtnsBuffer[i] = data2[i];
    }
    print("[Prover] wtnsBuffer ${stopwatch.elapsedMilliseconds}");

    ffi.Pointer<ffi.UnsignedLong> proofSize = malloc<ffi.UnsignedLong>();
    proofSize.value = 16384;
    ffi.Pointer<ffi.Char> proofBuffer = malloc<ffi.Char>(proofSize.value);
    print("[Prover] proofBuffer ${stopwatch.elapsedMilliseconds}");
    ffi.Pointer<ffi.UnsignedLong> publicSize = malloc<ffi.UnsignedLong>();
    publicSize.value = 16384;
    ffi.Pointer<ffi.Char> publicBuffer = malloc<ffi.Char>(publicSize.value);
    print("[Prover] publicBuffer ${stopwatch.elapsedMilliseconds}");
    int errorMaxSize = 256;
    ffi.Pointer<ffi.Char> errorMsg = malloc<ffi.Char>(errorMaxSize);

    DateTime start = DateTime.now();
    print("[Prover] start ${stopwatch.elapsedMilliseconds}");

    int result = _nativeProverLib.groth16_prover(
        zkeyBuffer.cast(),
        zkeySize,
        wtnsBuffer.cast(),
        wtnsSize,
        proofBuffer,
        proofSize,
        publicBuffer,
        publicSize,
        errorMsg,
        errorMaxSize);

    print("[Prover] end ${stopwatch.elapsedMilliseconds}");

    DateTime end = DateTime.now();

    int time = end.difference(start).inMicroseconds;

    if (result == PRPOVER_OK) {
      ffi.Pointer<Utf8> jsonString = proofBuffer.cast<Utf8>();
      String proofmsg = jsonString.toDartString();
      print("[Prover] proofmsg ${stopwatch.elapsedMilliseconds}");

      ffi.Pointer<Utf8> jsonString2 = publicBuffer.cast<Utf8>();
      String publicmsg = jsonString2.toDartString();
      print("[Prover] publicmsg ${stopwatch.elapsedMilliseconds}");

      //print("Proof: $proofmsg");
      //print("Public: $publicmsg");
      //print("Time: $time");

      map['circuitId'] = circuitId;
      map['proof'] = json.decode(proofmsg);
      (map['proof'] as Map<String, dynamic>)
          .putIfAbsent("curve", () => "bn128");
      map['pub_signals'] = json.decode(publicmsg).cast<String>();
      return map;
    } else if (result == PPROVER_ERROR) {
      ffi.Pointer<Utf8> jsonString = errorMsg.cast<Utf8>();
      String errormsg = jsonString.toDartString();

      print("$result: ${result.toString()}. Error: $errormsg");
    } else if (result == PPROVER_ERROR_SHORT_BUFFER) {
      print(
          "$result: ${result.toString()}. Error: Short buffer for proof or public");
    }

    return null;
  }
}
