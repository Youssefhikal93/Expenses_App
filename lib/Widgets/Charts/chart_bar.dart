import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.fill});

  final double fill;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return SizedBox(
      height: 24,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: colorScheme.surfaceContainerHighest, // background track
        ),
        child: FractionallySizedBox(
          widthFactor: fill,
          alignment: Alignment.centerLeft,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: isDarkMode
                    ? [colorScheme.secondary, colorScheme.tertiary]
                    : [colorScheme.primary, colorScheme.secondary],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
