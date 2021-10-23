import '../../auth/auth_util.dart';
import '../../backend/backend.dart';
import '../flutter_flow/edit_profile_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/urjaa_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'login_page_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfilePageWidget extends StatefulWidget {
  ProfilePageWidget({
    Key key,
    this.userProfile,
  }) : super(key: key);

  final DocumentReference userProfile;

  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      slideOffset: Offset(0, -51),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: SpinKitPumpingHeart(
                color: UrjaaTheme.primaryColor,
                size: 40,
              ),
            ),
          );
        }
        final profilePageUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: UrjaaTheme.background,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 360,
                      decoration: BoxDecoration(
                        color: UrjaaTheme.darkBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: UrjaaTheme.primaryColor,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/UI_avatar_2@3x.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 44,
                                          height: 44,
                                          decoration: BoxDecoration(
                                            color: UrjaaTheme.darkBackground,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: UrjaaTheme.background,
                                              width: 2,
                                            ),
                                          ),
                                          child: IconButton(
                                            onPressed: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditProfileWidget(
                                                    userProfile:
                                                        profilePageUsersRecord
                                                            .reference,
                                                  ),
                                                ),
                                              );
                                            },
                                            icon: Icon(
                                              Icons.edit_outlined,
                                              color: UrjaaTheme.grayLight,
                                              size: 24,
                                            ),
                                            iconSize: 24,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(12, 0, 0, 0),
                                          child: Container(
                                            width: 44,
                                            height: 44,
                                            decoration: BoxDecoration(
                                              color: UrjaaTheme.darkBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: UrjaaTheme.background,
                                                width: 2,
                                              ),
                                            ),
                                            child: IconButton(
                                              onPressed: () async {
                                                await signOut();
                                                await Navigator
                                                    .pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginPageWidget(),
                                                  ),
                                                  (r) => false,
                                                );
                                              },
                                              icon: Icon(
                                                Icons.login_rounded,
                                                color:
                                                    UrjaaTheme.secondaryColor,
                                                size: 24,
                                              ),
                                              iconSize: 24,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    profilePageUsersRecord.displayName,
                                    style: UrjaaTheme.title3.override(
                                      fontFamily: 'Lexend Deca',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                  child: Text(
                                    profilePageUsersRecord.email,
                                    style: UrjaaTheme.bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: UrjaaTheme.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 12, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Ailments',
                                    textAlign: TextAlign.start,
                                    style: UrjaaTheme.bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 8, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: AutoSizeText(
                                      profilePageUsersRecord.ailments,
                                      style: UrjaaTheme.title3.override(
                                        fontFamily: 'Lexend Deca',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Past Appointments',
                            style: UrjaaTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: StreamBuilder<List<AppointmentsRecord>>(
                        stream: queryAppointmentsRecord(
                          queryBuilder: (appointmentsRecord) =>
                              appointmentsRecord.where('appointmentTime',
                                  isLessThan: getCurrentTimestamp),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: SpinKitPumpingHeart(
                                  color: UrjaaTheme.primaryColor,
                                  size: 40,
                                ),
                              ),
                            );
                          }
                          List<AppointmentsRecord>
                              listViewAppointmentsRecordList = snapshot.data;
                          // Customize what your widget looks like with no query results.
                          if (snapshot.data.isEmpty) {
                            return Container(
                              height: 100,
                              child: Center(
                                child: Text('No results.'),
                              ),
                            );
                          }
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewAppointmentsRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewAppointmentsRecord =
                                  listViewAppointmentsRecordList[listViewIndex];
                              return Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            4, 0, 0, 0),
                                                    child: Text(
                                                      '[Appointment Type]',
                                                      style: UrjaaTheme.title3
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
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
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 8, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Card(
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    color:
                                                        UrjaaTheme.background,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              8, 4, 8, 4),
                                                      child: Text(
                                                        '[date_time]',
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
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            8, 0, 0, 0),
                                                    child: Text(
                                                      'For',
                                                      style: UrjaaTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            4, 0, 0, 0),
                                                    child: Text(
                                                      '[display_name]',
                                                      style: UrjaaTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: UrjaaTheme
                                                            .secondaryColor,
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
                          ).animated(
                              [animationsMap['listViewOnPageLoadAnimation']]);
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
