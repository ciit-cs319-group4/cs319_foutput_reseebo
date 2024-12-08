import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; 

import 'user_page_model.dart';
export 'user_page_model.dart';

class UserPageWidget extends StatefulWidget {
  const UserPageWidget({super.key});

  @override
  State<UserPageWidget> createState() => _UserPageWidgetState();
}

class _UserPageWidgetState extends State<UserPageWidget> {
  late UserPageModel _model;
  String? username;
  String? email;
  String? date;
  final user = FirebaseAuth.instance.currentUser;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _handleUserLogout() async {
    await FirebaseAuth.instance.signOut();

    if (FirebaseAuth.instance.currentUser == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: const Text('You have logged out successfully.')));

      context.replace('/');
    }
  }

   // function for fetching username in the firestorefirebase
  Future<void> fetchUserData() async {
    if (user != null) {
      try {
        final doc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid) // get the uid of the user
            .get(); // retrieves the username

        final userData = doc.data();

        setState(() {
          username = userData? ['username'] ?? 'Username'; // Assign username or fallback
          email = userData? ['email'] ?? 'Sample@com';
          date = userData?['createdAt'] != null ? DateFormat('MMMM d, yyyy').format(userData?['createdAt'].toDate()): 'date'; // Format the date or fallback to 'date'
        });
      } catch (e) {
        print('Error fetching username: $e');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserData(); // Fetch the username 
    
    _model = UserPageModel();
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.sizeOf(context).width,
                  minHeight: MediaQuery.sizeOf(context).height * 0.8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 20),
                      // Add space above the content
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          '${username ?? 'Username'}',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontFamily: 'Inter',
                                    color: Color.fromRGBO(52, 117, 113, 1),
                                    fontSize: 40,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        indent: 40,
                        endIndent: 40,
                        color: Color.fromRGBO(224, 227, 231, 1),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Text(
                          '${email ?? 'Sample@com'}',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF001A47),
                                    fontSize: 16,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Member since: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF001A47),
                                    fontSize: 16,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              '${date ?? 'date'}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF001A47),
                                    fontSize: 16,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      // Add space between the content and the container
                      Container(
                        width: 352,
                        height: 120,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.8, -1),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 4),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      // Add space between the container and the button
                      ElevatedButton(
                        onPressed: _handleUserLogout,
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(180, 40),
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          backgroundColor: Color(0xFFDD6B6B),
                          textStyle:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontFamily: 'Inter Tight',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Text('Logout'),
                      ),
                      SizedBox(height: 20),
                      // Add space below the button
                    ],
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
