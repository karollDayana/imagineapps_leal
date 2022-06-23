import 'package:dartz/dartz.dart';
import 'package:imagineapps_leal/data/data.dart';
import 'package:imagineapps_leal/domain/domain.dart';

class GetSeriesList {
  final SerieRepository repository;

  GetSeriesList(this.repository);

  Future<Either<Failure, Serie>> execute() {
    return repository.getSeriesList();
  }
}
