import 'dart:math';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/controllers/service_controller.dart';
import 'package:flutter_web_dashboard/helpers/theme_helper.dart';
import 'package:flutter_web_dashboard/widgets/CustomShimmer.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';

/// Example without datasource
class AvailableEnquiryTable extends StatelessWidget {
  ServiceController serviceController = Get.put(ServiceController());
  final _random = Random();

  Map<String, Color> colorlist = {
    'REJECTED': Colors.red,
    'NEW': Colors.blue,
    'INPROGRESS': Colors.orange,
    'COMPLETED': Colors.black
  };

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: active.withOpacity(.4), width: .5),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 6),
                color: lightGrey.withOpacity(.1),
                blurRadius: 12)
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 30),
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  CustomText(
                    text: "Latest enquiries",
                    color: lightGrey,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
              DataTable2(
                  columnSpacing: 5,
                  horizontalMargin: 12,
                  minWidth: 600,
                  smRatio: 3 / 4,
                  columns: [
                    DataColumn2(
                      label: Text("Id"),
                      size: ColumnSize.S,
                    ),
                    DataColumn2(
                      label: Text('Name'),
                      size: ColumnSize.S,
                    ),
                    DataColumn2(
                      label: Text('Description'),
                      size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text('Status'),
                      size: ColumnSize.S,
                    ),
                    DataColumn(
                      label: Text('Action'),
                    ),
                  ],
                  rows: serviceController.isLoading.value
                      ? shimmerWidget()
                      : List<DataRow>.generate(
                          serviceController.demoResponse.value.data!.length,
                          (index) => DataRow(cells: [
                                DataCell(CustomText(
                                    text: serviceController
                                        .demoResponse.value.data![index].trips
                                        .toString())),
                                DataCell(CustomText(
                                    text: serviceController
                                        .demoResponse.value.data![index].name)),
                                DataCell(
                                  Container(
                                    width: 250,
                                    // height: 60,
                                    child: CustomText(
                                      text:
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur aliquam mauris facilisis arcu faucibus,',
                                    ),
                                  ),
                                ),
                                DataCell(Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: colorlist.values
                                          .toList()[_random.nextInt(3)]
                                          .withOpacity(0.2)),
                                  child: Text(
                                    colorlist.keys.toList()[_random.nextInt(3)],
                                    style: appTheme!.text12SemiBoldBlack,
                                  ),
                                )),
                                DataCell(Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        decoration: BoxDecoration(
                                          color: light,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: active, width: .5),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 6),
                                        child: CustomText(
                                          text: "View",
                                          size: 12,
                                          color: active.withOpacity(.7),
                                          weight: FontWeight.bold,
                                        )),
                                    Container(
                                        decoration: BoxDecoration(
                                          color: light,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: active, width: .5),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 6),
                                        child: CustomText(
                                          text: "Assign",
                                          size: 12,
                                          color: active.withOpacity(.7),
                                          weight: FontWeight.bold,
                                        )),
                                  ],
                                )),
                              ]))),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      serviceController.page.value--;
                      serviceController.getDummyData().whenComplete(
                          () => serviceController.isLoading.value = false);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Icon(Icons.chevron_left_sharp),
                          Text('Prev')
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // width: MediaQuery.of(context).size.width * 0.30,
                    // height: MediaQuery.of(context).size.height * 0.10,
                    width: 100,
                    height: 40,
                    child: ListView.builder(
                      itemCount:
                          serviceController.demoResponse.value.totalPages,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) => InkWell(
                        onTap: () {
                          serviceController.page.value = index;
                          serviceController.getDummyData().whenComplete(
                              () => serviceController.isLoading.value = false);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: serviceController.page.value + 1 ==
                                      (index + 1)
                                  ? appTheme!.colorPrimary.withOpacity(0.5)
                                  : Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text((index + 1).toString()),
                        ),
                      ),
                    ),
                  ),
                  // Text((serviceController.demoResponse.value.totalPages)
                  //     .toString()),
                  InkWell(
                    onTap: () {
                      serviceController.page.value++;
                      serviceController.getDummyData().whenComplete(
                          () => serviceController.isLoading.value = false);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Icon(Icons.chevron_right_sharp),
                          Text('Next')
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  List<DataRow> shimmerWidget() => List<DataRow>.generate(
      8,
      (index) => DataRow(cells: [
            DataCell(CustomWidget.rectangular(
              height: 15,
              width: 30,
            )),
            DataCell(
              CustomWidget.rectangular(
                height: 10,
                width: 100,
              ),
            ),
            DataCell(
              CustomWidget.rectangular(
                height: 10,
                width: 100,
              ),
            ),
            DataCell(
              CustomWidget.rectangular(
                height: 10,
                width: 100,
              ),
            ),
            DataCell(
              Row(
                children: [
                  CustomWidget.rectangular(
                    height: 10,
                    width: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CustomWidget.rectangular(
                    height: 10,
                    width: 30,
                  ),
                ],
              ),
            ),
          ]));
}
