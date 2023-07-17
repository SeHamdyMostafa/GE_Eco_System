import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/services/boxes/user_data_db.dart';

class PointStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PointInfo(
          title: 'collect:'.tr,
          value: UserDataBox.instance.get_recycledItems().toString(),
        ),
        PointInfo(
          title: 'Earned:'.tr,
          value: UserDataBox.instance.get_totalPoints().toString() + " \$",
        ),
      ],
    );
  }
}

class PointInfo extends StatelessWidget {
  const PointInfo({
    required this.title,
    required this.value,
  });

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(title + '\n', style: TextStyle(fontSize: 14)),
      Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
    ]);
  }
}
