import 'package:flutter/material.dart';
import 'package:four_laws/constants/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Seerota Hafuuraa arfan',
        style: TextStyle(
          color: AppColor.light,
          fontFamily: 'Poppins',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: AppColor.bgoverlay,
      elevation: 2,
      iconTheme: IconThemeData(color: AppColor.light),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
