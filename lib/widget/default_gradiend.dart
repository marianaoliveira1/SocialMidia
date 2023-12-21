import 'package:flutter/material.dart';
import 'package:socialmidia/utils/colors.dart';

class DefaultGradientBackground extends StatelessWidget {
  const DefaultGradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            DefaultColors.cinzaEscuro,
            DefaultColors.preto,
          ],
        ),
      ),
    );
  }
}
