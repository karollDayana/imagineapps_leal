import 'package:flutter/material.dart';
import 'package:imagineapps_leal/presentation/presentation.dart';

class SerieDetailScreen extends StatelessWidget {
  const SerieDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.6,
              color: Colors.pink,
            ),
            SafeArea(
              child: Column(
                children: [
                  const _AppBar(appBarName: 'The Witcher'),
                  const _EpisodeNumber(episodeNumber: '1'),
                  SizedBox(height: size.height * 0.01),
                  const _EpisodeVideoAndName(
                    seriesName: 'The Witcher',
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: size.height * 0.02),
        const _SerieDetails(
          seriesRating: 8.4,
          seriesYear: '2019',
          seriesSeasons: '1',
          seriesDescription: 'Aquí va la descripción',
          seriesStarring: 'Aquí van los nombres',
        ),
      ],
    );
  }
}

class _AppBar extends StatefulWidget {
  const _AppBar({Key? key, required this.appBarName}) : super(key: key);

  final String appBarName;

  @override
  State<_AppBar> createState() => _AppBarState();
}

class _AppBarState extends State<_AppBar> {
  bool serieLike = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        right: size.width * 0.04,
        left: size.width * 0.02,
        top: size.height * 0.01,
        bottom: size.height * 0.03,
      ),
      child: Row(
        children: [
          GestureDetector(
            child: Icon(Icons.chevron_left_rounded, size: 30, color: theme.colorScheme.secondaryContainer),
            onTap: () => Navigator.pop(context),
          ),
          SizedBox(width: size.width * 0.02),
          TextWidget(
            text: widget.appBarName,
            style: theme.textTheme.bodyText1?.copyWith(color: theme.colorScheme.secondary),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => setState(() {
              if (serieLike) {
                serieLike = false;
              } else {
                serieLike = true;
              }
            }),
            child: Icon(
              serieLike ? Icons.favorite : Icons.favorite_border,
              color: serieLike ? theme.colorScheme.primary : theme.colorScheme.secondary,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}

class _EpisodeNumber extends StatelessWidget {
  const _EpisodeNumber({Key? key, required this.episodeNumber}) : super(key: key);

  final String episodeNumber;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.03),
      child: Row(
        children: [
          TextWidget(
            text: '$episodeNumber Episode',
            style: theme.textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.secondaryContainer,
            ),
          ),
          const Spacer(),
          GestureDetector(
            child: Row(
              children: [
                TextWidget(
                  text: 'Next',
                  style: theme.textTheme.bodyText1?.copyWith(color: theme.colorScheme.secondaryContainer),
                ),
                Icon(Icons.chevron_right_rounded, size: 30, color: theme.colorScheme.secondaryContainer),
              ],
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _EpisodeVideoAndName extends StatelessWidget {
  const _EpisodeVideoAndName({Key? key, required this.seriesName}) : super(key: key);

  final String seriesName;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SeriesImage(width: size.width * 0.9, height: size.height * 0.3),
            Positioned(
              top: size.height * 0.1,
              left: size.width * 0.375,
              child: Icon(
                Icons.play_circle_fill_outlined,
                size: 60,
                color: theme.colorScheme.primary,
              ),
            )
          ],
        ),
        SizedBox(height: size.height * 0.09),
        TextWidget(
          text: seriesName,
          style: theme.textTheme.headline4?.copyWith(color: theme.colorScheme.secondaryContainer),
          maxLines: 2,
        ),
      ],
    );
  }
}

class _SerieDetails extends StatelessWidget {
  const _SerieDetails({
    Key? key,
    required this.seriesRating,
    required this.seriesYear,
    required this.seriesSeasons,
    required this.seriesDescription,
    required this.seriesStarring,
  }) : super(key: key);

  final double seriesRating;
  final String seriesYear;
  final String seriesSeasons;
  final String seriesDescription;
  final String seriesStarring;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: 'IMDb: $seriesRating | $seriesYear | $seriesSeasons Season',
            style: theme.textTheme.caption,
            maxLines: 2,
          ),
          SizedBox(height: size.height * 0.02),
          Divider(color: theme.colorScheme.secondary, height: size.height * 0.04),
          SizedBox(height: size.height * 0.015),
          TextWidget(
            text: '$seriesDescription \n \nStarring: $seriesStarring',
            style: theme.textTheme.bodyText1?.copyWith(color: theme.colorScheme.secondaryContainer),
          ),
        ],
      ),
    );
  }
}
