import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'home_page_model.dart'; 
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key})
      : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model =
        HomePageModel(); 
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
        key: GlobalKey<ScaffoldState>(),
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Top container with username and balance
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.75, -1),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 8),
                            child: Text(
                              'Hello Username!',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 36),
                          child: Container(
                            width: 352,
                            height: 134,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: const Color(0x33000000),
                                  offset: const Offset(1, 2),
                                ),
                              ],
                              gradient: const LinearGradient(
                                colors: [Color(0xFF5EC57E), Color(0xFFD2E8B6)],
                                begin: AlignmentDirectional(1, 0),
                                end: AlignmentDirectional(-1, 0),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1, -1),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 14, 0, 0),
                                    child: Text(
                                      'Your Current Balance',
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF285653),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text(
                                      'PHP 00,000.00',
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF001A47),
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                              backgroundColor: Colors.white,
                                              side: const BorderSide(
                                              color: Color(0xFF347571),
                                              width: 2,
                                            ),
                                            minimumSize: const Size(32, 32),
                                          ),
                                          child: const Icon(Icons.add,
                                              color: Color(0xFF347571),
                                              size: 16),
                                          onPressed: () {
                                            print('Add Income pressed');
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Text(
                                        'Income',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF347571),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          backgroundColor: Colors.white,
                                          side: const BorderSide(
                                            color: Color(0xFF347571),
                                            width: 2,
                                          ),
                                          minimumSize: const Size(32, 32),
                                        ),
                                        child: const Icon(Icons.remove,
                                            color: Color(0xFF347571), size: 16),
                                        onPressed: () {
                                          print('Remove Expense pressed');
                                        },
                                      ),
                                      const SizedBox(width: 8),
                                      const Text(
                                        'Expense',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: Color(0xFF347571),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Activities container
                        Container(
                          width: 390,
                          height: 471,
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 7,
                                color: const Color(0x33484747),
                                offset: const Offset(2, -3),
                                spreadRadius: 4,
                              )
                            ],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(22, 18, 22, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const Text(
                                      'Activities',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF001A47),
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 1,
                                indent: 12,
                                endIndent: 12,
                                color: Color(0xFFC4C4C4),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: 2, 
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Container(
                                        width: 340,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4,
                                              color: const Color(0x33001A47),
                                              offset: const Offset(0, 3),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(left: 8),
                                              child: Icon(Icons.monetization_on,
                                                  color: Color(0xFF347571),
                                                  size: 24),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(left: 4),
                                              child: Text(
                                                'Name of expense/income',
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            IconButton(
                                              icon: const Icon(Icons.more_vert,
                                                  color: Color(0xFF5EC57E),
                                                  size: 24),
                                              onPressed: () {
                                                print('More options pressed');
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Bottom navigation bar
                  Container(
                    width: double.infinity,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: const Color(0x33000000),
                          offset: const Offset(0, -2),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.bar_chart,
                              color: Color(0xFF001A47), size: 32),
                          onPressed: () {
                            print('Bar Chart pressed');
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.home,
                              color: Color(0xFF001A47), size: 32),
                          onPressed: () {
                            print('Home pressed');
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.person,
                              color: Color(0xFF001A47), size: 32),
                          onPressed: () {
                            print('Profile pressed');
                          },
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
