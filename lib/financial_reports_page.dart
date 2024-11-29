import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'financial_reports_model.dart';
import 'package:fl_chart/fl_chart.dart';

class FinancialReportsPageWidget extends StatefulWidget {
  const FinancialReportsPageWidget({super.key});

  @override
  State<FinancialReportsPageWidget> createState() => _FinancialReportsPageWidgetState();
}

class _FinancialReportsPageWidgetState extends State<FinancialReportsPageWidget> {
  late FinancialReportsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = FinancialReportsModel();

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
          title: Text(
            'Financial Reports',
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
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("Financial Breakdown",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontFamily: 'Inter Tight',
                    color: Colors.black,
                    fontSize: 20,
                    letterSpacing: 0.0,
                  )
                ),
                Container(
                  height: 600,
                    padding: const EdgeInsets.all(16.0),
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('transactions')
                          .where("created_by", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (!snapshot.hasData ||
                            snapshot.data!.docs.isEmpty) {
                          return Center(
                            child: Text('No transactions yet.'),
                          );
                        }

                        Map<String, double> financialData = <String, double>{
                          "INCOME" : 0.0,
                          "EXPENSE" : 0.0,
                        };

                        Map<String, int> financialDataCount = <String, int>{
                          "INCOME": 0,
                          "EXPENSE": 0,
                        };

                        final transactions = snapshot.data!.docs;

                        for (var transaction in transactions) {
                          final data = transaction.data();
                          final amount = data['amount']?.toDouble() ?? 0.0;
                          final type = data['type']?.toString().toUpperCase();

                          financialDataCount.update(type!, (value) {
                            return value += 1;
                          });

                          financialData.update(type, (value) {
                            return value += amount!;
                          });
                        }

                        return Expanded( child: Column(
                          children: [
                            SizedBox(
                              height: 350,
                              child: PieChart(
                                  PieChartData(
                                    sections: <PieChartSectionData>[
                                      PieChartSectionData(
                                        color: Colors.green,
                                        value: financialData['INCOME']?.toDouble(),
                                        title: 'Income',
                                        radius: 50,
                                        titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                                      ),
                                      PieChartSectionData(
                                        color: Colors.red,
                                        value: financialData['EXPENSE']?.toDouble(),
                                        title: 'Expense',
                                        radius: 50,
                                        titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                                      ),
                                    ],
                                    centerSpaceRadius: 40,
                                    borderData: FlBorderData(show: false),
                                    sectionsSpace: 2,
                                  )
                              ),
                            ),
                            SizedBox(
                                child: Expanded(
                                    child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          children: [
                                            Text("Total Income: ${financialData['INCOME']}",
                                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                                  fontFamily: 'Inter Tight',
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  letterSpacing: 0.0,
                                                )),
                                            Text("Total Expense: ${financialData['EXPENSE']}",
                                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                                  fontFamily: 'Inter Tight',
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  letterSpacing: 0.0,
                                                )),
                                            Text("Income Records Count: ${financialDataCount['INCOME']}",
                                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                                  fontFamily: 'Inter Tight',
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  letterSpacing: 0.0,
                                                )),
                                            Text("Total Records Count: ${financialDataCount['EXPENSE']}",
                                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                                  fontFamily: 'Inter Tight',
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  letterSpacing: 0.0,
                                                )),
                                          ],
                                        )
                                    )
                                )
                            )
                          ],
                        ));
                      },
                    )
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}
