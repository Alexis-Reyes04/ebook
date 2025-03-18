import 'package:ebook/domain/entities/image.dart' show EbookPost;
import 'package:flutter/material.dart';

class EbookHomeScreen extends StatelessWidget {
  const EbookHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<EbookPost> ebooks = [
      EbookPost(
        title: "Learning Flutter",
        author: "John Doe",
        imageUrl: "https://example.com/flutter_cover.jpg",
        description: "A comprehensive guide to learning Flutter.",
      ),
      EbookPost(
        title: "Mastering Dart",
        author: "Jane Doe",
        imageUrl: "https://example.com/dart_cover.jpg",
        description: "Deep dive into Dart programming language.",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Book App'),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Títulos y listas horizontales de los libros
            _buildSectionTitle('Continue..'),
            _buildHorizontalBookList(ebooks),
            const SizedBox(height: 16),
            _buildSectionTitle('From Library'),
            _buildHorizontalBookList(ebooks),
            const SizedBox(height: 16),
            _buildSectionTitle('Recommendations'),
            _buildHorizontalBookList(ebooks),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }

  // Widget para los títulos de las secciones
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Widget para la lista horizontal de libros
  Widget _buildHorizontalBookList(List<EbookPost> ebooks) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ebooks.length,
        itemBuilder: (context, index) {
          EbookPost ebook = ebooks[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300,
              ),
              child: Column(
                children: [
                  Image.network(
                    ebook.imageUrl,
                    width: 80,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    ebook.title,
                    style: const TextStyle(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
