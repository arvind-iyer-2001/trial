import 'package:firebase_auth/firebase_auth.dart';

import 'appointment_details_widget.dart';
import '../../backend/backend.dart';
import '../components/book_appointment_widget.dart';
import '../flutter_flow/urjaa_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppointmentsWidget extends StatefulWidget {
  MyAppointmentsWidget({Key key}) : super(key: key);

  @override
  _MyAppointmentsWidgetState createState() => _MyAppointmentsWidgetState();
}

class _MyAppointmentsWidgetState extends State<MyAppointmentsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: UrjaaTheme.background,
        automaticallyImplyLeading: false,
        title: Text(
          'Appointments',
          style: UrjaaTheme.title1.override(
            fontFamily: 'Lexend Deca',
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: UrjaaTheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          // await showModalBottomSheet(
          //   isScrollControlled: true,
          //   context: context,
          //   builder: (context) {
          //     return Container(
          //       height: 720,
          //       child: BookAppointmentWidget(),
          //     );
          //   },
          // );
        },
        backgroundColor: UrjaaTheme.primaryColor,
        elevation: 8,
        child: Icon(
          Icons.add_rounded,
          color: UrjaaTheme.textColor,
          size: 36,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'My Appointments',
                    style: UrjaaTheme.bodyText1.override(
                      fontFamily: 'Lexend Deca',
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<List<AppointmentsRecord>>(
                stream: queryAppointmentsRecord(
                  queryBuilder: (appointmentsRecord) =>
                      appointmentsRecord.orderBy('appointmentTime'),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: SpinKitPumpingHeart(
                          color: Color(0xFFFB5153),
                          size: 40,
                        ),
                      ),
                    );
                  }
                  List<AppointmentsRecord> listViewAppointmentsRecordList =
                      snapshot.data;
                  if (listViewAppointmentsRecordList.isEmpty) {
                    return Center(
                      child: Image.asset(
                        'assets/images/noAppointments.png',
                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewAppointmentsRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewAppointmentsRecord =
                          listViewAppointmentsRecordList[listViewIndex];
                      return Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
                        child: StreamBuilder<AppointmentsRecord>(
                          stream: AppointmentsRecord.getDocument(
                              listViewAppointmentsRecord.reference),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: SpinKitPumpingHeart(
                                    color: Color(0xFFFB5153),
                                    size: 40,
                                  ),
                                ),
                              );
                            }
                            final appointmentCardAppointmentsRecord =
                                snapshot.data;
                            return InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AppointmentDetailsWidget(
                                      appointmentDetails:
                                          appointmentCardAppointmentsRecord
                                              .reference,
                                    ),
                                  ),
                                );
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: UrjaaTheme.darkBackground,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(12, 12, 12, 12),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      4, 0, 0, 0),
                                                  child: Text(
                                                    listViewAppointmentsRecord
                                                        .appointmentType,
                                                    style: UrjaaTheme.title3
                                                        .override(
                                                      fontFamily: 'Lexend Deca',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.chevron_right_rounded,
                                                color: UrjaaTheme.grayLight,
                                                size: 24,
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 8, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: UrjaaTheme.background,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            8, 4, 8, 4),
                                                    child: Text(
                                                      dateTimeFormat(
                                                          'MMMMEEEEd',
                                                          listViewAppointmentsRecord
                                                              .appointmentTime),
                                                      style: UrjaaTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: UrjaaTheme
                                                            .textColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      8, 0, 0, 0),
                                                  child: Text(
                                                    'For',
                                                    style: UrjaaTheme.bodyText1
                                                        .override(
                                                      fontFamily: 'Lexend Deca',
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            4, 0, 0, 0),
                                                    child: Text(
                                                      listViewAppointmentsRecord
                                                          .appointmentName,
                                                      style: UrjaaTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: UrjaaTheme
                                                            .secondaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
