import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({
    Key? key,
    required this.ratingValue,
    this.itemSize,
  }) : super(key: key);

  final double ratingValue;
  final double? itemSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RatingBar(
      initialRating: ratingValue,
      itemCount: 5,
      direction: Axis.horizontal,
      allowHalfRating: true,
      ratingWidget: RatingWidget(
        full: Icon(Icons.star, color: theme.colorScheme.secondary),
        half: Icon(Icons.star_half_outlined, color: theme.colorScheme.secondary),
        empty: Icon(Icons.star_border, color: theme.colorScheme.secondary),
      ),
      onRatingUpdate: (rating) {},
      itemSize: itemSize ?? 12.0,
    );
  }
}
