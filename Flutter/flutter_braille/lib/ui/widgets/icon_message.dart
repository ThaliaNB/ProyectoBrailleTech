import 'package:flutter/material.dart';

class IconMessage extends StatelessWidget {
  const IconMessage({Key? key, 
    required this.title, 
    required this.subtitle, 
    required this.icon
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,

            Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600
              ),
            ),

            const SizedBox(height: 10),

            Text(subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16
              ),
            )
          ],
        ),
      ),
    );
  }
}