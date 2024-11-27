import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'expense_page_model.dart';
export 'expense_page_model.dart';

class ExpensePageWidget extends StatefulWidget {
  const ExpensePageWidget({super.key});

  @override
  State<ExpensePageWidget> createState() => _ExpensePageWidgetState();
}

class _ExpensePageWidgetState extends State<ExpensePageWidget> {
  late ExpensePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = ExpensePageModel();

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF2E5B59),
          automaticallyImplyLeading: false,
          leading: Container(
            width: 60, // buttonSize
            height: 60, // buttonSize
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () async {
                Navigator.pop(context); // Flutter's Navigator.pop(context)
              },
            ),
          ),
          title: Text(
            'Expense',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontFamily: 'Inter Tight',
                  color: Colors.white,
                  fontSize: 22,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.sizeOf(context).width,
                      minHeight: MediaQuery.sizeOf(context).height * 0.9,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 18, 0, 36),
                          child: Container(
                            width: 352,
                            height: 99,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0.0,
                                    2,
                                  ),
                                  spreadRadius: 3,
                                )
                              ],
                              gradient: LinearGradient(
                                colors: [Color(0xFF68D698), Color(0xFFCCF997)],
                                stops: [0, 0.8],
                                begin: AlignmentDirectional(0.87, 1),
                                end: AlignmentDirectional(-0.87, -1),
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1, -1),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 14, 0, 0),
                                    child: Text(
                                      'Your Current Balance',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontFamily: 'Inter',
                                            color: Color(0xFF285653),
                                            fontSize: 12,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: Text(
                                      'PHP 00,000.00',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontFamily: 'Inter',
                                            color: Color(0xFF001A47),
                                            fontSize: 36,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 462,
                          height: MediaQuery.sizeOf(context).height * 0.55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-0.75, 0),
                                child: Text(
                                  'Enter Expense',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF347571),
                                        fontSize: 22,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: Container(
                                  width: 315,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 4),
                                          child: Text(
                                            'Insert Amount',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xFF001A47),
                                                  fontSize: 16,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 280,
                                        child: TextFormField(
                                          controller: _model.textController1,
                                          focusNode: _model.textFieldFocusNode1,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelStyle: Theme.of(context)
                                                .textTheme
                                                .labelMedium
                                                ?.copyWith(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                            hintText: '-',
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .labelMedium
                                                ?.copyWith(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFADADAD),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 255, 89, 100),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 255, 89, 100),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                          keyboardType: const TextInputType
                                              .numberWithOptions(decimal: true),
                                          cursorColor: Colors.black,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'This field cannot be empty';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: Container(
                                  width: 315,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 4),
                                          child: Text(
                                            'Expense Title',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xFF001A47),
                                                  fontSize: 16,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 280,
                                        child: TextFormField(
                                          controller: _model.textController2,
                                          focusNode: _model.textFieldFocusNode2,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelStyle: Theme.of(context)
                                                .textTheme
                                                .labelMedium
                                                ?.copyWith(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                            hintText: '-',
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .labelMedium
                                                ?.copyWith(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFADADAD),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 255, 89, 100),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 255, 89, 100),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                          cursorColor: Colors.black,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'This field cannot be empty';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: Container(
                                  width: 315,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 4),
                                          child: Text(
                                            'Description',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xFF001A47),
                                                  fontSize: 16,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 280,
                                        //width: double .infinity, // Ensure the container stretches fully
                                        child: TextFormField(
                                          controller: _model.textController3,
                                          focusNode: _model.textFieldFocusNode3,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelStyle: Theme.of(context)
                                                .textTheme
                                                .labelMedium
                                                ?.copyWith(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                            hintText: '-',
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .labelMedium
                                                ?.copyWith(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFADADAD),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 255, 89, 100),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 255, 89, 100),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                          cursorColor: Colors.black,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'This field cannot be empty';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding( 
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(
                                        150, 45), // Sets the width and height
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 0),
                                    backgroundColor:
                                        Color(0xFF347571), // Button color
                                    elevation: 0, // Removes shadow/elevation
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          24), // Rounded corners
                                    ),
                                  ),
                                  child: Text(
                                    'Add Expense',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          fontFamily: 'Inter Tight',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
