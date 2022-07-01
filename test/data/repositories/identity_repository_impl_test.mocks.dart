// Mocks generated by Mockito 5.2.0 from annotations
// in polygonid_flutter_sdk/example/ios/.symlinks/plugins/polygonid_flutter_sdk/test/data/repositories/identity_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;
import 'dart:typed_data' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:polygonid_flutter_sdk/data/data_sources/local_identity_data_source.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [LocalIdentityDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalIdentityDataSource extends _i1.Mock
    implements _i2.LocalIdentityDataSource {
  MockLocalIdentityDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<String> generatePrivateKey({_i4.Uint8List? privateKey}) =>
      (super.noSuchMethod(
          Invocation.method(#generatePrivateKey, [], {#privateKey: privateKey}),
          returnValue: Future<String>.value('')) as _i3.Future<String>);
  @override
  _i3.Future<String> generateIdentifier({String? privateKey}) =>
      (super.noSuchMethod(
          Invocation.method(#generateIdentifier, [], {#privateKey: privateKey}),
          returnValue: Future<String>.value('')) as _i3.Future<String>);
}
