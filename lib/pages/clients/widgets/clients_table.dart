import 'package:another_flushbar/flushbar.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/controllers/service_controller.dart';
import 'package:flutter_web_dashboard/helpers/theme_helper.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:flutter_web_dashboard/widgets/custom_widget.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../widgets/CustomShimmer.dart';

/// Example without datasource
class Clientstable extends StatelessWidget {
  ServiceController serviceController = Get.put(ServiceController());

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
      child: Obx(() => DataTable2(
          columnSpacing: 5,
          horizontalMargin: 12,
          minWidth: 600,
          smRatio: 3 / 4,
          columns: [
            DataColumn2(
              label: Text("Avatar"),
              size: ColumnSize.S,
            ),
            DataColumn2(
              label: Text("Name"),
              size: ColumnSize.S,
            ),
            DataColumn2(
              label: Text('Location'),
              size: ColumnSize.S,
            ),
            DataColumn2(
              label: Text('About'),
              size: ColumnSize.L,
            ),
            DataColumn(
              label: Text('Action'),
            ),
          ],
          rows: serviceController.isLoading.value
              ? shimmerWidget()
              : List<DataRow>.generate(
                  serviceController.fakeUserResponse.value.results!.length,
                  (index) => DataRow(cells: [
                        DataCell(Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network(
                                'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'),
                          ),
                        )),
                        DataCell(CustomText(
                            text: serviceController.fakeUserResponse.value
                                .results![index].name!.first
                                .toString())),
                        DataCell(CustomText(
                            text: serviceController.fakeUserResponse.value
                                .results![index].location!.city)),
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
                        DataCell(Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12.0),
                                        ),
                                      ),
                                      content: Builder(
                                        builder: (context) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            // crossAxisAlignment: CrossAxisAlignment.,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    width: 60,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: Image.network(
                                                          'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
                                                          fit: BoxFit.contain),
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                          serviceController
                                                                  .fakeUserResponse
                                                                  .value
                                                                  .results![
                                                                      index]
                                                                  .name!
                                                                  .first
                                                                  .toString() +
                                                              ' ' +
                                                              serviceController
                                                                  .fakeUserResponse
                                                                  .value
                                                                  .results![
                                                                      index]
                                                                  .name!
                                                                  .last
                                                                  .toString(),
                                                          style: appTheme!
                                                              .text18BolddBlack),
                                                      Text(
                                                          serviceController
                                                              .fakeUserResponse
                                                              .value
                                                              .results![index]
                                                              .location!
                                                              .country!,
                                                          style: appTheme!
                                                              .text14SemiGrey)
                                                    ],
                                                  )
                                                ],
                                              ),
                                              personDataItem(
                                                  'ID',
                                                  serviceController
                                                      .fakeUserResponse
                                                      .value
                                                      .results![index]
                                                      .id!
                                                      .name!),
                                              personDataItem(
                                                  'E-mail',
                                                  serviceController
                                                      .fakeUserResponse
                                                      .value
                                                      .results![index]
                                                      .email!),
                                              personDataItem(
                                                  'Phone-Number',
                                                  serviceController
                                                      .fakeUserResponse
                                                      .value
                                                      .results![index]
                                                      .phone!),
                                              personDataItem(
                                                'Location',
                                                serviceController
                                                        .fakeUserResponse
                                                        .value
                                                        .results![index]
                                                        .location!
                                                        .street!
                                                        .name! +
                                                    ' ' +
                                                    serviceController
                                                        .fakeUserResponse
                                                        .value
                                                        .results![index]
                                                        .location!
                                                        .city! +
                                                    ' ' +
                                                    serviceController
                                                        .fakeUserResponse
                                                        .value
                                                        .results![index]
                                                        .location!
                                                        .state! +
                                                    ' ' +
                                                    serviceController
                                                        .fakeUserResponse
                                                        .value
                                                        .results![index]
                                                        .location!
                                                        .country!,
                                              ),
                                              personDataItem(
                                                'Nationality',
                                                serviceController
                                                    .fakeUserResponse
                                                    .value
                                                    .results![index]
                                                    .nat!,
                                              ),
                                              personDataItem(
                                                'Date of Birth',
                                                DateFormat('dd-MM-yyyy – kk:mm')
                                                    .format(DateTime.parse(
                                                        serviceController
                                                            .fakeUserResponse
                                                            .value
                                                            .results![index]
                                                            .dob!
                                                            .date!)),
                                              ),
                                              personDataItem(
                                                  'Registered on',
                                                  DateFormat(
                                                          'dd-MM-yyyy – kk:mm')
                                                      .format(
                                                    DateTime.parse(
                                                        serviceController
                                                            .fakeUserResponse
                                                            .value
                                                            .results![index]
                                                            .registered!
                                                            .date!),
                                                  ))
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.visibility_outlined,
                                  color: active,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.edit_outlined,
                                  color: Colors.grey,
                                )),
                            IconButton(
                                onPressed: () {
                                  // serviceController
                                  //     .fakeUserResponse.value.results!
                                  //     .where((element) =>
                                  //         element.name!.first ==
                                  //         serviceController
                                  //             .fakeUserResponse
                                  //             .value
                                  //             .results![index]
                                  //             .name!
                                  //             .first!);
                                  // CustomWidgets().showNotification(
                                  //     serviceController.fakeUserResponse.value
                                  //             .results![index].name!.first! +
                                  //         ' deleted',
                                  //     context);
                                  // print(serviceController
                                  //     .fakeUserResponse.value.results!.length);
                                },
                                icon: Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                ))
                          ],
                        )),
                      ])))),
    );
  }

  //Person's data item

  Widget personDataItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: appTheme!.text12RegularGrey,
          ),
          SizedBox(
            width: 50,
          ),
          Text(
            value,
            style: appTheme!.text12SemiBoldBlack,
          )
        ],
      ),
    );
  }

  //Shimmer-loading effect

  List<DataRow> shimmerWidget() => List<DataRow>.generate(
      8,
      (index) => DataRow(cells: [
            DataCell(CustomWidget.rectangular(
              height: 15,
              width: 50,
            )),
            DataCell(
              CustomWidget.rectangular(
                height: 10,
                width: 120,
              ),
            ),
            DataCell(
              CustomWidget.rectangular(
                height: 10,
                width: 120,
              ),
            ),
            DataCell(
              CustomWidget.rectangular(
                height: 10,
                width: 30,
              ),
            ),
          ]));
}
