import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'transaction.dart' as txn; 

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Alert dialogue for delete activity button
  void _showDeleteDialogue(DocumentSnapshot doc) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Delete Activity?'),
          content: Text('Are you sure you want to delete this activity?'),
          actions: [
            MaterialButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('transactions')
                    .doc(doc.id)
                    .delete();
                Navigator.pop(context);
              },
              textColor: Color.fromARGB(255, 255, 89, 100),
              child: Text('Yes'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              // Greeting and current balance section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Hello, Username!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: double.infinity,
                  height: 134,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF5EC57E), Color(0xFFD2E8B6)],
                      begin: AlignmentDirectional(1, 0),
                      end: AlignmentDirectional(-1, 0),
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Colors.black26,
                        offset: Offset(1, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your Current Balance',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF285653),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'PHP 00,000.00',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF001A47),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                            color: Color(0xFF347571),
                            width: 2,
                          ),
                          minimumSize: const Size(32, 32),
                        ),
                        child: const Icon(Icons.add,
                            color: Color(0xFF347571), size: 16),
                        onPressed: () {
                          Navigator.pushNamed(context,
                              '/income'); // Navigate to add income page
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
                          borderRadius: BorderRadius.circular(8),
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
                        Navigator.pushNamed(context,
                            '/expense'); // Navigate to add expense page
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

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Activities',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('transactions')
                                .orderBy('timestamp', descending: true)
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
                                  child: Text('No activities yet.'),
                                );
                              }

                              final transactions = snapshot.data!.docs;

                              return ListView.builder(
                                itemCount: transactions.length,
                                itemBuilder: (context, index) {
                                  final transaction = transactions[index];

                                  // Safely access fields
                                  final title = transaction['title'] ?? 'Unknown';
                                  final amount = transaction['amount']?.toStringAsFixed(2) ??'0.00';
                                  final description = transaction['description'] ?? 'Unknown Description';
                                  // Ensure that the type is treated in uppercase for comparison
                                  final type = transaction['type'] ?.toString().toUpperCase() ??'INCOME'; 

                                  // Determine the icon color based on the type
                                  Color iconColor = (type == 'INCOME') ? Colors.green: Colors.red;
                                  IconData icon = (type == 'INCOME')? Icons.monetization_on: Icons.remove_circle_outline;
                                  return ListTile(
                                    leading: Icon(
                                      icon,
                                      color: iconColor, // Set icon color based on type                                       
                                    ),
                                    title: Text(title),
                                    subtitle:
                                        Text('PHP $amount • $description'),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // Edit button
                                        IconButton(
                                          icon: Icon(
                                            Icons.edit,
                                            color: Color(
                                                0xFF5EC57E), 
                                            size: 24,
                                          ),
                                          onPressed: () {
                                            //experiment only
                                            final transactionData = transactions[index];
                                            final transaction = txn.Transaction(
                                            uid: transactionData.id,
                                            amount: transactionData['amount'],
                                            title: transactionData['title'],
                                            description: transactionData['description'],
                                          );

                                            Navigator.pushNamed(
                                              context,
                                              '/edit', arguments: transaction, // Navigate to your edit screen
                                            );
                                          },
                                        ),
                                        // Delete button
                                        IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            color: Color.fromARGB(
                                                255, 255, 89, 100),
                                            size: 24,
                                          ),
                                          onPressed: () {
                                            _showDeleteDialogue(
                                                transaction); // Show delete confirmation
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
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
                icon: Icon(Icons.bar_chart, color: Color(0xFF001A47), size: 32),
                onPressed: () {
                  // Navigate to bar chart page
                },
              ),
              IconButton(
                icon: Icon(Icons.home, color: Color(0xFF001A47), size: 32),
                onPressed: () {
                  Navigator.pushNamed(context, '/home'); // Navigate to home
                },
              ),
              IconButton(
                icon: Icon(Icons.person, color: Color(0xFF001A47), size: 32),
                onPressed: () {
                  Navigator.pushNamed(
                      context, '/user'); // Navigate to user profile
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
