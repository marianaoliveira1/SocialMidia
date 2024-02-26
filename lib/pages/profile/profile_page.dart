import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialmidia/utils/colors.dart';
import 'package:socialmidia/widget/default_text_box.dart';
import 'package:socialmidia/widget/default_user_email.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    Future<void> editField(String field) async {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Editar $field'),
            content: TextField(
              decoration: InputDecoration(
                hintText: 'Digite o novo $field',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancelar',
                  style: GoogleFonts.poppins(),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Salvar',
                  style: GoogleFonts.poppins(),
                ),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: DefaultColors.preto,
      appBar: AppBar(
        backgroundColor: DefaultColors.background,
        title: Text(
          'Perfil',
          style: GoogleFonts.poppins(
            color: DefaultColors.branco,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Icon(
            Icons.person,
            size: 72.h,
            color: DefaultColors.branco,
          ),
          DefaultUserEmail(
            currentUser: currentUser,
          ),
          DefaultTextBox(
            sectionName: 'username',
            text: 'mrnfernandes',
            onPressed: () => editField('username'),
          ),
          DefaultTextBox(
            sectionName: 'bio',
            text: '',
            onPressed: () => editField('bio'),
          ),
        ],
      ),
    );
  }
}
