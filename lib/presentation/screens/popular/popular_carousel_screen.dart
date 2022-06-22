import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:imagineapps_leal/presentation/presentation.dart';

class PopularCarouselScreen extends StatelessWidget {
  const PopularCarouselScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF483628),
        title: TextWidget(
          text: 'Popular',
          style: theme.textTheme.bodyText1?.copyWith(color: theme.colorScheme.secondary),
        ),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left_rounded, size: 30, color: theme.colorScheme.secondaryContainer),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xFF483628), theme.colorScheme.primaryContainer],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 0.8),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: CarouselSlider.builder(
          options: CarouselOptions(
            height: 600.0,
            disableCenter: true,
            enlargeCenterPage: true,
            viewportFraction: 0.75,
          ),
          itemCount: 15,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => _PopularSerie(
            serieName: 'The Witcher',
            serieRating: 8.4,
            onTap: () => Navigator.of(context).pushNamed('/serieDetailScreen'),
          ),
        ),
      ),
    );
  }
}

class _PopularSerie extends StatelessWidget {
  const _PopularSerie({Key? key, required this.serieName, required this.serieRating, this.onTap}) : super(key: key);

  final String serieName;
  final double serieRating;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Column(
      children: [
        SizedBox(height: size.height * 0.075),
        SeriesImage(width: size.width * 0.65, height: size.height * 0.45),
        SizedBox(height: size.height * 0.04),
        TextWidget(
          text: serieName,
          style: theme.textTheme.headline4?.copyWith(color: theme.colorScheme.secondaryContainer),
          maxLines: 2,
        ),
        SizedBox(height: size.height * 0.01),
        const RatingBarWidget(ratingValue: 4.2, itemSize: 18),
        SizedBox(height: size.height * 0.02),
        TextWidget(text: 'IMDb: $serieRating', style: theme.textTheme.button?.copyWith(color: theme.colorScheme.secondary)),
        SizedBox(height: size.height * 0.03),
        ButtonWidget(
          text: 'Watch Now',
          style: theme.textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w700),
          color: theme.colorScheme.primary.withOpacity(0.9),
          width: size.width * 0.5,
          onTap: onTap,
        ),
      ],
    );
  }
}
