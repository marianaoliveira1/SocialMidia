import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:socialmidia/utils/colors.dart';

class InputDigitarTexto extends StatefulWidget {
  const InputDigitarTexto({
    super.key,
    required this.textController,
  });

  final TextEditingController textController;

  @override
  State<InputDigitarTexto> createState() => _InputDigitarTextoState();
}

class _InputDigitarTextoState extends State<InputDigitarTexto> {
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    void pstMessage() {
      if (widget.textController.text.isNotEmpty) {
        FirebaseFirestore.instance.collection('User Posts').add({
          'Message': currentUser!.email,
          'UserEmail': widget.textController.text,
          'Timestamp': DateTime.now(),
        });
        widget.textController.clear();
      }
    }

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: widget.textController,
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
