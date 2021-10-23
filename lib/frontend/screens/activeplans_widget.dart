import '../flutter_flow/urjaa_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ActiveplansWidget extends StatefulWidget {
  ActiveplansWidget({Key key}) : super(key: key);

  @override
  _ActiveplansWidgetState createState() => _ActiveplansWidgetState();
}

class _ActiveplansWidgetState extends State<ActiveplansWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: UrjaaTheme.background,
        automaticallyImplyLeading: false,
        title: Text(
          'Active Plans',
          style: UrjaaTheme.title1.override(
            fontFamily: 'Lexend Deca',
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: UrjaaTheme.background,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
