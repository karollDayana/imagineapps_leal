import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    required this.text,
    this.style,
    this.textAlign,
    this.maxLines,
    this.letterSpacing,
  }) : super(key: key);

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? Theme.of(context).textTheme.bodyText1,
      textAlign: textAlign ?? TextAlign.left,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }
}
