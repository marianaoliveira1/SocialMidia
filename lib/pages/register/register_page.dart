// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialmidia/controller/auth_controller.dart';
import 'package:socialmidia/utils/colors.dart';
import 'package:socialmidia/widget/default_button.dart';
import 'package:socialmidia/widget/default_text_field.dart';
import 'package:socialmidia/widget/default_title_principal.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    void signUp() async {
      final authService = Get.find<AuthController>();

      try {
        UserCredential userCredential = await authService.signUpWithEmailAndPassword(
          emailController.text,
          passwordController.text,
          nameController.text,
          usernameController.text,
        );

        FirebaseFirestore.instance.collection("Users").doc(userCredential.user!.email).set({
          'username': emailController.text.split('@')[0],
          'bio': '',
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
            ),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: DefaultColors.backgroundPost,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(right: 20.h, left: 20.h),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    const DefaultTitlePrincipal(text: 'Cadastro'),
                    SizedBox(
                      height: 50.h,
                    ),
                    DefaultTextField(
                      obscureText: false,
                      controller: nameController,
                      hintText: 'Maria',
                      icon: Icons.person,
                    ),
                    DefaultTextField(
                      obscureText: false,
                      controller: usernameController,
                      hintText: 'maria123',
                      icon: Icons.person_pin_circle_sharp,
                    ),
                    DefaultTextField(
                      obscureText: false,
                      controller: emailController,
                      hintText: 'exemplo@email.com',
                      icon: Icons.email,
                    ),
                    DefaultTextField(
                      obscureText: true,
                      controller: passwordController,
                      hintText: 'senha',
                      icon: Icons.lock,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Já possui conta? ",
                          style: GoogleFonts.poppins(
                            color: DefaultColors.branco.withOpacity(.8),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: onTap,
                          child: Text(
                            "Entrar",
                            style: GoogleFonts.poppins(
                              color: DefaultColors.branco.withOpacity(.9),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.1.sh,
                    ),
                    DefaultButton(
                      text: "Cadastro",
                      onPressed: signUp,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
