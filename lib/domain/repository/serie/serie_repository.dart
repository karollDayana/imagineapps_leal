import 'package:dartz/dartz.dart';
import 'package:imagineapps_leal/data/data.dart';
import 'package:imagineapps_leal/domain/domain.dart';

abstract class SerieRepository {
  Future<Either<Failure, Serie>> getSeriesList();
}
