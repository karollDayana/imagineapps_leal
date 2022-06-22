import 'package:flutter/material.dart';

class SeriesImage extends StatelessWidget {
  const SeriesImage({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Container(
      width: width ?? size.width * 0.31,
      height: height ?? size.height * 0.23,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
