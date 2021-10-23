import '../../auth/auth_util.dart';
import '../flutter_flow/urjaa_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class ForgotPasswordWidget extends StatefulWidget {
  ForgotPasswordWidget({Key key}) : super(key: key);

  @override
  _ForgotPasswordWidgetState createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  TextEditingController emailAddressController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: UrjaaTheme.background,
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
          'Forgot Password',
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
            color: UrjaaTheme.background,
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: Image.asset(
                'assets/images/page_background.png',
              ).image,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        'Enter the email associated with your account and we will send you a verification code.',
                        style: UrjaaTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextFormField(
                  controller: emailAddressController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    labelStyle: UrjaaTheme.bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0x98FFFFFF),
                    ),
                    hintText: 'Enter your email...',
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
                    color: UrjaaTheme.tertiaryColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (emailAddressController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Email required!',
                          ),
                        ),
                      );
                      return;
                    }
                    await resetPassword(
                      email: emailAddressController.text,
                      context: context,
                    );
                  },
                  text: 'Send Reset Link',
                  options: FFButtonOptions(
                    width: 230,
                    height: 60,
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
  }
}
