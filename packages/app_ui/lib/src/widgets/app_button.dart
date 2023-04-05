import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// {@template app_button}
/// Button for the application UI.
/// {@endtemplate}
class AppButton extends StatelessWidget {
  /// {@macro app_button}
  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.isSecondary = false,
  });

  /// Creates a button with a wrapped container.
  const factory AppButton.wrapped({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    bool isLoading,
  }) = _WrappedAppButton;

  /// Called when the button has been tapped.
  final VoidCallback onPressed;

  /// The text displayed in the button.
  final String text;

  /// Represents if the button is loading.
  final bool isLoading;

  /// Represents if the button is secondary.
  final bool isSecondary;

  @override
  Widget build(BuildContext context) => buildButton(context);

  /// Builds the button.
  Widget buildButton(BuildContext context) {
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: AppShadows.lightThemeShadow3,
        borderRadius: BorderRadius.circular(AppSpacing.lg),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSecondary
              ? AppColors.neutral.shade700
              : theme.colorScheme.primary,
        ),
        child: isLoading ? const _ProgressIndicator() : Text(text),
      ),
    );
  }
}

class _WrappedAppButton extends AppButton {
  const _WrappedAppButton({
    super.key,
    required super.onPressed,
    required super.text,
    super.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.lg + AppSpacing.md + AppSpacing.xxs,
      ),
      child: buildButton(context),
    );
  }
}

class _ProgressIndicator extends StatelessWidget {
  const _ProgressIndicator();

  @override
  Widget build(BuildContext context) {
    const buttonSize = AppSpacing.lg + AppSpacing.sm - AppSpacing.xxxs;
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: buttonSize,
            height: buttonSize,
            child: CircularProgressIndicator(
              strokeWidth: AppSpacing.xxs + 1,
              backgroundColor: AppColors.neutral.shade200,
            ),
          ),
        ],
      ),
    );
  }
}
