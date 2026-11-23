import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  final Color primaryColor = Color(0xFF2E5632); // dark green from screenshot
  final Color backgroundColor = Color(0xFFD4DBD4); // light green background

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'About Student Connect',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Student Connect',
              style: GoogleFonts.poppins(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Student Connect is a simple app designed to help students with the following features:',
              style: GoogleFonts.poppins(
                color: primaryColor.withOpacity(0.85),
                fontSize: 16,
              ),
            ),
            SizedBox(height: 12),
            _buildFeatureItem('🌤️  Check weather updates'),
            _buildFeatureItem('📝  Manage personal tasks (CRUD)'),
            _buildFeatureItem('📞  Contact the admin team'),
            SizedBox(height: 16),
            Text(
              'Developed with Flutter.',
              style: GoogleFonts.poppins(
                color: primaryColor.withOpacity(0.7),
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.check_circle_outline, color: primaryColor, size: 20),
          SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                color: primaryColor.withOpacity(0.85),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
