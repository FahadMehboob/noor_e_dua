import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"title": "First Ashra", "icon": Icons.wb_sunny, "color": Colors.orange},
      {
        "title": "Second Ashra",
        "icon": Icons.nights_stay,
        "color": Colors.blue
      },
      {"title": "Third Ashra", "icon": Icons.star, "color": Colors.green},
      {"title": "Sehri Dua", "icon": Icons.fastfood, "color": Colors.purple},
      {"title": "Iftar Dua", "icon": Icons.local_dining, "color": Colors.red},
      {"title": "Daily Duas", "icon": Icons.menu_book, "color": Colors.teal},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Noor-e-Dua",
            style:
                GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
      ),
      body: Column(
        children: [
          // 📌 Hero Section (Banner)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Colors.orange, Colors.deepOrange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 6)
                ],
              ),
              child: Center(
                child: Text(
                  "Duas for Every Occasion",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),

          // 📌 Dua Categories Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2-column grid
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.2, // Adjust height of items
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to dua list
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: categories[index]['color']!.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: categories[index]['color']!, width: 2),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 4)
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(categories[index]['icon'],
                              size: 40, color: categories[index]['color']),
                          const SizedBox(height: 10),
                          Text(
                            categories[index]['title'],
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
