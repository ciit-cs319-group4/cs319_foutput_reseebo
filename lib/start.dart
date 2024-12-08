import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

export 'start_model.dart';

class StartWidget extends StatefulWidget {
  const StartWidget({super.key});

  @override
  State<StartWidget> createState() => _StartWidgetState();
}

class _StartWidgetState extends State<StartWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  constraints: BoxConstraints(
                    // Edited: Replaced MediaQuery.sizeOf(context) with MediaQuery.of(context).size
                    minWidth: MediaQuery.of(context).size.width,
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF347571), Color(0xFF72BF5B)],
                      stops: [0.1, 1],
                      begin: AlignmentDirectional(1, -0.59),
                      end: AlignmentDirectional(-1, 0.59),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(child: SizedBox.shrink()), 
                      Text(
                        'RESEEBO',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontFamily: 'Inter',
                              color: Colors.white,
                              fontSize: 52,
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Track your expenses, ',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontFamily: 'Inter',
                                  color: Color(0xFFE6E6E6),
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                          Text(
                            'See the benefits',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontFamily: 'Inter',
                                  color: const Color.fromARGB(255, 228, 227, 227),
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox.shrink()), 
                      // Edited: Added SizedBox to define button width explicitly
                      SizedBox(
                        width: 250,
                        child: ElevatedButton(
                          onPressed: () {
                            context.go('/signup');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF2E5B59),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              fontFamily: 'Inter Tight',
                              color: Colors.white,
                              fontSize: 16,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.go('/login');
                        },
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Already have an account? ',
                                style: TextStyle(color: const Color.fromARGB(255, 199, 199, 199)),
                              ),
                              TextSpan(
                                text: 'Login',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox.shrink()), 
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
