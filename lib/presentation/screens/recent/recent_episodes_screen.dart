import 'package:flutter/material.dart';
import 'package:imagineapps_leal/presentation/presentation.dart';

class RecentEpisodesScreen extends StatelessWidget {
  const RecentEpisodesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primaryContainer,
        title: TextWidget(
          text: 'Westworld',
          style: theme.textTheme.bodyText1?.copyWith(color: theme.colorScheme.secondary),
        ),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left_rounded, size: 30, color: theme.colorScheme.secondaryContainer),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              const _EpisodeVideo(episodeNumber: '3'),
              SizedBox(height: size.height * 0.02),
              if (index + 1 < 5)
                Divider(
                  color: theme.colorScheme.secondary.withOpacity(0.3),
                  height: size.height * 0.04,
                  endIndent: size.width * 0.15,
                  indent: size.width * 0.15,
                  thickness: 1.0,
                ),
              SizedBox(height: size.height * 0.02),
            ],
          );
        },
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}

class _EpisodeVideo extends StatelessWidget {
  const _EpisodeVideo({Key? key, required this.episodeNumber}) : super(key: key);

  final String episodeNumber;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: '$episodeNumber Episode',
            style: theme.textTheme.bodyText1?.copyWith(color: theme.colorScheme.secondaryContainer, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: size.height * 0.02),
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
        ],
      ),
    );
  }
}
