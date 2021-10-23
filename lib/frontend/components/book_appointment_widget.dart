import '../../auth/auth_util.dart';
import '../../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/urjaa_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BookAppointmentWidget extends StatefulWidget {
  BookAppointmentWidget({
    Key key,
    this.userProfile,
  }) : super(key: key);

  final DocumentReference userProfile;

  @override
  _BookAppointmentWidgetState createState() => _BookAppointmentWidgetState();
}

class _BookAppointmentWidgetState extends State<BookAppointmentWidget>
    with TickerProviderStateMixin {
  DateTime datePicked;
  String dropDownValue;
  TextEditingController personsNameController;
  TextEditingController problemDescriptionController;
  final animationsMap = {
    'textFieldOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      slideOffset: Offset(0, -9),
    ),
    'dropDownOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 40,
      fadeIn: true,
      slideOffset: Offset(0, -20),
    ),
    'textFieldOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 60,
      fadeIn: true,
      slideOffset: Offset(0, -30),
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      slideOffset: Offset(0, -90),
    ),
    'buttonOnPageLoadAnimation1': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 150,
      fadeIn: true,
      slideOffset: Offset(0, -20),
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 150,
      fadeIn: true,
      slideOffset: Offset(0, -20),
    ),
  };

  @override
  void initState() {
    super.initState();
    startAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    problemDescriptionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: UrjaaTheme.darkBackground,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: StreamBuilder<UsersRecord>(
          stream: UsersRecord.getDocument(currentUserReference),
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
            final columnUsersRecord = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    thickness: 3,
                    indent: 150,
                    endIndent: 150,
                    color: Color(0xFF465056),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Text(
                      'Book Appointment',
                      style: UrjaaTheme.title3.override(
                        fontFamily: 'Lexend Deca',
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Text(
                            'Fill out the information below in order to book your appointment with our office.',
                            style: UrjaaTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: Text(
                      'Emails will be sent to:',
                      style: UrjaaTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 4, 0, 12),
                    child: Text(
                      currentUserEmail,
                      style: UrjaaTheme.subtitle1.override(
                        fontFamily: 'Lexend Deca',
                        color: UrjaaTheme.primaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: TextFormField(
                      controller: personsNameController ??=
                          TextEditingController(
                        text: columnUsersRecord.displayName,
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Booking For',
                        labelStyle: UrjaaTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: UrjaaTheme.background,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: UrjaaTheme.background,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: UrjaaTheme.darkBackground,
                        contentPadding: EdgeInsets.fromLTRB(20, 24, 0, 24),
                      ),
                      style: UrjaaTheme.subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: UrjaaTheme.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ).animated(
                        [animationsMap['textFieldOnPageLoadAnimation1']]),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: FlutterFlowDropDown(
                      options: [
                        'Type of Appointment',
                        'New Patient',
                        'Follow Up',
                        'Enquiry'
                      ].toList(),
                      onChanged: (value) {
                        setState(() => dropDownValue = value);
                      },
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      textStyle: UrjaaTheme.subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: UrjaaTheme.textColor,
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: UrjaaTheme.grayLight,
                        size: 15,
                      ),
                      fillColor: UrjaaTheme.darkBackground,
                      elevation: 3,
                      borderColor: UrjaaTheme.background,
                      borderWidth: 2,
                      borderRadius: 8,
                      margin: EdgeInsets.fromLTRB(20, 4, 16, 4),
                      hidesUnderline: true,
                    ).animated([animationsMap['dropDownOnPageLoadAnimation']]),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: TextFormField(
                      controller: problemDescriptionController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'What\'s the problem?',
                        labelStyle: UrjaaTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: UrjaaTheme.background,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: UrjaaTheme.background,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: UrjaaTheme.darkBackground,
                        contentPadding: EdgeInsets.fromLTRB(20, 24, 0, 24),
                      ),
                      style: UrjaaTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: UrjaaTheme.textColor,
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 8,
                      keyboardType: TextInputType.multiline,
                    ).animated(
                        [animationsMap['textFieldOnPageLoadAnimation2']]),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        await DatePicker.showDatePicker(
                          context,
                          showTitleActions: true,
                          onConfirm: (date) {
                            setState(() => datePicked = date);
                          },
                          currentTime: DateTime.now(),
                        );
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 60,
                          decoration: BoxDecoration(
                            color: UrjaaTheme.darkBackground,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: UrjaaTheme.background,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      child: Text(
                                        'Choose Date',
                                        style: UrjaaTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(20, 4, 0, 0),
                                      child: Text(
                                        dateTimeFormat('MMMMEEEEd', datePicked),
                                        style: UrjaaTheme.bodyText2.override(
                                          fontFamily: 'Lexend Deca',
                                          color: UrjaaTheme.tertiaryColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                      icon: Icon(
                                        Icons.date_range_outlined,
                                        color: UrjaaTheme.grayLight,
                                        size: 20,
                                      ),
                                      iconSize: 20,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ).animated([animationsMap['containerOnPageLoadAnimation']]),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 24, 0, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Cancel',
                          options: FFButtonOptions(
                            width: 100,
                            height: 50,
                            color: UrjaaTheme.background,
                            textStyle: UrjaaTheme.subtitle2.override(
                              fontFamily: 'Lexend Deca',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            elevation: 0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 8,
                          ),
                        ).animated(
                            [animationsMap['buttonOnPageLoadAnimation1']]),
                        FFButtonWidget(
                          onPressed: () async {
                            final appointmentsCreateData =
                                createAppointmentsRecordData(
                              appointmentType: dropDownValue,
                              appointmentTime: datePicked,
                              appointmentName:
                                  personsNameController?.text ?? '',
                              appointmentDescription:
                                  problemDescriptionController.text,
                              appointmentEmail: currentUserEmail,
                            );
                            await AppointmentsRecord.collection
                                .doc()
                                .set(appointmentsCreateData);
                            Navigator.pop(context);
                          },
                          text: 'Book Now',
                          options: FFButtonOptions(
                            width: 150,
                            height: 50,
                            color: UrjaaTheme.primaryColor,
                            textStyle: UrjaaTheme.subtitle2.override(
                              fontFamily: 'Lexend Deca',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 8,
                          ),
                        ).animated(
                            [animationsMap['buttonOnPageLoadAnimation2']])
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
