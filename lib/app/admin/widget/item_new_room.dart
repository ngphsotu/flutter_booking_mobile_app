///Note file item_user_room.dart

import 'package:flutter/material.dart';
import 'package:flutter_booking_mobile_app/ui/color.dart';
import 'package:flutter_booking_mobile_app/model/room.dart';
import 'package:flutter_booking_mobile_app/base/x_button.dart';
import 'package:flutter_booking_mobile_app/app/admin/bloc/admin_bloc.dart';
import 'package:flutter_booking_mobile_app/app/history_booking/child_screen/detail_history_room.dart';

/// ItemNewRoom StatelessWidget
class ItemNewRoom extends StatelessWidget {
  ///themeData
  final ThemeData themeData;

  ///room
  final Room room;

  ///adminBloc
  final AdminBloc adminBloc;

  ItemNewRoom(this.themeData, this.room, this.adminBloc);

  @override
  Widget build(BuildContext context) {
    return Container(
      ///Container height
      height: 150,

      ///Container margin
      margin: const EdgeInsets.all(10),

      decoration: BoxDecoration(
        ///Color box
        color: themeData.scaffoldBackgroundColor,

        ///Border box
        borderRadius: BorderRadius.circular(10),

        ///boxShadow
        boxShadow: [
          BoxShadow(
            ///color
            color: Colors.grey.withOpacity(0.5),

            ///spreadRadius
            spreadRadius: 3,

            ///blurRadius
            blurRadius: 5,

            ///offset
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),

      child: Row(
        children: [
          Expanded(
            ///Flex
            flex: 1,

            child: Container(
              ///decoration
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  ///topLeft
                  topLeft: Radius.circular(10),

                  ///bottomLeft
                  bottomLeft: Radius.circular(10),
                ),

                ///Image
                image: DecorationImage(
                  ///Image
                  image: NetworkImage(room.urlImage),

                  ///Image fit
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            ///Flex
            flex: 4,

            child: Padding(
              ///Padding
              padding: const EdgeInsets.all(10),

              child: Column(
                ///Using mainAxisAlignment in a Column will align its children vertically.
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                ///Using crossAxisAlignment in a Column will determines how the children are horizontally aligned in that Column.
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    children: [
                      Expanded(
                        ///Flex
                        flex: 5,

                        child: Text(
                          ///Text
                          room.nameRoom.toUpperCase(),

                          ///Used maxLines to determine the maximum display number of text if the text number is exceeded with maxLines, it will be shortly cut based on the overflow attribute.
                          maxLines: 1,

                          style: TextStyle(
                            ///Text weight
                            fontWeight: FontWeight.w800,

                            ///Text size
                            fontSize: 17,

                            ///Spacing
                            letterSpacing: 1.6,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: GestureDetector(
                          ///onTap
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  ///Return DetailsRoomHistoryScreen
                                  return DetailsRoomHistoryScreen(room: room);
                                },
                              ),
                            );
                          },

                          child: Icon(
                            ///Icon
                            Icons.error,

                            ///Icon color
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        ///Flex
                        flex: 2,

                        child: Text(
                          ///Text
                          "${room.numberAdults} Adults - ${room.numberChild} Children",

                          ///Text align
                          textAlign: TextAlign.start,

                          ///Used maxLines to determine the maximum display number of text if the text number is exceeded with maxLines, it will be shortly cut based on the overflow attribute.
                          maxLines: 1,

                          style: TextStyle(
                            ///Text weight
                            fontWeight: FontWeight.w500,

                            ///Text size
                            fontSize: 15,

                            ///Text spacing
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Expanded(
                        ///Flex
                        flex: 1,

                        child: Text(
                          ///Text
                          "x${room.numberRoom} Room",

                          ///Used maxLines to determine the maximum display number of text if the text number is exceeded with maxLines, it will be shortly cut based on the overflow attribute.
                          maxLines: 1,

                          ///Text align
                          textAlign: TextAlign.start,

                          style: TextStyle(
                            ///Text weight
                            fontWeight: FontWeight.w600,

                            ///Text size
                            fontSize: 15,

                            ///Text style
                            fontStyle: FontStyle.italic,

                            ///Text color
                            color: Colors.grey,

                            ///Text spacing
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      room.discount != 0
                          ? Expanded(
                              ///Flex
                              flex: 1,

                              child: Text(
                                ///Text
                                "${room.money.toInt()}\$",

                                ///Text align
                                textAlign: TextAlign.start,

                                ///Used maxLines to determine the maximum display number of text if the text number is exceeded with maxLines, it will be shortly cut based on the overflow attribute.
                                maxLines: 1,

                                style: TextStyle(
                                  ///Text color
                                  color: AppColors.primaryColor,

                                  ///Text weight
                                  fontWeight: FontWeight.w800,

                                  ///Text size
                                  fontSize: 15,

                                  ///decoration
                                  decoration: TextDecoration.lineThrough,

                                  ///Text spacing
                                  letterSpacing: 1,
                                ),
                              ),
                            )
                          : SizedBox(),

                      const SizedBox(
                        width: 5,
                      ),

                      Expanded(
                        ///Flex
                        flex: 1,

                        child: Text(
                          ///Text
                          "${(room.money - room.money * room.discount / 100).toInt()}\$",

                          ///Text align
                          textAlign: TextAlign.start,

                          ///Used maxLines to determine the maximum display number of text if the text number is exceeded with maxLines, it will be shortly cut based on the overflow attribute.
                          maxLines: 1,

                          style: TextStyle(
                            ///Text color
                            color: AppColors.primaryColor,

                            ///Text weight
                            fontWeight: FontWeight.w900,

                            ///Text size
                            fontSize: 18,

                            ///Text spacing
                            letterSpacing: 1,
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: 10,
                      ),

                      ///Browse button
                      Expanded(
                        flex: 1,
                        child: XButton(
                          "Ok",
                          () {
                            adminBloc.updateStatusRoomById(room.idRoom, 2);
                          },
                          color: AppColors.primaryColor,
                          height: 40,
                        ),
                      ),

                      const SizedBox(
                        width: 10,
                      ),

                      ///Cancel button
                      Expanded(
                        ///Flex
                        flex: 1,

                        child: XButton(
                          "Cancel",
                          () {
                            adminBloc.updateStatusRoomById(room.idRoom, 0);
                          },

                          ///Color button
                          color: Colors.grey,

                          ///Height button
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
