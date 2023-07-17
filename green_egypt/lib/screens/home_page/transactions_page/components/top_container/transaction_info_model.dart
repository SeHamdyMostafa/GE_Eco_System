import 'package:flutter/material.dart';
import 'package:green_egypt/config/dimensions.dart';

class TransactionInfoModel extends StatelessWidget {
  TransactionInfoModel(
      {required this.date, required this.garbage, required this.points});
  late String date;
  late String garbage;
  late String points;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0XFFEDECEC)),
            child: Icon(
              Icons.recycling_sharp,
              size: 30,
              color: Colors.black,
            ),
          ),
          title: Column(
            children: [
              Text(
                date,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 8,
              )
            ],
          ),
          subtitle: Text(
            garbage,
            style: TextStyle(
                color: Color(0XFFD9D9D9), fontWeight: FontWeight.w500),
          ),
          trailing: Text(
            "${points} point",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),

        /**
                                   * first list tile
                     */
        Divider(
          color: Color(0XFFD9D9D9),
          thickness: 1,
          indent: 20,
          endIndent: 20,
          height: 0.02 * Dimensions.height,
        ),

        /**
                                   * divider
                     */
      ],
    );
  }
}
