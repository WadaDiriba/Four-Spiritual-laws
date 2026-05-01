import 'package:flutter/material.dart';
import 'package:fourspirtuallaws/constants/app_color.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: AppColor.bgoverlay),
                child: Text(
                  "Four Spiritual Laws",
                  style: TextStyle(
                    color: AppColor.light,
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
