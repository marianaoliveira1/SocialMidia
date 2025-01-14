// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialmidia/controller/auth_controller.dart';
import 'package:socialmidia/utils/colors.dart';
import 'package:socialmidia/widget/default_button.dart';
import 'package:socialmidia/widget/default_text_field.dart';
import 'package:socialmidia/widget/default_title_principal.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;
  const LoginPage({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    void sinIn() async {
      final authService = Get.find<AuthController>();

      try {
        await authService.signInWithEmailAndPassword(
          emailController.text,
          passwordController.text,
        );
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
                      height: 190.h,
                    ),
                    const DefaultTitlePrincipal(text: 'Login'),
                    SizedBox(
                      height: 50.h,
                    ),
                    DefaultTextField(
                      hintText: 'email@email.com',
                      obscureText: false,
                      controller: emailController,
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
                          "Ainda não possi conta?  ",
                          style: GoogleFonts.poppins(
                            color: DefaultColors.branco.withOpacity(.8),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: onTap,
                          child: Text(
                            "Cadastrar",
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
                      height: 0.17.sh,
                    ),
                    DefaultButton(
                      text: "Entrar",
                      onPressed: sinIn,
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
