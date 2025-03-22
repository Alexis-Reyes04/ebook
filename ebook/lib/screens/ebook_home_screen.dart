import 'package:flutter/material.dart';
import 'package:ebook/domain/entities/image.dart' show EbookPost;

//Pantalla principal de ebooks
class EbookHomeScreen extends StatefulWidget {
  const EbookHomeScreen({super.key});

  @override
  State<EbookHomeScreen> createState() => _EbookHomeScreenState();
}

// Estado asociado a la pantalla principal
class _EbookHomeScreenState extends State<EbookHomeScreen> {
  EbookPost? selectedBook; // Almacena el libro selecionaado
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    //lista de libros
    List<EbookPost> ebooks = [
      EbookPost(
        titulo: "Cien años de soledad",
        autor: "Gabriel Garcia Marquez",
        imageUrl: "assets/Imagen/1.jpg",
        descripcion: "Clasico de literatura",
      ),
      EbookPost(
        titulo: "Don Quijote de la Mancha",
        autor: "Miguel de Cervantes",
        imageUrl: "assets/Imagen/2.jpg",
        descripcion: "Clasico de la literatura",
      ),
      EbookPost(
        titulo: "Orgullo y Prejuicio",
        autor: "Jane Austen",
        imageUrl: "assets/Imagen/3.jpg",
        descripcion: "Clasico de la literatura",
      ),
      EbookPost(
        titulo: "El señor de los Anillos",
        autor: "J.R.R. Tolkien",
        imageUrl: "assets/Imagen/4.jpg",
        descripcion: "Ficcion y fantasia",
      ),
      EbookPost(
        titulo: "El nombre del Viento",
        autor: "Patrick Rothfuss",
        imageUrl: "assets/Imagen/5.jpg",
        descripcion: "Ficcion y fantasia",
      ),
      EbookPost(
        titulo: "El arte de la guerra",
        autor: "Sun Tzu",
        imageUrl: "assets/Imagen/6.jpg",
        descripcion: "Negocios y desarrollo personal",
      ),
      EbookPost(
        titulo: "Crimen y castigo",
        autor: "Fiódor Dostoyevski",
        imageUrl: "assets/Imagen/7.jpg",
        descripcion: "Clasicos de literatura",
      ),
      EbookPost(
        titulo: "El gen egoista",
        autor: "Richard Dawkins",
        imageUrl: "assets/Imagen/8.jpg",
        descripcion: "Ciencia y divulgacion",
      ),
      EbookPost(
        titulo: "Diario de Ana Frank",
        autor: "Ana Frank",
        imageUrl: "assets/Imagen/9.jpg",
        descripcion: "Historia y biografías",
      ),
      EbookPost(
        titulo: "El codigo de Da Vinci",
        autor: "Dan Brown",
        imageUrl: "assets/Imagen/10.jpg",
        descripcion: "Misterio y suspenso",
      ),
      EbookPost(
        titulo: "La chica de tren",
        autor: "Paula Hawkins",
        imageUrl: "assets/Imagen/11.jpg",
        descripcion: "Misterio y suspenso",
      ),
      EbookPost(
        titulo: "Bajo la misma estrella",
        autor: "John Green",
        imageUrl: "assets/Imagen/12.jpg",
        descripcion: "Romance",
      ),
      EbookPost(
        titulo: "La cosas que perdimos en el fuego",
        autor: "Mariana Enriquez",
        imageUrl: "assets/Imagen/13.jpg",
        descripcion: "Terro y realismo oscuro",
      ),
      EbookPost(
        titulo: "La odisea",
        autor: "Homero",
        imageUrl: "assets/Imagen/14.jpg",
        descripcion: "Epica",
      ),
      EbookPost(
        titulo: "Romeo y Julieta",
        autor: "William Shakespeare",
        imageUrl: "assets/Imagen/15.jpg",
        descripcion: "Tragedia",
      ),
      EbookPost(
        titulo: "Madame Bovary",
        autor: "Gustave Flaubert",
        imageUrl: "assets/Imagen/16.jpg",
        descripcion: "Realismo",
      ),
      EbookPost(
        titulo: "En busca del tiempo perdido",
        autor: "Marcel Proust",
        imageUrl: "assets/Imagen/17.jpg",
        descripcion: "Modernismo",
      ),
      EbookPost(
        titulo: "Matar a un ruiseñor",
        autor: "Harper Lee",
        imageUrl: "assets/Imagen/18.jpg",
        descripcion: "Ficcion social",
      ),
      EbookPost(
        titulo: "Ulises",
        autor: "James Joyce",
        imageUrl: "assets/Imagen/19.jpg",
        descripcion: "Vanguardismo",
      ),
      EbookPost(
        titulo: "Pedro parramo",
        autor: "Juan Rulfo",
        imageUrl: "assets/Imagen/20.jpg",
        descripcion: "Realismo magico",
      ),
      EbookPost(
        titulo: "El extranjero",
        autor: "Albert Camus",
        imageUrl: "assets/Imagen/21.jpg",
        descripcion: "Existencialismo",
      ),
      EbookPost(
        titulo: "La casa de los espiritus",
        autor: "Isabel Allende",
        imageUrl: "assets/Imagen/22.jpg",
        descripcion: "Realimso magico",
      ),
      EbookPost(
        titulo: "Los hermanos Karamazov",
        autor: "Fiódor Dostoyevski ",
        imageUrl: "assets/Imagen/23.jpg",
        descripcion: "Psicológica / Filosófica",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Book App'),
        // Icono de busqueda sin funcionalidad
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      //Cuerpo desplazamiento vertical
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            const SizedBox(height: 16),
            //Seccion de libros continue
            _buildSectionTitle('Continue..'),
            _buildHorizontalBookList(ebooks.sublist(0, 8)),
            const SizedBox(height: 16),

            //Seccion de libros from library
            _buildSectionTitle('From Library'),
            _buildHorizontalBookList(ebooks.sublist(8, 15)),
            const SizedBox(height: 16),

            //Seccion de libros recommendations
            _buildSectionTitle('Recommendations'),
            _buildHorizontalBookList(ebooks.sublist(15)),

            if (selectedBook != null) _buildSelectedBookInfo(selectedBook!),
          ],
        ),
      ),
      //Barra para navegacion inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Índice  seleccionado
        onTap: (index) {
          setState(() {
            _currentIndex = index; //Actualiza el indice seleccionado
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          //Botones de la parte inferior horizontal
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }

  //Metodo para realizar la busqueda
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

  //Metodo para realizar el titulo de una seccion
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  //Metodo para la creacion de lista de libros horizontal
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

  //Muestra la informacion del libro selecionado
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
                  ebook.titulo,
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
                        text: ebook.autor,
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
