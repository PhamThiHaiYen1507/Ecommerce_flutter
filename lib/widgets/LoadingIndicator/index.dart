import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class LoadingIndicator extends StatelessWidget {
  final num size;
  final Color? color;
  const LoadingIndicator({super.key, this.size = 20.0, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size.toDouble(),
        width: size.toDouble(),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(color ?? theme.primary03),
        ),
      ),
    );
  }
}
