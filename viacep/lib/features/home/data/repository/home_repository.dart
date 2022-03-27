import 'package:dartz/dartz.dart';
import 'package:viacep/core/app/repositories/base_repository.dart';
import 'package:viacep/core/error/failures.dart';
import 'package:viacep/shared/models/address_model.dart';

class HomeRepositori extends BaseRepository {
  Future<Either<Failure, AddressModel>> getAdressByCEP(String cep) async {
    try {
      final response = await get(path: cep);
      if (response.statusCode == 200) {
        final address = AddressModel.fromMap(response.data);
        return Right(address);
      } else {
        return Left(NotFoundFailure.instance);
      }
    } catch (e) {
      return Left(NotFoundFailure.instance);
    }
  }
}
