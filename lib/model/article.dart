import 'dart:convert';

class Article {
  int? id;
  String? title;
  String? description;
  String? imagePath;

  Article(int id, String titre, String desc, String img) {
      this.id =id;
      this.title=titre;
      this.description=desc;
      this.imagePath=img;

  }

}