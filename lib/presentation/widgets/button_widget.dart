import 'package:flutter/material.dart';
import 'package:imagineapps_leal/presentation/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.text, this.width, this.color, this.style, this.onTap}) : super(key: key);

  final String text;
  final double? width;
  final Color? color;
  final TextStyle? style;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? size.width * 0.5,
        padding: EdgeInsets.symmetric(vertical: size.height * 0.0125),
        decoration: BoxDecoration(color: color ?? theme.colorScheme.primary, borderRadius: BorderRadius.circular(30)),
        child: TextWidget(
          text: text,
          style: style ?? theme.textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
