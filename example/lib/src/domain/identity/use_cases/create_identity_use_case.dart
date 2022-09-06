import 'package:polygonid_flutter_sdk/common/domain/use_case.dart';
import 'package:polygonid_flutter_sdk_example/src/domain/identity/repositories/identity_repositories.dart';

class CreateIdentityUseCase extends FutureUseCase<void, String> {
  final IdentityRepository _identityRepository;

  CreateIdentityUseCase(this._identityRepository);

  @override
  Future<String> execute({void param}) {
    return _identityRepository.createIdentity();
  }
}