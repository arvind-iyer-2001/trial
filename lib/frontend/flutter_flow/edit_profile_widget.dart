import '../screens/add_another_profile_widget.dart';
import '../../backend/backend.dart';
import 'flutter_flow_radio_button.dart';
import 'urjaa_theme.dart';
import 'flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EditProfileWidget extends StatefulWidget {
  EditProfileWidget({
    Key key,
    this.userProfile,
  }) : super(key: key);

  final DocumentReference userProfile;

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  String radioButtonValue;
  TextEditingController yourAilmentsController;
  TextEditingController yourNameController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.userProfile),
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
        final editProfileUsersRecord = snapshot.data;
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
                color: UrjaaTheme.grayLight,
                size: 32,
              ),
            ),
            title: Text(
              'Edit Profile',
              style: UrjaaTheme.title3.override(
                fontFamily: 'Lexend Deca',
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: UrjaaTheme.background,
          body: Container(
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
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: UrjaaTheme.darkBackground,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      width: 80,
                      height: 80,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        editProfileUsersRecord.photoUrl,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddAnotherProfileWidget(),
                          ),
                        );
                      },
                      text: 'Change Photo',
                      options: FFButtonOptions(
                        width: 140,
                        height: 40,
                        color: UrjaaTheme.darkBackground,
                        textStyle: UrjaaTheme.bodyText2.override(
                          fontFamily: 'Lexend Deca',
                        ),
                        elevation: 2,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 8,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextFormField(
                      controller: yourNameController ??= TextEditingController(
                        text: editProfileUsersRecord.displayName,
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Your Name',
                        labelStyle: UrjaaTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: UrjaaTheme.grayLight,
                        ),
                        hintText: 'Please enter a valid number...',
                        hintStyle: UrjaaTheme.bodyText1.override(
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
                        fillColor: UrjaaTheme.darkBackground,
                        contentPadding: EdgeInsets.fromLTRB(20, 24, 20, 24),
                      ),
                      style: UrjaaTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: UrjaaTheme.textColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextFormField(
                      controller: yourAilmentsController ??=
                          TextEditingController(
                        text: editProfileUsersRecord.ailments,
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Ailments',
                        labelStyle: UrjaaTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: UrjaaTheme.grayLight,
                        ),
                        hintText: 'What types of allergies do you have..',
                        hintStyle: UrjaaTheme.bodyText1.override(
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
                        fillColor: UrjaaTheme.darkBackground,
                        contentPadding: EdgeInsets.fromLTRB(20, 24, 20, 24),
                      ),
                      style: UrjaaTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: UrjaaTheme.textColor,
                      ),
                      maxLines: 3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 12, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Your Birth Sex',
                          style: UrjaaTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 12, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        StreamBuilder<UsersRecord>(
                          stream: UsersRecord.getDocument(
                              editProfileUsersRecord.reference),
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
                            final radioButtonUsersRecord = snapshot.data;
                            return FlutterFlowRadioButton(
                              options: ['Male', 'Female', 'Undisclosed'],
                              onChanged: (value) {
                                setState(() => radioButtonValue = value);
                              },
                              optionHeight: 25,
                              textStyle: UrjaaTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: UrjaaTheme.textColor,
                                fontWeight: FontWeight.bold,
                              ),
                              textPadding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              buttonPosition: RadioButtonPosition.left,
                              direction: Axis.horizontal,
                              radioButtonColor: UrjaaTheme.primaryColor,
                              toggleable: false,
                              horizontalAlignment: WrapAlignment.start,
                              verticalAlignment: WrapCrossAlignment.start,
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final usersUpdateData = createUsersRecordData(
                          displayName: yourNameController?.text ?? '',
                          ailments: yourAilmentsController?.text ?? '',
                          userSex: editProfileUsersRecord.userSex,
                        );
                        await editProfileUsersRecord.reference
                            .update(usersUpdateData);
                        Navigator.pop(context);
                      },
                      text: 'Save Changes',
                      options: FFButtonOptions(
                        width: 230,
                        height: 56,
                        color: UrjaaTheme.primaryColor,
                        textStyle: UrjaaTheme.subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: UrjaaTheme.textColor,
                        ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 8,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
