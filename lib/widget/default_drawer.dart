import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:socialmidia/controller/auth_controller.dart';
import 'package:socialmidia/widget/default_list_tile.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Get.find<AuthController>();
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DrawerHeader(
            child: Icon(
              Icons.account_circle,
              size: 80.h,
              color: Colors.white,
            ),
          ),
          DefaultListTile(
            icon: Icons.home,
            title: 'Inicio',
            onTap: () {
              Navigator.of(context).pushNamed('/home');
            },
          ),
          DefaultListTile(
            icon: Icons.person,
            title: 'Perfil',
            onTap: () {
              Navigator.of(context).pushNamed('/profile');
            },
          ),
          DefaultListTile(
            icon: Icons.logout,
            title: 'Sair',
            onTap: authService.signOut,
          ),
        ],
      ),
    );
  }
}
