import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherScreen extends StatelessWidget {
  final Color darkGreen = Color(0xFF1B5E20);
  final Color mediumGreen = Color(0xFF388E3C);
  final Color lightGreen = Color(0xFFA5D6A7);

  final List<Map<String, String>> weatherData = [
    {
      'day': 'Yesterday',
      'temp': '28°C',
      'desc': 'Partly Cloudy',
      'icon': '☁️',
    },
    {
      'day': 'Today',
      'temp': '30°C',
      'desc': 'Sunny',
      'icon': '☀️',
    },
    {
      'day': 'Tomorrow',
      'temp': '27°C',
      'desc': 'Light Rain',
      'icon': '🌧️',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with back button and green background
      appBar: AppBar(
        backgroundColor: darkGreen,
        title: Text(
          'Bengaluru Weather',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to previous screen
          },
        ),
      ),

      // Gradient background for whole screen body
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [lightGreen.withOpacity(0.4), mediumGreen.withOpacity(0.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            children: [
              Text(
                'Weather Forecast',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: darkGreen,
                ),
              ),

              SizedBox(height: 16),

              Expanded(
                child: ListView.builder(
                  itemCount: weatherData.length,
                  itemBuilder: (context, index) {
                    final weather = weatherData[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      elevation: 3,
                      child: ListTile(
                        leading: Text(
                          weather['icon']!,
                          style: TextStyle(fontSize: 32),
                        ),
                        title: Text(
                          weather['day']!,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: darkGreen,
                          ),
                        ),
                        subtitle: Text(
                          '${weather['desc']} - ${weather['temp']}',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
