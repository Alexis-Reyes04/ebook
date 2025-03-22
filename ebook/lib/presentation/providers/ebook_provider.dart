import 'package:flutter/material.dart';
import 'package:ebook/domain/entities/image.dart';

class EbookProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<EbookPost> ebooks = [];

  Future<void> loadEbooks() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<EbookPost> newEbooks = [
      EbookPost(
        titulo: "Noches de pasiones",
        autor: "John smith",
        imageUrl: "images/1.png", // Usa la ruta del asset
        descripcion: "usar la desccripcion.",
      ),
      EbookPost(
        titulo: "Esta noche",
        autor: "Jane james",
        imageUrl: "images/2.png",
        descripcion: "usar la desccripcion",
      ),
    ];

    ebooks.addAll(newEbooks);
    initialLoading = false;
    notifyListeners();
  }
}
