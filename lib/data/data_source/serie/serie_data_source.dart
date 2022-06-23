import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:imagineapps_leal/data/data.dart';

abstract class SerieDataSource {
  Future<SerieModel> getSeriesList();
}

class SerieDataSourceImpl implements SerieDataSource {
  final http.Client client;
  SerieDataSourceImpl({required this.client});

  @override
  Future<SerieModel> getSeriesList() async {
    final response = await client.get(Uri.parse(Urls.listSeries()));

    if (response.statusCode == 200) {
      return SerieModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
