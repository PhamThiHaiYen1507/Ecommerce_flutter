import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:nws_yenpth1_ecommerce_flutter/styles/text_define.dart';

import '../base/network/base_network.dart';
import '../styles/styles.dart';

enum NOTIFICATION_TYPE { SUCCESS, ERROR }

enum CHANGE_PASSWORD_TYPE { SIGNUP, FORGOT_PASSWORD, CHANGE_PASSWORD }

class Utils {
  static void showNotification(NOTIFICATION_TYPE type,
      [String? title, String? notification, Color? color]) {
    final notificationColor = {
      NOTIFICATION_TYPE.SUCCESS: color ?? theme.primary03,
      NOTIFICATION_TYPE.ERROR: theme.error04,
    };

    Get.rawSnackbar(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
        snackPosition: SnackPosition.TOP,
        borderRadius: 8,
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: notificationColor[type]!,
        messageText: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title?.tr ?? '',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            Text(
              notification?.tr ?? '',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ));
  }

  static void showNotiBotom(
      BuildContext context, NOTIFICATION_TYPE type, String content) {
    final notificationColor = {
      NOTIFICATION_TYPE.SUCCESS: Colors.green,
      NOTIFICATION_TYPE.ERROR: theme.error04,
    };
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(12),
        backgroundColor: notificationColor[type],
        content: Text(content, style: TextDefine.t2_R),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static void showPopup(
      {String? title,
      String? content,
      String? cancle,
      String? confirm,
      bool? barrierDismissible,
      VoidCallback? onConfirm}) {
    Get.dialog(
        barrierDismissible: barrierDismissible ?? true,
        AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          content: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title ?? 'Thông báo',
                  style: TextStyle(
                      color: theme.primary03, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 15),
                if (content != null)
                  Text(
                    content,
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    if (cancle != null)
                      Expanded(
                        child: SizedBox(
                          width: double.maxFinite,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15)),
                            onPressed: Get.back,
                            child: Text(
                              cancle,
                              style: TextDefine.t2_B,
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15)),
                        onPressed: () => onConfirm?.call(),
                        child: Text(
                          confirm ?? 'Xác nhận',
                          style: TextDefine.t2_B,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  static bool validatePhoneNumber(String value) {
    final RegExp phoneReg =
        RegExp(r'((09|03|07|08|05)+([0-9]{8})\b)|((84)+([0-9]{9})\b)');
    return phoneReg.hasMatch(value);
  }

  static void backToRoutes(String routes) {
    bool isNot = Get.currentRoute != routes;
    while (isNot) {
      isNot = Get.currentRoute != routes;
      if (isNot) {
        Get.back();
      }
    }
  }

  static Future<void> showCustomDialog({
    required BuildContext context,
    Widget? content,
    double? radius,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsets? insetPadding,
    bool barrierDismissible = true,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => barrierDismissible,
          child: AlertDialog(
            insetPadding:
                insetPadding ?? const EdgeInsets.symmetric(vertical: 18),
            contentPadding: contentPadding ?? const EdgeInsets.all(18),
            content: content,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 12),
            ),
          ),
        );
      },
    );
  }
}

extension GetResponseExtension on ApiResponse {
  void showError(String title) {
    final notification =
        undecodeData is Map ? undecodeData['message']?.toString().tr : null;
    if (undecodeData['message'] == notification) {
      Utils.showNotification(NOTIFICATION_TYPE.ERROR, title,
          undecodeData['message'] ?? notification);
    } else {
      Utils.showNotification(
        NOTIFICATION_TYPE.ERROR,
        title,
        notification,
      );
    }
  }
}
