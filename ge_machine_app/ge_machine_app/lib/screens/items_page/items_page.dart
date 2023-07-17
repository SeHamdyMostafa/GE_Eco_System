import 'package:flutter/material.dart';
import 'package:ge_machine_app/dimensions.dart';
import 'package:ge_machine_app/screens/items_page/did_you_finished_row.dart';
import 'package:ge_machine_app/screens/items_page/generate_qrcode_button.dart';
import 'package:ge_machine_app/screens/items_page/items_counters_container.dart';
import 'package:ge_machine_app/screens/items_page/items_page_background.dart';


class ItemsPage extends StatelessWidget {
  int _pageIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: DeviceDimensions.height,
      width: DeviceDimensions.width,
      child: Stack(
        children: [
          ItemsPageBackground(),
          Row(
            children: [
              Expanded(child: SizedBox()),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Items that you collect',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    /**
                               * items counters container that contain Plastic , cans and points .
                               */
                    ItemsCountersContainer(),
                    SizedBox(
                      height: 48,
                    ),
                    /**
                               * ---------------- did you finished Row ------------------
                               */
                    DidYouFinishedRow(),
                    SizedBox(
                      height: 48,
                    ),
                    GenerateQrcodeButton(),
                    SizedBox(
                      height: DeviceDimensions.height * .18,
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
