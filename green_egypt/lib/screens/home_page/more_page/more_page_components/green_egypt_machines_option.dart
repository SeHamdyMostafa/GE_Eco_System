import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GreenEgyptMachinesOption extends StatelessWidget {
  const GreenEgyptMachinesOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      leading: Icon(
        Icons.location_on_outlined,
        color: Colors.green,
      ),
      title: Text('Green Egypt machines Locations'.tr),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 18.sp,
        color: Colors.grey,
      ),
    );
  }
}
