// Mocks generated by Mockito 5.3.2 from annotations
// in polygonid_flutter_sdk/test/domain/use_cases/export_identity_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:mockito/mockito.dart' as _i1;
import 'package:polygonid_flutter_sdk/identity/domain/entities/did_entity.dart'
    as _i8;
import 'package:polygonid_flutter_sdk/identity/domain/entities/identity_entity.dart'
    as _i3;
import 'package:polygonid_flutter_sdk/identity/domain/entities/node_entity.dart'
    as _i5;
import 'package:polygonid_flutter_sdk/identity/domain/entities/private_identity_entity.dart'
    as _i2;
import 'package:polygonid_flutter_sdk/identity/domain/entities/rhs_node_entity.dart'
    as _i4;
import 'package:polygonid_flutter_sdk/identity/domain/repositories/identity_repository.dart'
    as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePrivateIdentityEntity_0 extends _i1.SmartFake
    implements _i2.PrivateIdentityEntity {
  _FakePrivateIdentityEntity_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIdentityEntity_1 extends _i1.SmartFake
    implements _i3.IdentityEntity {
  _FakeIdentityEntity_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRhsNodeEntity_2 extends _i1.SmartFake implements _i4.RhsNodeEntity {
  _FakeRhsNodeEntity_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeNodeEntity_3 extends _i1.SmartFake implements _i5.NodeEntity {
  _FakeNodeEntity_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IdentityRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIdentityRepository extends _i1.Mock
    implements _i6.IdentityRepository {
  MockIdentityRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<void> checkIdentityValidity({
    required String? secret,
    required String? accessMessage,
    required dynamic blockchain,
    required dynamic network,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #checkIdentityValidity,
          [],
          {
            #secret: secret,
            #accessMessage: accessMessage,
            #blockchain: blockchain,
            #network: network,
          },
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<_i2.PrivateIdentityEntity> createIdentity({
    String? secret,
    required String? accessMessage,
    required dynamic blockchain,
    required dynamic network,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #createIdentity,
          [],
          {
            #secret: secret,
            #accessMessage: accessMessage,
            #blockchain: blockchain,
            #network: network,
          },
        ),
        returnValue: _i7.Future<_i2.PrivateIdentityEntity>.value(
            _FakePrivateIdentityEntity_0(
          this,
          Invocation.method(
            #createIdentity,
            [],
            {
              #secret: secret,
              #accessMessage: accessMessage,
              #blockchain: blockchain,
              #network: network,
            },
          ),
        )),
      ) as _i7.Future<_i2.PrivateIdentityEntity>);
  @override
  _i7.Future<void> storeIdentity({required _i3.IdentityEntity? identity}) =>
      (super.noSuchMethod(
        Invocation.method(
          #storeIdentity,
          [],
          {#identity: identity},
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<void> removeIdentity({
    required String? did,
    required String? privateKey,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeIdentity,
          [],
          {
            #did: did,
            #privateKey: privateKey,
          },
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
  @override
  _i7.Future<_i3.IdentityEntity> getIdentity({required String? did}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getIdentity,
          [],
          {#did: did},
        ),
        returnValue: _i7.Future<_i3.IdentityEntity>.value(_FakeIdentityEntity_1(
          this,
          Invocation.method(
            #getIdentity,
            [],
            {#did: did},
          ),
        )),
      ) as _i7.Future<_i3.IdentityEntity>);
  @override
  _i7.Future<_i2.PrivateIdentityEntity> getPrivateIdentity({
    required _i8.DidEntity? did,
    required String? privateKey,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPrivateIdentity,
          [],
          {
            #did: did,
            #privateKey: privateKey,
          },
        ),
        returnValue: _i7.Future<_i2.PrivateIdentityEntity>.value(
            _FakePrivateIdentityEntity_0(
          this,
          Invocation.method(
            #getPrivateIdentity,
            [],
            {
              #did: did,
              #privateKey: privateKey,
            },
          ),
        )),
      ) as _i7.Future<_i2.PrivateIdentityEntity>);
  @override
  _i7.Future<List<_i3.IdentityEntity>> getIdentities() => (super.noSuchMethod(
        Invocation.method(
          #getIdentities,
          [],
        ),
        returnValue:
            _i7.Future<List<_i3.IdentityEntity>>.value(<_i3.IdentityEntity>[]),
      ) as _i7.Future<List<_i3.IdentityEntity>>);
  @override
  _i7.Future<String> signMessage({
    required String? privateKey,
    required String? message,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #signMessage,
          [],
          {
            #privateKey: privateKey,
            #message: message,
          },
        ),
        returnValue: _i7.Future<String>.value(''),
      ) as _i7.Future<String>);
  @override
  _i7.Future<String> getDidIdentifier({
    required String? privateKey,
    required String? blockchain,
    required String? network,
    required int? profileNonce,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDidIdentifier,
          [],
          {
            #privateKey: privateKey,
            #blockchain: blockchain,
            #network: network,
            #profileNonce: profileNonce,
          },
        ),
        returnValue: _i7.Future<String>.value(''),
      ) as _i7.Future<String>);
  @override
  _i7.Future<Map<String, dynamic>> getNonRevProof({
    required String? identityState,
    required int? nonce,
    required String? baseUrl,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getNonRevProof,
          [],
          {
            #identityState: identityState,
            #nonce: nonce,
            #baseUrl: baseUrl,
          },
        ),
        returnValue:
            _i7.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i7.Future<Map<String, dynamic>>);
  @override
  _i7.Future<String> getState({
    required String? identifier,
    required String? contractAddress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getState,
          [],
          {
            #identifier: identifier,
            #contractAddress: contractAddress,
          },
        ),
        returnValue: _i7.Future<String>.value(''),
      ) as _i7.Future<String>);
  @override
  _i7.Future<String> convertIdToBigInt({required String? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #convertIdToBigInt,
          [],
          {#id: id},
        ),
        returnValue: _i7.Future<String>.value(''),
      ) as _i7.Future<String>);
  @override
  _i7.Future<_i4.RhsNodeEntity> getStateRoots({required String? url}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getStateRoots,
          [],
          {#url: url},
        ),
        returnValue: _i7.Future<_i4.RhsNodeEntity>.value(_FakeRhsNodeEntity_2(
          this,
          Invocation.method(
            #getStateRoots,
            [],
            {#url: url},
          ),
        )),
      ) as _i7.Future<_i4.RhsNodeEntity>);
  @override
  _i7.Future<String> getChallenge({required String? message}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getChallenge,
          [],
          {#message: message},
        ),
        returnValue: _i7.Future<String>.value(''),
      ) as _i7.Future<String>);
  @override
  _i7.Future<_i5.NodeEntity> getAuthClaimNode(
          {required List<String>? children}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAuthClaimNode,
          [],
          {#children: children},
        ),
        returnValue: _i7.Future<_i5.NodeEntity>.value(_FakeNodeEntity_3(
          this,
          Invocation.method(
            #getAuthClaimNode,
            [],
            {#children: children},
          ),
        )),
      ) as _i7.Future<_i5.NodeEntity>);
  @override
  _i7.Future<Map<String, dynamic>> getLatestState({
    required String? did,
    required String? privateKey,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getLatestState,
          [],
          {
            #did: did,
            #privateKey: privateKey,
          },
        ),
        returnValue:
            _i7.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i7.Future<Map<String, dynamic>>);
  @override
  _i7.Future<String> exportIdentity({
    required String? did,
    required String? privateKey,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #exportIdentity,
          [],
          {
            #did: did,
            #privateKey: privateKey,
          },
        ),
        returnValue: _i7.Future<String>.value(''),
      ) as _i7.Future<String>);
  @override
  _i7.Future<void> importIdentity({
    required String? did,
    required String? privateKey,
    required String? encryptedDb,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #importIdentity,
          [],
          {
            #did: did,
            #privateKey: privateKey,
            #encryptedDb: encryptedDb,
          },
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
}
