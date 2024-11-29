import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';
import 'transaction.dart' as txn; 

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final user = FirebaseAuth.instance.currentUser;
  String? username; // added for fetching the username
  double currentBalance = 0.0; // added for fetching the current balance 

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

  // function for fetching username in the firestorefirebase
  Future<void> fetchUsername() async {
    if (user != null) {
      try {
        final doc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid) // get the uid of the user
            .get(); // retrieves the username

        setState(() {
          username = doc.data()?['username'] ?? 'Username'; // Assign username or fallback
        });
      } catch (e) {
        print('Error fetching username: $e');
      }
    }
  }

  // function for fetching the current balance in the firestorefirebase
  Future<void> fetchBalance() async {
  if (user != null) {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('transactions')
          .where('created_by', isEqualTo: user!.uid)
          .get();

      double balance = 0.0;

      for (var doc in querySnapshot.docs) {
        final data = doc.data();
        final amount = data['amount']?.toDouble() ?? 0.0;
        final type = data['type']?.toString().toUpperCase() ?? '';

        if (type == 'INCOME') {
          balance += amount; // Add income
        } else if (type == 'EXPENSE') {
          balance -= amount; // Subtract expense
        }
      }

      setState(() {
        currentBalance = balance;
      });
    } catch (e) {
      print('Error fetching balance: $e');
    }
  }
}

   @override
  void initState() {
    super.initState();
    fetchUsername(); // Fetch the username 
    fetchBalance(); // fetch the current balacne
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
                  'Hello, ${username ?? 'Username'}!',
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
                        'PHP ${currentBalance.toStringAsFixed(2)}', // Display dynamic balance
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
                          context.go('/income'); // Navigate to add income page
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
                        context.go('/expense'); // Navigate to add expense page
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
                                'Recent Transactions',
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
                                .where('created_by', isEqualTo: user!.uid)
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
                                  child: Text('No transactions yet.'),
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

                                            context.go('/edit', extra: {
                                              'transactionData': transaction,
                                            });
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
      ),
    );
  }
}
