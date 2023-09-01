import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_braille/ui/utils/constants.dart';

class Toast {
  static showErrorToast(String message) {
    _showToast(const Key('errorToast'), message, Colors.red);
  }

  static showSuccessToast(String message) {
    _showToast(const Key('successToast'), message, Constants.greenLightColor, showCloseButton: true);
  }

  static showInfoToast(String message) {
    _showToast(const Key('successToast'), message, Constants.lightBlueColor, showCloseButton: true);
  }

  static showSuccessToastWithButton(String message, Function()? func) {
    _showToastWithButton(
      const Key('successToast'),
      message,
      Constants.greenLightColor,
      func,
    );
  }

  static _showToast(Key? key, String message, Color color, {bool showCloseButton = false}) {
    BotToast.showCustomNotification(
      align: Alignment.topCenter,
      duration: Duration(milliseconds: showCloseButton ? 5000 : 3500),
      toastBuilder: (cancel) {
        return SizedBox(
          key: key,
          width: double.infinity,
          child: Material(
            color: color,
            child: ListTile(
              dense: true,
              onTap: null,
              title: Text(
                message,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              trailing: showCloseButton
                  ? IconButton(
                      icon: const Image(
                        image: AssetImage("assets/images/icon-close.png"),
                      ),
                      onPressed: cancel,
                    )
                  : null,
            ),
          ),
        );
      },
    );
  }

  static _showToastWithButton(
    Key? key,
    String message,
    Color color,
    Function()? func,
  ) {
    BotToast.showCustomNotification(
      align: Alignment.topCenter,
      duration: const Duration(seconds: 4),
      toastBuilder: (cancel) {
        return GestureDetector(
          onTap: func,
          child: SizedBox(
            key: key,
            width: double.infinity,
            child: Material(
              color: color,
              child: ListTile(
                  dense: true,
                  onTap: null,
                  title: Text(
                    message,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  trailing: IconButton(
                    icon: const Image(
                      image: AssetImage("assets/images/icon-close.png"),
                    ),
                    onPressed: cancel,
                  )),
            ),
          ),
        );
      },
    );
  }
}
