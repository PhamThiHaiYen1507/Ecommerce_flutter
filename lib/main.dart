import 'package:flutter/material.dart';
import 'package:nws_yenpth1_ecommerce_flutter/app/app.dart';
import 'package:nws_yenpth1_ecommerce_flutter/config.dart';

import 'global.dart';

Future<void> main() async {
  setAppDevelopment();
  await Global.initial();
  runApp(const Ecommerce());
}

