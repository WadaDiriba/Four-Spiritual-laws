import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:four_laws/constants/app_color.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.bgoverlay,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColor.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      title: Text(
        'Seerota Afuura Arfan',
        style: TextStyle(
          color: AppColor.light,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'regular',
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }
}
