import 'package:flutter/material.dart';
import 'package:ebook/domain/entities/image.dart' show EbookPost;

class EbookHomeScreen extends StatefulWidget {
  const EbookHomeScreen({super.key});

  @override
  State<EbookHomeScreen> createState() => _EbookHomeScreenState();
}

class _EbookHomeScreenState extends State<EbookHomeScreen> {
  EbookPost? selectedBook; // Almacena el libro selecionaado
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<EbookPost> ebooks = [
      EbookPost(
        title: "Cien años de soledad",
        author: "Gabriel Garcia Marquez",
        imageUrl: "assets/Imagen/1.jpg",
        description: "Clasico de literatura",
      ),
      EbookPost(
        title: "Don Quijote de la Mancha",
        author: "Miguel de Cervantes",
        imageUrl: "assets/Imagen/2.jpg",
        description: "Clasico de la literatura",
      ),
      EbookPost(
        title: "Orgullo y Prejuicio",
        author: "Jane Austen",
        imageUrl: "assets/Imagen/3.jpg",
        description: "Clasico de la literatura",
      ),
      EbookPost(
        title: "El señor de los Anillos",
        author: "J.R.R. Tolkien",
        imageUrl: "assets/Imagen/4.jpg",
        description: "Ficcion y fantasia",
      ),
      EbookPost(
        title: "El nombre del Viento",
        author: "Patrick Rothfuss",
        imageUrl: "assets/Imagen/5.jpg",
        description: "Ficcion y fantasia",
      ),
      EbookPost(
        title: "El arte de la guerra",
        author: "Sun Tzu",
        imageUrl: "assets/Imagen/6.jpg",
        description: "Negocios y desarrollo personal",
      ),
      EbookPost(
        title: "Crimen y castigo",
        author: "Fiódor Dostoyevski",
        imageUrl: "assets/Imagen/7.jpg",
        description: "Clasicos de literatura",
      ),
      EbookPost(
        title: "El gen egoista",
        author: "Richard Dawkins",
        imageUrl: "assets/Imagen/8.jpg",
        description: "Ciencia y divulgacion",
      ),
      EbookPost(
        title: "Diario de Ana Frank",
        author: "Ana Frank",
        imageUrl: "assets/Imagen/9.jpg",
        description: "Historia y biografías",
      ),
      EbookPost(
        title: "El codigo de Da Vinci",
        author: "Dan Brown",
        imageUrl: "assets/Imagen/10.jpg",
        description: "Misterio y suspenso",
      ),
      EbookPost(
        title: "La chica de tren",
        author: "Paula Hawkins",
        imageUrl: "assets/Imagen/11.jpg",
        description: "Misterio y suspenso",
      ),
      EbookPost(
        title: "Bajo la misma estrella",
        author: "John Green",
        imageUrl: "assets/Imagen/12.jpg",
        description: "Romance",
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
            _buildSearchBar(),
            const SizedBox(height: 16),
            _buildSectionTitle('Continue..'),
            _buildHorizontalBookList(ebooks.sublist(0, 4)),

            const SizedBox(height: 16),

            _buildSectionTitle('From Library'),
            _buildHorizontalBookList(ebooks.sublist(4, 8)),
            const SizedBox(height: 16),

            _buildSectionTitle('Recommendations'),
            _buildHorizontalBookList(ebooks.sublist(8)),

            if (selectedBook != null) _buildSelectedBookInfo(selectedBook!),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Índice  seleccionado
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search books...",
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildHorizontalBookList(List<EbookPost> ebooks) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ebooks.length,
        itemBuilder: (context, index) {
          EbookPost ebook = ebooks[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedBook = ebook;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue.shade300,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    ebook.imageUrl,
                    width: 100,
                    height: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.blue,
                        child: const Icon(Icons.error, color: Colors.red),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSelectedBookInfo(EbookPost ebook) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.white,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              ebook.imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ebook.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    text: "by ",
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: ebook.author,
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text("Read", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
