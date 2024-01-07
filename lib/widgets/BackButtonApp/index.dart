import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class BackButtonApp extends StatelessWidget {
  final VoidCallback? onPressed;
  const BackButtonApp({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.maybePop(context);
        }
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            color: neutral00, borderRadius: BorderRadius.circular(15)),
        child: Icon(
          Icons.arrow_back_ios_sharp,
          color: theme.neutral10,
          size: 16,
        ),
      ),
    );
  }
}
