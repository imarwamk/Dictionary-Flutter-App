import 'package:dictionary/Widget/info_card.dart';
import 'package:dictionary/controller/dictionary_cubit.dart';
import 'package:dictionary/states/dictionary_state.dart';
import 'package:dictionary/views/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';



class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DictionaryCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 21, 21, 21),
        title: RichText(
          text: TextSpan(
            style: GoogleFonts.montserrat(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.deepOrange,
            ),
            children: [
              TextSpan(
                text: 'Marwa ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const TextSpan(text: 'Dictionary'),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: IconButton(
              icon: Icon(Icons.bookmark, size: 35, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FavoriteScreen()),
                );
              },
            ),
          ),
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 21, 21, 21),
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              style: GoogleFonts.urbanist(color: Colors.white),
              onSubmitted: (value) => cubit.search(value.trim()),
              decoration: InputDecoration(
                hintText: 'Search about word',
                hintStyle: TextStyle(color: Colors.white60),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.deepOrange),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<DictionaryCubit, DictionaryState>(
                builder: (context, state) {
                  if (state is DictionaryLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is DictionaryFailure) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (state is DictionarySuccess) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          InfoCard(
                            title: "Word",
                            value: state.word,
                            backgroundColor: Color.fromARGB(255, 226, 79, 17),
                            borderColor: const Color.fromARGB(255, 13, 12, 12),
                            icons: Icons.favorite,
                            onIconPressed: () {
                              addToFavorites(state.word);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Added to Bookmark"),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          InfoCard(
                            title: "Meaning",
                            value: state.meaning,
                            backgroundColor: Color.fromARGB(122, 25, 25, 25),
                            borderColor: Colors.white,
                          ),
                          const SizedBox(height: 16),
                          InfoCard(
                            title: "Example",
                            value: state.example,
                            backgroundColor: Color.fromARGB(122, 25, 25, 25),
                            isItalic: true,
                            borderColor: Colors.white,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        "Search a word to get started.",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}