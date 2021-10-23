import '../../auth/auth_util.dart';
import '../../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/urjaa_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class EditBookingWidget extends StatefulWidget {
  EditBookingWidget({
    Key key,
    this.userAppointment,
  }) : super(key: key);

  final AppointmentsRecord userAppointment;

  @override
  _EditBookingWidgetState createState() => _EditBookingWidgetState();
}

class _EditBookingWidgetState extends State<EditBookingWidget> {
  DateTime datePicked;
  String dropDownValue;
  TextEditingController personsNameController;
  TextEditingController problemDescriptionController;

  @override
  void initState() {
    super.initState();
    personsNameController =
        TextEditingController(text: widget.userAppointment.appointmentName);
    problemDescriptionController = TextEditingController(
        text: widget.userAppointment.appointmentDescription);
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
        child: SingleChildScrollView(
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
                  'Edit Appointment',
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
                        'Edit the fields below in order to change your appointment.',
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
                  controller: personsNameController,
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
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: FlutterFlowDropDown(
                  initialOption: widget.userAppointment.appointmentType,
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
                ),
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
                ),
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
                                    dateTimeFormat('MMMMEEEEd',
                                        widget.userAppointment.appointmentTime),
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
                ),
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
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        final appointmentsUpdateData =
                            createAppointmentsRecordData(
                          appointmentName: personsNameController.text,
                          appointmentType: dropDownValue,
                          appointmentDescription:
                              problemDescriptionController.text,
                          appointmentTime: datePicked,
                        );
                        await widget.userAppointment.reference
                            .update(appointmentsUpdateData);
                        Navigator.pop(context);
                      },
                      text: 'Save Changes',
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
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
