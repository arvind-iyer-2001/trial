import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/urjaa_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../../main.dart';
import 'package:flutter/material.dart';

class AddAnotherProfileWidget extends StatefulWidget {
  AddAnotherProfileWidget({Key key}) : super(key: key);

  @override
  _AddAnotherProfileWidgetState createState() =>
      _AddAnotherProfileWidgetState();
}

class _AddAnotherProfileWidgetState extends State<AddAnotherProfileWidget> {
  String radioButtonValue;
  TextEditingController phoneNumberController1;
  TextEditingController phoneNumberController2;
  TextEditingController phoneNumberController3;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    phoneNumberController1 = TextEditingController();
    phoneNumberController2 = TextEditingController();
    phoneNumberController3 = TextEditingController();
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
            color: UrjaaTheme.grayLight,
            size: 32,
          ),
        ),
        title: Text(
          'Add Another Profile',
          style: UrjaaTheme.title3.override(
            fontFamily: 'Lexend Deca',
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: UrjaaTheme.background,
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
                Container(
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        'Upload a photo for us to easily identify this person.',
                        textAlign: TextAlign.center,
                        style: UrjaaTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: phoneNumberController1,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Persons Name',
                      labelStyle: UrjaaTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: UrjaaTheme.grayLight,
                      ),
                      hintText: 'Official name here...',
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
                    controller: phoneNumberController2,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Persons Age',
                      labelStyle: UrjaaTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: UrjaaTheme.grayLight,
                      ),
                      hintText: 'i.e. 34',
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
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: phoneNumberController3,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Persons Ailments',
                      labelStyle: UrjaaTheme.bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: UrjaaTheme.grayLight,
                      ),
                      hintText: 'What types of allergies do they have..',
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
                        'Persons Birth Sex',
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
                      FlutterFlowRadioButton(
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
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
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
      ),
    );
  }
}
