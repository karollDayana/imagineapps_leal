import 'package:flutter/material.dart';
import 'package:imagineapps_leal/presentation/presentation.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

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
              const _CardFavoriteSerie(
                seriesName: 'Hannibal',
                seriesRating: 8.4,
              ),
              SizedBox(height: size.height * 0.005),
              if (index + 1 < 5) Divider(color: theme.colorScheme.secondary, height: size.height * 0.04),
              SizedBox(height: size.height * 0.005),
            ],
          );
        },
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}

class _CardFavoriteSerie extends StatelessWidget {
  const _CardFavoriteSerie({Key? key, required this.seriesName, required this.seriesRating}) : super(key: key);

  final String seriesName;
  final double seriesRating;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Row(
      children: [
        SeriesImage(height: size.height * 0.225),
        SizedBox(width: size.width * 0.08),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: seriesName,
                style: theme.textTheme.bodyText1?.copyWith(color: theme.colorScheme.secondaryContainer),
                maxLines: 2,
              ),
              SizedBox(height: size.height * 0.01),
              RatingBarWidget(ratingValue: seriesRating / 2),
              SizedBox(height: size.height * 0.015),
              TextWidget(text: 'IMDb: $seriesRating', style: theme.textTheme.caption),
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
                  Icon(Icons.favorite, color: theme.colorScheme.primary.withOpacity(0.5), size: 30)
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
