import 'package:flutter/material.dart';
import 'package:imagineapps_leal/presentation/presentation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(text: 'Popular', style: theme.textTheme.headline5?.copyWith(color: theme.colorScheme.secondaryContainer)),
            SizedBox(height: size.height * 0.02),
            SizedBox(
              height: size.height * 0.31,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      const _PopularSeriesSlide(seriesName: 'Game of Thrones', seriesRating: 3.4),
                      if (index + 1 < 5) SizedBox(width: size.width * 0.05),
                    ],
                  );
                },
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed('/popularCarouselScreen'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextWidget(text: 'See All', style: theme.textTheme.bodyText1?.copyWith(color: theme.colorScheme.primary)),
                  Icon(Icons.keyboard_arrow_right_rounded, color: theme.colorScheme.primary)
                ],
              ),
            ),
            Divider(color: theme.colorScheme.secondary, height: size.height * 0.04),
            SizedBox(height: size.height * 0.015),
            TextWidget(
              text: 'Recommendations',
              style: theme.textTheme.headline5?.copyWith(color: theme.colorScheme.secondaryContainer),
            ),
            SizedBox(height: size.height * 0.035),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return const _RecommendationSeries(
                  seriesName: 'Game of Thrones',
                  seriesRating: 9.4,
                );
              },
              physics: const BouncingScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}

class _PopularSeriesSlide extends StatelessWidget {
  const _PopularSeriesSlide({Key? key, required this.seriesName, required this.seriesRating}) : super(key: key);

  final String seriesName;
  final double seriesRating;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return SizedBox(
      width: size.width * 0.31,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SeriesImage(),
          SizedBox(height: size.height * 0.005),
          TextWidget(
            text: seriesName,
            style: theme.textTheme.bodyText1?.copyWith(color: theme.colorScheme.secondaryContainer),
            maxLines: 2,
          ),
          SizedBox(height: size.height * 0.01),
          RatingBarWidget(ratingValue: seriesRating),
        ],
      ),
    );
  }
}

class _RecommendationSeries extends StatefulWidget {
  const _RecommendationSeries({
    Key? key,
    required this.seriesName,
    required this.seriesRating,
  }) : super(key: key);

  final String seriesName;
  final double seriesRating;

  @override
  State<_RecommendationSeries> createState() => _RecommendationSeriesState();
}

class _RecommendationSeriesState extends State<_RecommendationSeries> {
  bool recommendationLike = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SeriesImage(height: size.height * 0.175),
            SizedBox(width: size.width * 0.08),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: widget.seriesName,
                    style: theme.textTheme.bodyText1?.copyWith(color: theme.colorScheme.secondaryContainer),
                    maxLines: 2,
                  ),
                  SizedBox(height: size.height * 0.01),
                  RatingBarWidget(ratingValue: widget.seriesRating / 2),
                  SizedBox(height: size.height * 0.015),
                  TextWidget(text: 'IMDb: ${widget.seriesRating}', style: theme.textTheme.caption),
                  SizedBox(height: size.height * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ButtonWidget(
                        text: 'Watch Now',
                        style: theme.textTheme.button,
                        color: theme.colorScheme.primary.withOpacity(0.95),
                        width: size.width * 0.3,
                        onTap: () {},
                      ),
                      GestureDetector(
                        onTap: () => setState(() {
                          if (recommendationLike) {
                            recommendationLike = false;
                          } else {
                            recommendationLike = true;
                          }
                        }),
                        child: Icon(
                          recommendationLike ? Icons.favorite : Icons.favorite_border,
                          color: recommendationLike ? theme.colorScheme.primary : theme.colorScheme.secondary,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: size.height * 0.02),
      ],
    );
  }
}
