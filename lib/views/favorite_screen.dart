import 'package:dictionary/controller/dictionary_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          "Favorite Words",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      ),
      backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      body: favorite.isEmpty
          ? const Center(
              child: Text(
                'No favorites yet.',
                style: TextStyle(color: Colors.white),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 17),
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: favorite.map((word) {
                    return CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.deepOrange,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          word,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.urbanist(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
    );
  }
}


