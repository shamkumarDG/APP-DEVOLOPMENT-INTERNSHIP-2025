import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  final Color darkGreen = Color(0xFF1B5E20);
  final Color mediumGreen = Color(0xFF388E3C);
  final Color lightGreen = Color(0xFFA5D6A7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreen.withOpacity(0.2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: darkGreen),
        title: Text(
          'Student Connect',
          style: GoogleFonts.poppins(
            color: darkGreen,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: darkGreen),
              child: Text(
                'Menu',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _drawerItem(context, Icons.wb_sunny, 'Weather', '/weather'),
            _drawerItem(context, Icons.checklist, 'Tasks (CRUD)', '/tasks'),
            _drawerItem(context, Icons.contact_mail, 'Contact Admin', '/contact'),
            _drawerItem(context, Icons.info, 'About', '/about'),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [lightGreen.withOpacity(0.1), mediumGreen.withOpacity(0.3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Scholar image card
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.school_outlined,
                      size: 100,
                      color: darkGreen.withOpacity(0.8),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Welcome Text
                Text(
                  'Welcome!',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: darkGreen,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Quick shortcuts to useful features.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: darkGreen.withOpacity(0.7),
                  ),
                ),
                SizedBox(height: 20),

                // Features grid
                Expanded(
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1.2,
                    children: [
                      _featureCard(
                        icon: Icons.wb_sunny_outlined,
                        title: 'Weather',
                        subtitle: 'Weather (Bengaluru)',
                        onTap: () {
                          Navigator.pushNamed(context, '/weather');
                        },
                      ),
                      _featureCard(
                        icon: Icons.checklist,
                        title: 'Tasks (CRUD)',
                        subtitle: '',
                        onTap: () {
                          Navigator.pushNamed(context, '/tasks');
                        },
                      ),
                      _featureCard(
                        icon: Icons.contact_mail_outlined,
                        title: 'Contact Admin',
                        subtitle: 'Form',
                        onTap: () {
                          Navigator.pushNamed(context, '/contact');
                        },
                      ),
                      _featureCard(
                        icon: Icons.info_outline,
                        title: 'About',
                        subtitle: '',
                        onTap: () {
                          Navigator.pushNamed(context, '/about');
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
    );
  }

  Widget _drawerItem(BuildContext context, IconData icon, String title, String routeName) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF1B5E20)),
      title: Text(title, style: GoogleFonts.poppins()),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, routeName);
      },
    );
  }

  Widget _featureCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      elevation: 3,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: Color(0xFF1B5E20)),
              SizedBox(height: 8),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1B5E20),
                ),
                textAlign: TextAlign.center,
              ),
              if (subtitle.isNotEmpty) ...[
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
