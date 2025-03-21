import 'package:flutter/material.dart';
import 'package:ebook/domain/entities/image.dart';

class EbookProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<EbookPost> ebooks = [];

  Future<void> loadEbooks() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<EbookPost> newEbooks = [
      EbookPost(
        title: "Noches de pasiones",
        author: "John smith",
        imageUrl: "images/1.png", // Usa la ruta del asset
        description: "usar la desccripcion.",
      ),
      EbookPost(
        title: "Esta noche",
        author: "Jane james",
        imageUrl: "images/2.png",
        description: "usar la desccripcion",
      ),
    ];

    ebooks.addAll(newEbooks);
    initialLoading = false;
    notifyListeners();
  }
}
