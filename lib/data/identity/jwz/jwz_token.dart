import 'dart:typed_data';

import 'package:polygonid_flutter_sdk/data/identity/jwz/jwz.dart';
import 'package:polygonid_flutter_sdk/data/identity/jwz/jwz_exceptions.dart';
import 'package:polygonid_flutter_sdk/data/identity/jwz/jwz_proof.dart';
import 'package:polygonid_flutter_sdk/utils/base_64.dart';

/// Prove and verify a [JWZToken]
abstract class JWZProver {
  String alg;
  String circuitID;

  Future<bool> verify(
      Uint8List hash, JWZProof proof, Uint8List verificationKey);

  Future<JWZProof> prove(
      Uint8List inputs, Uint8List provingKey, Uint8List wasm);

  JWZProver({required this.alg, required this.circuitID});
}

/// Prepare circuit inputs
abstract class JWZInputPreparer {
  Future<Uint8List> prepare(Uint8List hash, String circuitID);
}

/// Representation of a JWZ Token with [JWZProver] and [JWZInputPreparer]
/// Wrapper around [JWZ]
class JWZToken implements Base64Encoder {
  late JWZ jwz;

  JWZToken();

  /// Construct a [JWZToken] with [JWZ]
  factory JWZToken.withJWZ({required JWZ jwz}) {
    JWZToken token = JWZToken();
    token.jwz = jwz;

    return token;
  }

  /// Construct a [JWZToken] with payload
  factory JWZToken.withPayload({required dynamic payload}) {
    return JWZToken.withJWZ(jwz: JWZ(payload: JWZPayload(payload: payload)));
  }

  /// Construct a [JWZToken] from a Base64 string
  factory JWZToken.fromBase64({required String data}) {
    return JWZToken.withJWZ(jwz: JWZ.fromBase64(data));
  }

  //
  // /// Prove and set [JWZToken.proof]
  // /// Returns compacted [JWZ]
  // Future<String> prove(Uint8List provingKey, Uint8List wasm) async {
  //   Uint8List prepared = await preparer.prepare(_getHash(), circuitID);
  //   jwz.proof = await prover.prove(prepared, provingKey, wasm);
  //
  //   return encode();
  // }
  //
  // /// Verify [JWZ]
  // /// Returns true if valid
  // Future<bool> verify(Uint8List verificationKey) {
  //   if (jwz.proof == null) {
  //     throw NullJWZProofException();
  //   }
  //
  //   return prover.verify(_getHash(), jwz.proof!, verificationKey);
  // }
  //
  // Uint8List _getHash() {
  //   if (jwz.header == null) {
  //     throw NullJWZHeaderException();
  //   }
  //
  //   if (jwz.payload == null) {
  //     throw NullJWZPayloadException();
  //   }
  //
  //   // Sha256
  //   Uint8List sha = Uint8List.fromList(sha256
  //       .convert(Uint8ArrayUtils.uint8ListfromString(
  //       "${jwz.header!.encode()}.${jwz.payload!.encode()}"))
  //       .bytes);
  //
  //   // Endianness
  //   BigInt endian = Uint8ArrayUtils.leBuff2int(sha);
  //
  //   // Check Q
  //   BigInt q = endian.qNormalize();
  //
  //   // Poseidon hash
  //   String hashed = _circom.poseidonHash(q.toString());
  //
  //   return hexToBytes(hashed);
  // }

  /// Returns compact [JWT]
  @override
  String encode() {
    if (jwz.header == null) {
      throw NullJWZHeaderException();
    }

    if (jwz.payload == null) {
      throw NullJWZPayloadException();
    }

    if (jwz.proof == null) {
      throw NullJWZProofException();
    }

    return jwz.encode();
  }
}
