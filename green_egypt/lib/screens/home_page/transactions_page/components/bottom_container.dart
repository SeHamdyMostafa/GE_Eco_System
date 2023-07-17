import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/screens/home_page/transactions_page/components/top_container/transaction_info_model.dart';
import 'package:green_egypt/services/boxes/transactions_box.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionsBox>(
      init: TransactionsBox.instance,
      builder: (transactionsBoxController) {
        return Container(
          width: Dimensions.width,
          height: 0.4 * Dimensions.height,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 16, left: 16, top: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transactions'.tr,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount:
                      transactionsBoxController.allStoredTransactions.length,
                  itemBuilder: (context, index) {
                    return TransactionInfoModel(
                        date: transactionsBoxController
                            .allStoredTransactions[index]['date'],
                        garbage:
                            'Plastic : ${transactionsBoxController.allStoredTransactions[index]['plastic']} , Cans :  ${transactionsBoxController.allStoredTransactions[index]['cans']}'
                                .tr,
                        points:
                            '${transactionsBoxController.allStoredTransactions[index]['points']}'
                                .tr);
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
