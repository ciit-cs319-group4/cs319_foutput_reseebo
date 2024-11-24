import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'currency_page_model.dart';
export 'currency_page_model.dart';

class CurrencyPageWidget extends StatefulWidget {
  const CurrencyPageWidget({super.key});

  @override
  State<CurrencyPageWidget> createState() => _CurrencyPageWidgetState();
}

class _CurrencyPageWidgetState extends State<CurrencyPageWidget> {
  late CurrencyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = CurrencyPageModel();
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
          backgroundColor: Color(0xFF5EC57E),
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
            'Currency',
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
          child: Container(
            width: 530,
            height: 473,
            constraints: BoxConstraints(
              minWidth: MediaQuery.sizeOf(context).width,
              minHeight: MediaQuery.sizeOf(context).height * 1,
              maxWidth: 600,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Divider(
                  thickness: 2,
                  color: Color.fromRGBO(224, 227, 231, 1),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                  child: Text(
                    'Philippine Peso',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Color.fromRGBO(224, 227, 231, 1),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                  child: Text(
                    'American Dollar',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Color.fromRGBO(224, 227, 231, 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
