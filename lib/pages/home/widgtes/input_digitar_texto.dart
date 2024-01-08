import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:socialmidia/utils/colors.dart';

class InputDigitarTexto extends StatelessWidget {
  const InputDigitarTexto({
    super.key,
    required this.textController,
  });

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    void pstMessage() {}

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: textController,
            style: GoogleFonts.raleway(
              color: DefaultColors.branco,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: DefaultColors.background,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: DefaultColors.background,
                ),
              ),
              filled: true,
              fillColor: DefaultColors.background,
              hintStyle: const TextStyle(
                color: DefaultColors.cinzaClaro,
              ),
              hintText: 'Digite o que esta pensando',
            ),
          ),
        ),
        IconButton(
          onPressed: pstMessage,
          icon: const Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }
}
