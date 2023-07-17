import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WasteCategoryView extends StatelessWidget {
  String imagePath;
  String heroTag;
  WasteCategoryView({required this.imagePath, required this.heroTag});
  /**
   * Salah will implement this page 
   * AMG : 04/02/2023 12:54 AM
   * Salah Finish : 
   */
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      /**
       * Container that contain Steps of Recycling Item .
       */
      GetBuilder<ApplicationThemeController>(builder: (themeController) {
        return Container(
          width: Dimensions.width,
          // height: Dimensions.height * 0.55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32)),
            color: themeController.isDark ? Colors.black : Color(0xfff7f5f5),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                SizedBox(
                  height: Dimensions.height * .03,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 8,
                    width: Dimensions.width * .2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[350]!.withOpacity(.9)),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height * .03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Dimensions.width * 0.04,
                    ),
                    Text(
                      'How to recycle'.tr + " " + heroTag,
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 22.sp,
                      ),
                    ),
                  ],
                ),

                /**
                       * first tip to how to recycle paper
                        */

                SizedBox(
                  height: Dimensions.width * .04,
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(
                    top: Dimensions.height * .001,
                    left: Dimensions.width * .03,
                    right: Dimensions.width * .02,
                  ),
                  leading: Text(
                    "1.",
                    style: TextStyle(
                        color: Color(0xffa0cc00),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  ),
                  title: Text(
                    '1.plastic'.tr, // textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: Color.fromARGB(255, 122, 116, 116),
                    ),
                  ),
                ),

                /**
                       * Second tip to how to recycle paper
                        */

                SizedBox(
                  height: Dimensions.width * .04,
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(
                    top: Dimensions.height * .001,
                    left: Dimensions.width * .03,
                    right: Dimensions.width * .02,
                  ),
                  leading: Text(
                    "2.",
                    style: TextStyle(
                        color: Color(0xffa0cc00),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  ),
                  title: Text(
                    '2.plastic'.tr, // textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: Color.fromARGB(255, 122, 116, 116),
                    ),
                  ),
                ),

                /**
                       * Third tip to how to recycle paper
                        */

                SizedBox(
                  height: Dimensions.width * .04,
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(
                    top: Dimensions.height * .001,
                    left: Dimensions.width * .03,
                    right: Dimensions.width * .02,
                  ),
                  leading: Text(
                    "3.",
                    style: TextStyle(
                        color: Color(0xffa0cc00),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  ),
                  title: Text(
                    '3.plastic'.tr, // textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: Color.fromARGB(255, 122, 116, 116),
                    ),
                  ),
                ),

                /**
                       * Third tip to how to recycle paper
                        */
                SizedBox(
                  height: Dimensions.width * .04,
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(
                    top: Dimensions.height * .001,
                    left: Dimensions.width * .03,
                    right: Dimensions.width * .02,
                  ),
                  leading: Text(
                    "4.",
                    style: TextStyle(
                        color: Color(0xffa0cc00),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  ),
                  title: Text(
                    '4.plastic'.tr, // textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: Color.fromARGB(255, 122, 116, 116),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      })
    ];
    return GetBuilder<ApplicationThemeController>(builder: (themeController) {
      return Scaffold(
          backgroundColor:
              themeController.isDark ? Colors.grey[850] : Color(0xfff7f5f5),
          body: SafeArea(
            child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    /**
                     * upper Container that hold image if item .
                     */
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      centerTitle: true,
                      expandedHeight: Dimensions.height * 0.45,
                      backgroundColor: themeController.isDark
                          ? Colors.grey[850]
                          : Color(0xfff7f5f5),
                      flexibleSpace: Container(
                        child: FlexibleSpaceBar(
                          background: Stack(
                            children: [
                              Positioned(
                                top: 10,
                                left: 20,
                                child: TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[350]!.withOpacity(.8),
                                      // Colors.grey[350]!.withOpacity(.8)
                                    ),
                                    child: Icon(
                                      Icons.arrow_back_rounded,
                                      size: 22.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  child: Hero(
                                    tag: heroTag,
                                    child: Image(
                                      width: 72.w,
                                      image: AssetImage(
                                        imagePath,
                                      ),
                                      fit: BoxFit.cover,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: list[0]),
          ));
    });
  }
}
