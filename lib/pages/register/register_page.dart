import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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

    void signUp() {}

    return Scaffold(
      backgroundColor: DefaultColors.cinzaEscuro,
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
                      labelText: 'Maria',
                      icon: Icons.person,
                    ),
                    DefaultTextField(
                      obscureText: false,
                      controller: usernameController,
                      labelText: 'maria123',
                      icon: Icons.person_pin_circle_sharp,
                    ),
                    DefaultTextField(
                      obscureText: false,
                      controller: emailController,
                      labelText: 'exemplo@email.com',
                      icon: Icons.email,
                    ),
                    DefaultTextField(
                      obscureText: true,
                      controller: passwordController,
                      labelText: 'senha',
                      icon: Icons.lock,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Já possui conta? ",
                          style: GoogleFonts.raleway(
                            color: DefaultColors.branco,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: onTap,
                          child: Text(
                            "Entrar",
                            style: GoogleFonts.raleway(
                              color: DefaultColors.branco,
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
