import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialmidia/utils/colors.dart';
import 'package:socialmidia/widget/default_button.dart';
import 'package:socialmidia/widget/default_text_field.dart';
import 'package:socialmidia/widget/default_title_principal.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

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
                      height: 190.h,
                    ),
                    const DefaultTitlePrincipal(text: 'Login'),
                    SizedBox(
                      height: 50.h,
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
                          "Ainda não possi conta?  ",
                          style: GoogleFonts.raleway(
                            color: DefaultColors.branco,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            "Cadastrar",
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
                      height: 0.17.sh,
                    ),
                    const DefaultButton(
                      text: "Entrar",
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
