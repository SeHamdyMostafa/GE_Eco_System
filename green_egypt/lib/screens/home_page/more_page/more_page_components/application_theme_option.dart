import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';

class ApplicationThemeOption extends StatefulWidget {
  late bool darkThemeBool;
  late ApplicationThemeController applicationThemeController;
  ApplicationThemeOption(
      {required this.darkThemeBool, required this.applicationThemeController});

  @override
  State<ApplicationThemeOption> createState() => _ApplicationThemeOptionState();
}

class _ApplicationThemeOptionState extends State<ApplicationThemeOption> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        horizontalTitleGap: 0,
        onTap: () async {
          await widget.applicationThemeController.changeApplicationTheme(
              newValue: !ApplicationThemeController.instance.isDark);

          setState(() {
            widget.darkThemeBool = !ApplicationThemeController.instance.isDark;
          });
        },
        leading: Icon(
          Icons.nightlight_outlined,
          color: Colors.blueAccent,
        ),
        title: Text('Dark Mode'.tr),
        trailing: CupertinoSwitch(
          onChanged: (value) async {
            await widget.applicationThemeController
                .changeApplicationTheme(newValue: value);

            setState(() {
              widget.darkThemeBool = value;
            });
          },
          value: widget.darkThemeBool,
        ));
  }
}
