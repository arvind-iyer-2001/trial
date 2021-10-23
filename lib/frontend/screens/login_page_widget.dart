import '../../auth/auth_util.dart';
import 'complete_profile_widget.dart';
import '../flutter_flow/urjaa_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import './forgot_password_widget.dart';
import '../../main.dart';
import 'package:flutter/material.dart';

class LoginPageWidget extends StatefulWidget {
  LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController emailAddressController;
  TextEditingController passwordCreateController;
  bool passwordCreateVisibility;
  TextEditingController passwordConfirmController;
  bool passwordConfirmVisibility;
  TextEditingController emailAddressLoginController;
  TextEditingController passwordLoginController;
  bool passwordLoginVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    passwordCreateController = TextEditingController();
    passwordCreateVisibility = false;
    passwordConfirmController = TextEditingController();
    passwordConfirmVisibility = false;
    emailAddressLoginController = TextEditingController();
    passwordLoginController = TextEditingController();
    passwordLoginVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: UrjaaTheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
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
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: DefaultTabController(
                                length: 2,
                                initialIndex: 0,
                                child: Column(
                                  children: [
                                    TabBar(
                                      labelColor: UrjaaTheme.tertiaryColor,
                                      unselectedLabelColor:
                                          UrjaaTheme.grayLight,
                                      indicatorColor: UrjaaTheme.tertiaryColor,
                                      indicatorWeight: 3,
                                      tabs: [
                                        Tab(
                                          text: 'Login',
                                        ),
                                        Tab(
                                          text: 'Register',
                                        )
                                      ],
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 20, 0, 0),
                                                    child: TextFormField(
                                                      controller:
                                                          emailAddressLoginController,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Email Address',
                                                        labelStyle: UrjaaTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0x98FFFFFF),
                                                        ),
                                                        hintText:
                                                            'Enter your email...',
                                                        hintStyle: UrjaaTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0x98FFFFFF),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        filled: true,
                                                        fillColor: UrjaaTheme
                                                            .darkBackground,
                                                        contentPadding:
                                                            EdgeInsets.fromLTRB(
                                                                20, 24, 20, 24),
                                                      ),
                                                      validator:
                                                          (String value) {
                                                        if (value.isEmpty) {
                                                          return 'This Field is Required';
                                                        }
                                                        return null;
                                                      },
                                                      style: UrjaaTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: UrjaaTheme
                                                            .tertiaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 12, 0, 0),
                                                    child: TextFormField(
                                                      controller:
                                                          passwordLoginController,
                                                      obscureText:
                                                          !passwordLoginVisibility,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Password',
                                                        labelStyle: UrjaaTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0x98FFFFFF),
                                                        ),
                                                        hintText:
                                                            'Enter your password...',
                                                        hintStyle: UrjaaTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0x98FFFFFF),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        filled: true,
                                                        fillColor: UrjaaTheme
                                                            .darkBackground,
                                                        contentPadding:
                                                            EdgeInsets.fromLTRB(
                                                                20, 24, 20, 24),
                                                        suffixIcon: InkWell(
                                                          onTap: () => setState(
                                                            () => passwordLoginVisibility =
                                                                !passwordLoginVisibility,
                                                          ),
                                                          child: Icon(
                                                            passwordLoginVisibility
                                                                ? Icons
                                                                    .visibility_outlined
                                                                : Icons
                                                                    .visibility_off_outlined,
                                                            color: Color(
                                                                0x98FFFFFF),
                                                            size: 20,
                                                          ),
                                                        ),
                                                      ),
                                                      validator:
                                                          (String value) {
                                                        if (value.isEmpty) {
                                                          return 'This Field is Required';
                                                        }
                                                        return null;
                                                      },
                                                      style: UrjaaTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: UrjaaTheme
                                                            .tertiaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 24, 0, 0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        final user =
                                                            await signInWithEmail(
                                                          context,
                                                          emailAddressLoginController
                                                              .text,
                                                          passwordLoginController
                                                              .text,
                                                        );
                                                        if (user == null) {
                                                          return;
                                                        }

                                                        await Navigator
                                                            .pushAndRemoveUntil(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                NavBarPage(
                                                                    initialPage:
                                                                        'homePage'),
                                                          ),
                                                          (r) => false,
                                                        );
                                                      },
                                                      text: 'Login',
                                                      options: FFButtonOptions(
                                                        width: 230,
                                                        height: 60,
                                                        color:
                                                            Color(0xFF2E53FC),
                                                        textStyle: UrjaaTheme
                                                            .subtitle2
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: UrjaaTheme
                                                              .textColor,
                                                        ),
                                                        elevation: 3,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius: 8,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 20, 0, 24),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                ForgotPasswordWidget(),
                                                          ),
                                                        );
                                                      },
                                                      text: 'Forgot Password?',
                                                      options: FFButtonOptions(
                                                        width: 170,
                                                        height: 40,
                                                        color: UrjaaTheme
                                                            .background,
                                                        textStyle: UrjaaTheme
                                                            .subtitle2
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: Colors.white,
                                                        ),
                                                        elevation: 0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
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
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 20, 0, 0),
                                                    child: TextFormField(
                                                      controller:
                                                          emailAddressController,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Email Address',
                                                        labelStyle: UrjaaTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0x98FFFFFF),
                                                        ),
                                                        hintText:
                                                            'Enter your email...',
                                                        hintStyle: UrjaaTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0x98FFFFFF),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        filled: true,
                                                        fillColor: UrjaaTheme
                                                            .darkBackground,
                                                        contentPadding:
                                                            EdgeInsets.fromLTRB(
                                                                20, 24, 20, 24),
                                                      ),
                                                      validator:
                                                          (String value) {
                                                        if (value.isEmpty) {
                                                          return 'This Field is Required';
                                                        }
                                                        return null;
                                                      },
                                                      style: UrjaaTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: UrjaaTheme
                                                            .tertiaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 12, 0, 0),
                                                    child: TextFormField(
                                                      controller:
                                                          passwordCreateController,
                                                      obscureText:
                                                          !passwordCreateVisibility,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Password',
                                                        labelStyle: UrjaaTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0x98FFFFFF),
                                                        ),
                                                        hintText:
                                                            'Enter your password...',
                                                        hintStyle: UrjaaTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0x98FFFFFF),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        filled: true,
                                                        fillColor: UrjaaTheme
                                                            .darkBackground,
                                                        contentPadding:
                                                            EdgeInsets.fromLTRB(
                                                                20, 24, 20, 24),
                                                        suffixIcon: InkWell(
                                                          onTap: () => setState(
                                                            () => passwordCreateVisibility =
                                                                !passwordCreateVisibility,
                                                          ),
                                                          child: Icon(
                                                            passwordCreateVisibility
                                                                ? Icons
                                                                    .visibility_outlined
                                                                : Icons
                                                                    .visibility_off_outlined,
                                                            color: Color(
                                                                0x98FFFFFF),
                                                            size: 20,
                                                          ),
                                                        ),
                                                      ),
                                                      validator:
                                                          (String value) {
                                                        if (value.isEmpty) {
                                                          return 'This Field is Required';
                                                        }
                                                        return null;
                                                      },
                                                      style: UrjaaTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: UrjaaTheme
                                                            .tertiaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      0,
                                                      12,
                                                      0,
                                                      0,
                                                    ),
                                                    child: TextFormField(
                                                      controller:
                                                          passwordConfirmController,
                                                      obscureText:
                                                          !passwordConfirmVisibility,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Confirm Password',
                                                        labelStyle: UrjaaTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0x98FFFFFF),
                                                        ),
                                                        hintText:
                                                            'Enter your password...',
                                                        hintStyle: UrjaaTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0x98FFFFFF),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        filled: true,
                                                        fillColor: UrjaaTheme
                                                            .darkBackground,
                                                        contentPadding:
                                                            EdgeInsets.fromLTRB(
                                                                20, 24, 20, 24),
                                                        suffixIcon: InkWell(
                                                          onTap: () => setState(
                                                            () => passwordConfirmVisibility =
                                                                !passwordConfirmVisibility,
                                                          ),
                                                          child: Icon(
                                                            passwordConfirmVisibility
                                                                ? Icons
                                                                    .visibility_outlined
                                                                : Icons
                                                                    .visibility_off_outlined,
                                                            color: Color(
                                                                0x98FFFFFF),
                                                            size: 20,
                                                          ),
                                                        ),
                                                      ),
                                                      validator:
                                                          (String value) {
                                                        if (value.isEmpty) {
                                                          return 'This Field is Required';
                                                        }
                                                        return null;
                                                      },
                                                      style: UrjaaTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: UrjaaTheme
                                                            .tertiaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 24, 0, 24),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        final user =
                                                            await createAccountWithEmail(
                                                          context,
                                                          emailAddressController
                                                              .text,
                                                          passwordCreateController
                                                              .text,
                                                        );
                                                        if (user == null) {
                                                          return;
                                                        }

                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                CompleteProfileWidget(),
                                                          ),
                                                        );
                                                      },
                                                      text: 'Create Account',
                                                      options: FFButtonOptions(
                                                        width: 230,
                                                        height: 60,
                                                        color: UrjaaTheme
                                                            .primaryColor,
                                                        textStyle: UrjaaTheme
                                                            .subtitle2
                                                            .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: UrjaaTheme
                                                              .textColor,
                                                        ),
                                                        elevation: 3,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius: 8,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
