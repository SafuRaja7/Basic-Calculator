// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:calculator_app/configs/configs.dart';

class ThemeButtons extends StatelessWidget {
  final Color containerColor;
  final Color iconColorDark;
  final Color iconColorLight;
  final VoidCallback onTapDark;
  final VoidCallback onTapLight;
  const ThemeButtons({
    Key? key,
    required this.containerColor,
    required this.iconColorDark,
    required this.iconColorLight,
    required this.onTapDark,
    required this.onTapLight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 100,
        height: 40,
        color: containerColor, 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: onTapLight,
              // onTap: () {
              //   setState(
              //     () {
              //       isDark = false;
              //     },
              //   );
              // },
              child: Icon(
                Icons.wb_sunny_outlined,
                color:  iconColorLight 
              ),
            ),
            Space.x1!,
            InkWell(
              onTap: onTapDark,
             
              child: Icon(
                Icons.dark_mode_outlined,
                color: iconColorDark 
              ),
            )
          ],
        ),
      ),
    );
  }
}
