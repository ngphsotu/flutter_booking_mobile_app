///Note history_booking_screen.dart

import 'widget/item_history.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bloc/history_booking_bloc.dart';
import 'package:flutter_booking_mobile_app/ui/color.dart';
import 'package:flutter_booking_mobile_app/theme/theme.dart';
import 'package:flutter_booking_mobile_app/base/no_fount.dart';
import 'package:flutter_booking_mobile_app/base/base_bloc.dart';
import 'package:flutter_booking_mobile_app/base/loading_bar.dart';
import 'package:flutter_booking_mobile_app/model/transaction.dart';

///HistoryBookingScreen StatefulWidget
class HistoryBookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

/// _BookingScreenState State<>
class _BookingScreenState extends State<HistoryBookingScreen> {
  ThemeData themeData;
  HistoryBookingBloc historyBookingBloc;

  @override
  void initState() {
    historyBookingBloc = new HistoryBookingBloc()..init();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    themeData = Provider.of<ThemeChanger>(context).getTheme();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          ///Background color
          backgroundColor: themeData.scaffoldBackgroundColor,

          ///Elevation
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              ///Padding
              padding: const EdgeInsets.all(10),
              child: Container(
                ///Container height
                height: 30,

                ///Container width
                width: 30,
                decoration: BoxDecoration(
                  ///Color box
                  color: AppColors.buttonColor,

                  ///Border box
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  ///Icon
                  child: Icon(
                    ///Icon
                    Icons.home,

                    ///Icon color
                    color: themeData.scaffoldBackgroundColor,

                    ///Icon size
                    size: 15,
                  ),
                ),
              ),
            ),
          ),

          ///Title spacing
          titleSpacing: 1,

          ///Title center
          centerTitle: true,

          ///Tittle
          title: Text(
            ///Text
            "History booking".toUpperCase(),
            style: TextStyle(
              ///Text size
              fontSize: 20,

              ///Text color
              color: Colors.black,

              ///Text weight
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        ///Body
        body: Stack(
          children: [
            DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  Padding(
                    ///Padding
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                    child: Container(
                      ///Container width
                      width: double.infinity,
                      child: TabBar(
                        isScrollable: true,
                        labelColor: AppColors.buttonColor,
                        unselectedLabelColor: Colors.grey,
                        indicatorWeight: 2,
                        indicatorColor: AppColors.buttonColor,
                        tabs: [
                          Tab(icon: Text("Waiting")),
                          Tab(icon: Text("Confirmed")),
                          Tab(icon: Text("Accomplished")),
                          Tab(icon: Text("Cancelled")),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        StreamBuilder<List<Transactions>>(
                            stream: historyBookingBloc.historyBookingStream1,
                            builder: (context, snapshot) {
                              if (snapshot.hasData && snapshot.data.length > 0)
                                return Container(
                                    child: SingleChildScrollView(
                                  child: Column(
                                      children: snapshot.data
                                          .map(
                                            (e) => ItemHistory(
                                              themeData,
                                              e,
                                              historyBookingBloc,
                                              isCancel: true,
                                            ),
                                          )
                                          .toList()),
                                ));
                              else
                                return NoFoundWidget("No data");
                            }),
                        StreamBuilder<List<Transactions>>(
                            stream: historyBookingBloc.historyBookingStream2,
                            builder: (context, snapshot) {
                              if (snapshot.hasData && snapshot.data.length > 0)
                                return Container(
                                    child: SingleChildScrollView(
                                  child: Column(
                                      children: snapshot.data
                                          .map(
                                            (e) => ItemHistory(themeData, e,
                                                historyBookingBloc),
                                          )
                                          .toList()),
                                ));
                              else
                                return NoFoundWidget("No data");
                            }),
                        StreamBuilder<List<Transactions>>(
                            stream: historyBookingBloc.historyBookingStream3,
                            builder: (context, snapshot) {
                              if (snapshot.hasData && snapshot.data.length > 0)
                                return Container(
                                    child: SingleChildScrollView(
                                  child: Column(
                                      children: snapshot.data
                                          .map(
                                            (e) => ItemHistory(themeData, e,
                                                historyBookingBloc),
                                          )
                                          .toList()),
                                ));
                              else
                                return NoFoundWidget("No data");
                            }),
                        StreamBuilder<List<Transactions>>(
                            stream: historyBookingBloc.historyBookingStream4,
                            builder: (context, snapshot) {
                              if (snapshot.hasData && snapshot.data.length > 0)
                                return Container(
                                    child: SingleChildScrollView(
                                  child: Column(
                                      children: snapshot.data
                                          .map(
                                            (e) => ItemHistory(themeData, e,
                                                historyBookingBloc),
                                          )
                                          .toList()),
                                ));
                              else
                                return NoFoundWidget("No data");
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder<UIState>(
                stream: historyBookingBloc.historyBookingStateStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data == UIState.LOADING)
                    return LoadingBar();
                  else
                    return Center();
                })
          ],
        ));
  }
}