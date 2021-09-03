import 'package:trial/backend/firebase_storage/pdfupload.dart';

import 'add_another_profile_widget.dart';
import '../../auth/auth_util.dart';
import '../../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CompleteProfileWidget extends StatefulWidget {
  CompleteProfileWidget({
    Key key,
    this.height,
    this.weight,
    this.contact,
  }) : super(key: key);

  final double height;
  final double weight;
  final String contact;

  @override
  _CompleteProfileWidgetState createState() => _CompleteProfileWidgetState();
}

class _CompleteProfileWidgetState extends State<CompleteProfileWidget>
    with TickerProviderStateMixin {
  String radioButtonValue;
  TextEditingController yourNameController;
  TextEditingController contactController;
  TextEditingController ailmentsController;
  TextEditingController routineController;
  TextEditingController heightController;
  TextEditingController weightController;
  TextEditingController dobController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'circleImageOnPageLoadAnimation': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      slideOffset: Offset(0, -19),
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 50,
      fadeIn: true,
      slideOffset: Offset(0, -20),
    ),
    'textFieldOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 100,
      fadeIn: true,
      slideOffset: Offset(0, -20),
    ),
    'textFieldOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 100,
      fadeIn: true,
      slideOffset: Offset(0, -20),
    ),
    'textFieldOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 200,
      fadeIn: true,
      slideOffset: Offset(0, -60),
    ),
    'textFieldOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 200,
      fadeIn: true,
      slideOffset: Offset(0, -60),
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 250,
      fadeIn: true,
      slideOffset: Offset(0, -50),
    ),
    'radioButtonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 300,
      fadeIn: true,
      slideOffset: Offset(0, -50),
    ),
    'buttonOnPageLoadAnimation1': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 400,
      fadeIn: true,
      slideOffset: Offset(0, -40),
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 350,
      fadeIn: true,
      slideOffset: Offset(0, -40),
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

    ailmentsController = TextEditingController();
    yourNameController = TextEditingController();
    contactController = TextEditingController(text: currentPhoneNumber);
    routineController = TextEditingController();
    weightController = TextEditingController();
    heightController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1F24),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.grayLight,
            size: 32,
          ),
        ),
        title: Text(
          'Complete Profile',
          style: FlutterFlowTheme.title3.override(
            fontFamily: 'Lexend Deca',
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.background,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: Image.asset(
                'assets/images/page_background.png',
              ).image,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  onTap: () async {
                    final selectedMedia =
                        await selectMediaWithSourceBottomSheet(
                      context: context,
                    );
                    if (selectedMedia != null &&
                        validateFileFormat(
                            selectedMedia.storagePath, context)) {
                      showUploadMessage(context, 'Uploading file...',
                          showLoading: true);

                      final result = FileUpload("").getPdfAndUpload();
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      if (result != null) {
                        showUploadMessage(context, 'Success!');
                      } else {
                        showUploadMessage(context, 'Failed to upload media');
                        return;
                      }
                    }
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/uiAvatar@2x.png',
                    ),
                  ),
                ).animated([animationsMap['circleImageOnPageLoadAnimation']]),
                Text(
                  'Upload a photo for us to easily identify you.',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Lexend Deca',
                  ),
                ).animated([animationsMap['textOnPageLoadAnimation1']]),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: yourNameController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Your Name',
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.grayLight,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.darkBackground,
                      contentPadding: EdgeInsets.fromLTRB(20, 24, 20, 24),
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'This Field is Required';
                      }
                      return null;
                    },
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: FlutterFlowTheme.textColor,
                    ),
                  ).animated([animationsMap['textFieldOnPageLoadAnimation1']]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: contactController,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Contact Number',
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.grayLight,
                      ),
                      hintText: 'e.g. +91 9284735115',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0x98FFFFFF),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.darkBackground,
                      contentPadding: EdgeInsets.fromLTRB(20, 24, 20, 24),
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'This Field is Required';
                      }
                      return null;
                    },
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: FlutterFlowTheme.textColor,
                    ),
                  ).animated([animationsMap['textFieldOnPageLoadAnimation2']]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: ailmentsController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Ailments',
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.grayLight,
                      ),
                      hintText:
                          'e.g. Acne, Body Pain, Acid Reflux, Diabetes, Hairfall...',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0x98FFFFFF),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.darkBackground,
                      contentPadding: EdgeInsets.fromLTRB(20, 24, 20, 24),
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'This Field is Required';
                      }
                      return null;
                    },
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lexend Deca',
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ).animated([animationsMap['textFieldOnPageLoadAnimation3']]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: routineController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Your Daily Routine in Brief.',
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.grayLight,
                      ),
                      hintText:
                          'e.g. Wake up at 7am. Breakfast at 8am. To work at 9am. Tea break at 10am. Lunch at 1pm....',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0x98FFFFFF),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.darkBackground,
                      contentPadding: EdgeInsets.fromLTRB(20, 24, 20, 24),
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'This Field is Required';
                      }
                      return null;
                    },
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lexend Deca',
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 5,
                  ).animated([animationsMap['textFieldOnPageLoadAnimation4']]),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 12, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Your Birth Sex',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                        ),
                      ).animated([animationsMap['textOnPageLoadAnimation2']])
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 12, 20, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: FlutterFlowRadioButton(
                          options: ['Male', 'Female', 'Undisclosed'],
                          onChanged: (value) {
                            setState(() => radioButtonValue = value);
                          },
                          optionHeight: 25,
                          textStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.textColor,
                            fontWeight: FontWeight.bold,
                          ),
                          textPadding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.horizontal,
                          radioButtonColor: FlutterFlowTheme.primaryColor,
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.start,
                          verticalAlignment: WrapCrossAlignment.start,
                        ).animated(
                            [animationsMap['radioButtonOnPageLoadAnimation']]),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: dobController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Date of Birth',
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.grayLight,
                      ),
                      hintText: 'in DD/MM/YYYY e.g. 28/12/1997',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0x98FFFFFF),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.darkBackground,
                      contentPadding: EdgeInsets.fromLTRB(20, 24, 20, 24),
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'This Field is Required';
                      }
                      return null;
                    },
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: FlutterFlowTheme.textColor,
                    ),
                  ).animated([animationsMap['textFieldOnPageLoadAnimation1']]),
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.background,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
                          child: TextFormField(
                            controller: heightController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Height',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                              ),
                              hintText: 'e.g. 151 cm',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.darkBackground,
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'This Field is Required';
                              }
                              return null;
                            },
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 20, 0),
                          child: TextFormField(
                            controller: weightController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Weight',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                              ),
                              hintText: 'e.g. 90kg',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.darkBackground,
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'This Field is Required';
                              }
                              return null;
                            },
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                      final buttonLoginUsersRecord = snapshot.data;
                      return FFButtonWidget(
                        onPressed: () async {
                          final usersUpdateData = createUsersRecordData(
                            displayName: buttonLoginUsersRecord.displayName,
                            ailments: buttonLoginUsersRecord.ailments,
                            userSex: radioButtonValue,
                            height: buttonLoginUsersRecord.height,
                            weight: buttonLoginUsersRecord.weight,
                            routine: buttonLoginUsersRecord.routine,
                            phoneNumber: buttonLoginUsersRecord.phoneNumber,
                            dob: buttonLoginUsersRecord.dob,
                          );
                          await buttonLoginUsersRecord.reference
                              .update(usersUpdateData);
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NavBarPage(initialPage: 'homePage'),
                            ),
                          );
                        },
                        text: 'Complete Profile',
                        options: FFButtonOptions(
                          width: 230,
                          height: 46,
                          color: FlutterFlowTheme.primaryColor,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.textColor,
                          ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 8,
                        ),
                      ).animated([animationsMap['buttonOnPageLoadAnimation1']]);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddAnotherProfileWidget(),
                        ),
                      );
                    },
                    text: 'Add Another Profile',
                    icon: Icon(
                      Icons.add_rounded,
                      size: 15,
                    ),
                    options: FFButtonOptions(
                      width: 220,
                      height: 50,
                      color: FlutterFlowTheme.darkBackground,
                      textStyle: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.textColor,
                      ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 8,
                    ),
                  ).animated([animationsMap['buttonOnPageLoadAnimation2']]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
