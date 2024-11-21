import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Hello Username!',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      width: 330,
                      height: 119,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x33000000),
                            offset: Offset(1, 2),
                          ),
                        ],
                        gradient: LinearGradient(
                          colors: [Color(0xFF5EC57E), Color(0xFFD2E8B6)],
                          stops: [0, 1],
                          begin: AlignmentDirectional(1, 0),
                          end: AlignmentDirectional(-1, 0),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: Text(
                              'Your Current Balance',
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Color(0xFF347571),
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Text(
                              'PHP 00,000.00',
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Color(0xFF001A47),
                                fontSize: 36,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Theme.of(context).iconTheme.color,
                            size: 16,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                        Text(
                          'Income',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Color(0xFF347571),
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.minus,
                            color: Theme.of(context).iconTheme.color,
                            size: 12,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                        Text(
                          'Expense',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Color(0xFF347571),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Container(
                      width: 390,
                      height: 438,
                      decoration: BoxDecoration(
                        color: Theme.of(context).secondaryHeaderColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 7,
                            color: Color(0x33484747),
                            offset: Offset(2, -3),
                            spreadRadius: 4,
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 524,
                    height: 72,
                    decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
