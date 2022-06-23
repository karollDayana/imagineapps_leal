import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.hintText,
    this.keyboardType,
    this.obscureText,
    this.onChanged,
  }) : super(key: key);

  final String hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.text,
      style: theme.textTheme.bodyText1?.copyWith(color: theme.colorScheme.secondary),
      cursorRadius: const Radius.circular(1),
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: theme.textTheme.bodyText1?.copyWith(color: theme.colorScheme.secondary),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: theme.colorScheme.secondary, width: 1.5)),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.5)),
      ),
      textAlignVertical: TextAlignVertical.center,
      onChanged: onChanged,
    );
  }
}
