class Urls {
  static const String baseUrl = 'https://api.themoviedb.org/3/tv';
  static const String apiKey = 'efa1859ddab22e67c7ede352ea1117f7';
  static String listSeries() => '$baseUrl/popular?api_key=$apiKey&language=en-US&page=1';
}
