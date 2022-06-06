import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'nav_bar.dart';
import '../model/article.dart';

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {

  //late Article currentArticle;
  int index=0;

 List<Article> articles=[
   Article(1,"Agbada pour homme","Agbada pour homme, tenue agbada, costume homme, imprimés africains, agba","agbada.jpg"),
   Article(2,"Belle robe","robes d'hiver courtes élégantes et belles","robe1.jpg"),
   Article(3,"Belle robe africaine","Robes ankara pour femmes, robes dashiki pour femmes, robes de mariée","robe2.jpg"),
   Article(4,"Belle robe africaine","Nouvelles robes d'Ankara, robes courtes d'ankara, robes dashiki pour femmes, robes d'anniversaire, robes de soirée","image6.jpg"),
   Article(5,"Belle robe","Robe chemise, col Mao, moitié Wax et moitié coton Motif du tissu au choix. Merci de nous indiquer votre choix lors de votre commande.","robe3.jpg"),
   Article(6,"Belle robe simple","Robe courte Ankara, robe dashiki, robe de mariée, robe d'anniversaire","robe4.webp"),
   Article(7,"Belle robe","Robes élégantes | Robe confortable et exquise Vente en ligne","robe6.jpg"),
   Article(8,"Dashiki pour Hommes africains","Costume africain exquis avec threading contrasté. Cet élégant costume africain pour homme est conçu de manière unique comme chemise et pantalon pour vous faire vous démarquer parmi les autres en toutes occasions.","homme1.jpg"),
   Article(9,"Adorables styles autochtones pour les enfants","Vous songez à habiller votre enfant avec une jolie tenue indigène ? Voici les meilleurs styles natifs pour enfants","enfant1.png"),
   Article(10,"Adorables styles autochtones pour les enfants","Vous songez à habiller votre enfant avec une jolie tenue indigène ? Voici les meilleurs styles natifs pour enfants","enfant9.png"),
   Article(11,"Adorables styles autochtones pour les enfants","Vous songez à habiller votre enfant avec une jolie tenue indigène ? Voici les meilleurs styles natifs pour enfants","enfant3.png"),
   Article(12,"Adorables styles autochtones pour les enfants","Vous songez à habiller votre enfant avec une jolie tenue indigène ? Voici les meilleurs styles natifs pour enfants","enfant4.jpg"),
   Article(13,"Adorables styles autochtones pour les enfants","Vous songez à habiller votre enfant avec une jolie tenue indigène ? Voici les meilleurs styles natifs pour enfants","enfant5.jpg"),
   Article(14,"Adorables styles autochtones pour les enfants","Vous songez à habiller votre enfant avec une jolie tenue indigène ? Voici les meilleurs styles natifs pour enfants","enfant6.png"),
   Article(15,"Adorables styles autochtones pour les enfants","Vous songez à habiller votre enfant avec une jolie tenue indigène ? Voici les meilleurs styles natifs pour enfants","enfant7.jpg"),
   Article(16,"Adorables styles autochtones pour les enfants","Vous songez à habiller votre enfant avec une jolie tenue indigène ? Voici les meilleurs styles natifs pour enfants","enfant8.jpg"),
   Article(17,"Modèle pour mère et fille","Styles à la mode pour les mères et les filles","merefille1.png"),
   Article(18,"Modèle pour mère et fille","Styles à la mode pour les mères et les filles","merefille2.jpg"),
   Article(19,"Modèle pour mère et fille","Styles à la mode pour les mères et les filles","merefille3.jpg"),
   Article(20,"Modèle pour mère et fille","Styles à la mode pour les mères et les filles","merefille4.jpg"),
   Article(21,"Modèle pour mère et fille","Styles à la mode pour les mères et les filles","merefille5.jpg"),
   Article(22,"Modèle pour mère et fille","Styles à la mode pour les mères et les filles","merefille6.jpg"),
   Article(23,"Modèle pour père et fils","Tenue de famille africaine invités de fête ensemble","perefils1.jpg"),
   Article(24,"COUPLES CHOCO","Tenue traditionnelle pour elle et lui","couple1.jpg"),
   Article(25,"COUPLES CHOCO","Tenue traditionnelle pour elle et lui","couple2.jpg"),
   Article(26,"COUPLES CHOCO","Tenue traditionnelle pour elle et lui","couple3.jpg"),
   Article(27,"COUPLES CHOCO","Tenue traditionnelle pour elle et lui","couple4.jpg"),
   Article(28,"COUPLES CHOCO","Tenue traditionnelle pour elle et lui","couple5.jpg"),
   Article(29,"Belle robe","robes d'hiver courtes élégantes et belles","image14.jpg"),
   Article(30,"Belle robe","robes d'hiver courtes élégantes et belles","image2.jpg"),
   Article(31,"Belle robe","robes d'hiver courtes élégantes et belles","image11.jpg"),
   Article(32,"Belle robe","robes d'hiver courtes élégantes et belles","image8.jpg"),
   Article(33,"Jolie famille","Tenue de famille africain famille africaine vêtements","image10.jpg"),
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue"),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          dragStartBehavior: DragStartBehavior.start,
           child: Column(
             children: [
              Container(
                padding: const EdgeInsets.only(top: 20.0),
                child:  Center(
                  //decoration: const BoxDecoration(color: Colors.orange),
                    child: Text("Les top modèles",
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),
                      textAlign: TextAlign.center,
                    )
                ),
              ),
               Container(
                width: MediaQuery.of(context).size.width/1.02,
                child: GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  childAspectRatio: (0.7),
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: [
                    currentarticle(articles[0]),
                    currentarticle(articles[1]),
                    currentarticle(articles[2]),
                    currentarticle(articles[3]),
                    currentarticle(articles[4]),
                    currentarticle(articles[5]),
                    currentarticle(articles[6]),
                    currentarticle(articles[7]),
                    currentarticle(articles[8]),
                    currentarticle(articles[9]),
                    currentarticle(articles[10]),
                    currentarticle(articles[11]),
                    currentarticle(articles[12]),
                    currentarticle(articles[13]),
                    currentarticle(articles[15]),
                    currentarticle(articles[16]),
                    currentarticle(articles[17]),
                    currentarticle(articles[18]),
                    currentarticle(articles[19]),
                    currentarticle(articles[20]),
                    currentarticle(articles[21]),
                    currentarticle(articles[22]),
                    currentarticle(articles[23]),
                    currentarticle(articles[24]),
                    currentarticle(articles[25]),
                    currentarticle(articles[26]),
                    currentarticle(articles[27]),
                    currentarticle(articles[28]),
                    currentarticle(articles[29]),
                    currentarticle(articles[30]),
                    currentarticle(articles[31]),
                    currentarticle(articles[32]),
                  ],
                )
              ),

             ],
           )
      ),
      bottomNavigationBar:  NavBar(selectedIndex: 2),
    );
  }

 Future<Null>detailArticle(Article article) async{
   return showDialog(
       context: context,
       barrierDismissible: true,
       builder: (BuildContext context){
         return SimpleDialog(
           elevation: 5.0,
           title: Text(
             "${article.title}",
             style: TextStyle(
               color: Colors.deepOrange,
             ),
             textScaleFactor: 1.2,
           ),
           contentPadding: EdgeInsets.all(10.0),
           backgroundColor: Colors.blue[100],
           children: <Widget> [
             Card(
               child: Container(
                 width: MediaQuery.of(context).size.width,
                 height: 350.0,
                 child: Image.asset(
                   'assets/images/${article.imagePath}',
                   fit: BoxFit.cover,
                 ),
               ),
             ),
             SizedBox(
               height: 20.0,
             ),
             Text("${article.description}",
               style: TextStyle(
                 color: Colors.grey[900],
                 fontSize: 16.0,
                 fontWeight: FontWeight.w600
               ),
             ),
           ],
         );
       }
   );
 }

 // List<Widget> currentArticle(){
 //    List<InkWell> theArticle =[];
 //    List<String> imagePath =[];
 //   while(index<articles.length){
 //     theArticle.add(InkWell(
 //       child: Container(
 //         padding: const EdgeInsets.all(8),
 //         color: Colors.blue[200],
 //         child:  Image.asset('assets/images/${articles[index].imagePath}',
 //           fit: BoxFit.cover,
 //         ),
 //       ),
 //       onTap: () {
 //         detailArticle(articles[20]);
 //       },
 //     ));
 //     index++;
 //   };
 //   return theArticle;
 // }

InkWell currentarticle(Article article){
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.blue[200],
        child:  Image.asset('assets/images/${article.imagePath}',
          fit: BoxFit.cover,
        ),
      ),
      onTap: () {
        detailArticle(article);
      },
    );
}

 // Article modelSuivant(){
 //   if(index<articles.length){
 //     index++;
 //     setState(() {
 //       currentArticle=articles[index];
 //     });
 //   }
 //   return currentArticle;
 // }
}
