import 'package:flutter/material.dart';
import 'package:imagineapps_leal/presentation/presentation.dart';

Map<String, WidgetBuilder> getRoutesApp() {
  return <String, WidgetBuilder>{
    '/initScreen': (_) => const InitScreen(),
    '/popularCarouselScreen': (_) => const PopularCarouselScreen(),
    '/recentEpisodesScreen': (_) => const RecentEpisodesScreen(),
    '/serieDetailScreen': (_) => const SerieDetailScreen(),
    '/welcomeScreen': (_) => WelcomeScreen(),
  };
}
