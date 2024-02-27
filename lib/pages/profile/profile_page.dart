import 'package:cloud_firestore/cloud_firestore.dart';
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

    final usersCollection = FirebaseFirestore.instance.collection('Users');

    Future<void> editField(String field) async {
      String newValue = "";
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Editar $field'),
            content: TextField(
              decoration: InputDecoration(
                hintText: 'Digite o novo $field',
              ),
              onChanged: (value) {
                newValue = value;
              },
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
                onPressed: () => Navigator.of(context).pop(newValue),
                child: Text(
                  'Salvar',
                  style: GoogleFonts.poppins(),
                ),
              ),
            ],
          );
        },
      );

      if (newValue.trim().isNotEmpty) {
        await usersCollection.doc(currentUser!.email).update({
          field: newValue
        });
      }
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
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('Users').doc(currentUser!.email).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return ListView(
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
                  text: userData['username'] as String,
                  onPressed: () => editField('username'),
                ),
                DefaultTextBox(
                  sectionName: 'bio',
                  text: userData['bio'],
                  onPressed: () => editField('bio'),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erro ao carregar dados',
                style: GoogleFonts.poppins(
                  color: DefaultColors.branco,
                  fontSize: 18.sp,
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
