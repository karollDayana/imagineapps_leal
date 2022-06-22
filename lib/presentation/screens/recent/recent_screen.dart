import 'package:flutter/material.dart';
import 'package:imagineapps_leal/presentation/presentation.dart';

class RecentScreen extends StatelessWidget {
  const RecentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              _CardRecentSerie(
                serieName: 'Westworld',
                serieActualEpisode: '3',
                serieTotalEpisode: '20',
                onTap: () => Navigator.of(context).pushNamed('/recentEpisodesScreen'),
              ),
              SizedBox(height: size.height * 0.005),
              if (index + 1 < 5)
                Divider(
                  color: theme.colorScheme.secondary.withOpacity(0.3),
                  height: size.height * 0.04,
                  endIndent: size.width * 0.1,
                  indent: size.width * 0.1,
                  thickness: 1.0,
                ),
              SizedBox(height: size.height * 0.005),
            ],
          );
        },
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}

class _CardRecentSerie extends StatelessWidget {
  const _CardRecentSerie(
      {Key? key, required this.serieName, required this.serieActualEpisode, required this.serieTotalEpisode, this.onTap})
      : super(key: key);

  final String serieName;
  final String serieActualEpisode;
  final String serieTotalEpisode;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Center(
      child: Column(
        children: [
          SizedBox(height: size.height * 0.03),
          SeriesImage(width: size.width * 0.8, height: size.height * 0.4),
          SizedBox(height: size.height * 0.03),
          TextWidget(text: serieName, style: theme.textTheme.headline4),
          SizedBox(height: size.height * 0.02),
          TextWidget(
            text: '$serieActualEpisode episodes of $serieTotalEpisode',
            style: theme.textTheme.button?.copyWith(fontWeight: FontWeight.w400, color: theme.colorScheme.secondary),
          ),
          SizedBox(height: size.height * 0.02),
          GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextWidget(text: 'Go to view', style: theme.textTheme.bodyText1?.copyWith(color: theme.colorScheme.primary)),
                Icon(Icons.keyboard_arrow_right_rounded, color: theme.colorScheme.primary)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
