import 'package:flutter/material.dart';
import 'package:green_egypt/config/dimensions.dart';

class FriendlyTipsItem extends StatelessWidget {
  String tipImagePath;
  String tipTitle;
  String tipSubtitle;
  FriendlyTipsItem(
      {required this.tipTitle,
      required this.tipSubtitle,
      required this.tipImagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 12,
        ),
        ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          leading: Image.asset(tipImagePath, width: Dimensions.width * .1),
          title: Text(tipTitle),
          subtitle: Text(
            tipSubtitle,
            style: TextStyle(color: Colors.grey[500], fontSize: 14),
          ),
        ),
      ],
    );
  }
}
