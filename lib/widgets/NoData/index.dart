import 'package:flutter/material.dart';

import '../../styles/styles.dart';
import '../../styles/text_define.dart';

class NoData extends StatelessWidget {
  final IconData icon;
  final String text;
  const NoData({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 150, color: neutral04.withOpacity(0.3)),
          const SizedBox(height: 8),
          Text(text,
              style:
                  TextDefine.t1_B.copyWith(color: neutral04.withOpacity(0.3)))
        ],
      ),
    );
  }
}
