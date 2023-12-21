import 'package:flutter/material.dart';
import 'package:socialmidia/utils/colors.dart';

class DefaultGradientBackground extends StatelessWidget {
  const DefaultGradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            DefaultColors.cinzaClaro,
            DefaultColors.cinzaEscuro,
          ],
        ),
      ),
    );
  }
}
