import 'package:flutter/material.dart';

class ContactAdminScreen extends StatefulWidget {
  @override
  _ContactAdminScreenState createState() => _ContactAdminScreenState();
}

class _ContactAdminScreenState extends State<ContactAdminScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Message sent!')),
      );
      _formKey.currentState!.reset();
      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _messageController.clear();
    }
  }

  void _clear() {
    _formKey.currentState!.reset();
    _nameController.clear();
    _emailController.clear();
    _subjectController.clear();
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryGreen = Color(0xFF2E7D32); // Dark green
    final Color lightGreen = Color(0xFF81C784); // Light green
    final Color iconGreen = Color(0xFF388E3C);
    final Color whiteTransparent = Colors.white.withOpacity(0.85);

    return Scaffold(
      // Gradient background
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFa8e063), Color(0xFF56ab2f)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // AppBar replacement with back button and title on gradient
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Contact Admin',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  SizedBox(height: 24),

                  // Admin Info Section with white translucent background
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: whiteTransparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.headset_mic, color: iconGreen, size: 22),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Admin Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: primaryGreen,
                                      fontSize: 16),
                                ),
                                Text(
                                  'Admin Office',
                                  style: TextStyle(
                                      color: Colors.grey[800], fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(Icons.email_outlined,
                                color: iconGreen, size: 22),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Admin Email',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: primaryGreen,
                                      fontSize: 16),
                                ),
                                Text(
                                  'admin@example.com',
                                  style: TextStyle(
                                      color: Colors.grey[800], fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  Divider(color: Colors.white70),

                  SizedBox(height: 12),

                  // Your Details header
                  Center(
                    child: Text(
                      'Your Details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),

                  SizedBox(height: 12),

                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Your Name
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: 'Your Name',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 16),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide:
                                  BorderSide(color: lightGreen, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: primaryGreen, width: 1.5),
                            ),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Please enter your name' : null,
                        ),
                        SizedBox(height: 12),

                        // Your Email
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Your Email',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 16),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide:
                                  BorderSide(color: lightGreen, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: primaryGreen, width: 1.5),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            final emailRegex = RegExp(
                                r'^[^@]+@[^@]+\.[^@]+'); // Basic email validation
                            if (!emailRegex.hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 12),

                        // Subject
                        TextFormField(
                          controller: _subjectController,
                          decoration: InputDecoration(
                            hintText: 'Subject',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 16),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide:
                                  BorderSide(color: lightGreen, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: primaryGreen, width: 1.5),
                            ),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Please enter a subject' : null,
                        ),
                        SizedBox(height: 12),

                        // Message
                        TextFormField(
                          controller: _messageController,
                          decoration: InputDecoration(
                            hintText: 'Message',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide:
                                  BorderSide(color: lightGreen, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: primaryGreen, width: 1.5),
                            ),
                          ),
                          maxLines: 5,
                          validator: (value) =>
                              value!.isEmpty ? 'Please enter a message' : null,
                        ),
                        SizedBox(height: 24),

                        // Buttons Row: Clear and Send
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: _clear,
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.white),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  padding: EdgeInsets.symmetric(vertical: 14),
                                  backgroundColor: Colors.transparent,
                                ),
                                child: Text(
                                  'Clear',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: _submit,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  padding: EdgeInsets.symmetric(vertical: 14),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Send',
                                      style: TextStyle(
                                          color: primaryGreen,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(Icons.send,
                                        size: 18, color: primaryGreen),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
