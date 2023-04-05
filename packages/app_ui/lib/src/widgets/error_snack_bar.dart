import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

/// {@template error_snack_bar}
/// A [SnackBar] that displays an error message.
/// {@endtemplate}
class ErrorSnackBar extends SnackBar {
  /// {@macro error_snack_bar}
  ErrorSnackBar({
    super.key,
    required String text,
  }) : super(
          content: Text(
            EmojiParser().emojify(':rotating_light: $text'),
            textAlign: TextAlign.center,
          ),
        );
}
