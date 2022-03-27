import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:viacep/core/error/failures.dart';

import 'package:viacep/features/home/data/repository/home_repository.dart';
import 'package:viacep/shared/models/address_model.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final HomeRepositori _repositori;
  HomeControllerBase(this._repositori);

  // @observable
  // AddressModel? address;

  @action
  Future<Either<Failure, AddressModel>> searchAddresByCep(String cep) async {
    try {
      final response = await _repositori.getAdressByCEP(cep);
      return response.fold((l) => Left(l), (address) => Right(address));
    } catch (e) {}
    return Left(NotFoundFailure.instance);
  }
}
