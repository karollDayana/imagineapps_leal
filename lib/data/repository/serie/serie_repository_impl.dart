import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:imagineapps_leal/data/data.dart';
import 'package:imagineapps_leal/domain/domain.dart';

class SerieRepositoryImpl implements SerieRepository {
  final SerieDataSource remoteDataSource;

  SerieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Serie>> getSeriesList() async {
    try {
      final result = await remoteDataSource.getSeriesList();
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
