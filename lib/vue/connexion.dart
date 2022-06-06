import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_app/model/user.dart';

import 'package:sqflite/sqflite.dart';
//import 'package:flutter/services.dart';

import '../Controller/services.dart';
import '../vue/catalog.dart';
import '../vue/nav_bar.dart';

class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  User userC=User();
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int _selectedIndex = 1;
  final Color primaryColor = Color(0xFFE76D47);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Connexion", textAlign: TextAlign.center,),
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.9,
                  /*decoration: BoxDecoration(
                  border: Border.all(
                      width: 5.0,
                      color: Color(0xFFFF7F7F7F)
                  )
                ),*/
                  child: Text(
                    "Renseignez vos informations pour pouvoir connectez",
                    style: TextStyle(color: Colors.grey[900], fontSize: 18.0),
                    textAlign: TextAlign.center,),
                ),
                SizedBox(
                  height: 350,
                  width: 300,
                  child: Form(
                    key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _mailController,
                            decoration: InputDecoration(
                                icon: Icon(Icons.mail_outline),
                                hintText: 'Entrez votre adresse mail',
                                labelText: 'Adresse mail*'
                            ),
                            validator: (String? value){
                              return (value==null || value=="")? "Ce champ est obligatoire" : null;
                            },
                            //   return (value==null || value=="")? "Ce champ est obligatoire" : null;
                            // },
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            controller: _passwordController,
                            decoration: InputDecoration(
                                icon: Icon(Icons.lock),
                                hintText: 'Définissez votre mot de passe',
                                labelText: 'Mot de Passe*'
                            ),
                            validator: (String? value){
                              return (value==null || value=="")? "Ce champ est obligatoire" : null;
                            },
                          )
                        ],
                      )
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print(_mailController.text);
                      versNouvellePage();
                    }
                    //versNouvellePage();
                  },
                  child: Text("Valider"),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                ),
              ],
            ),
          )
      ),
      bottomNavigationBar:  NavBar(selectedIndex: 1),
    );
  }

  void register()async{
    List<User> users=[];
    //Database database = await SQLHelper.db();
    //user.setName(_nameController.text);
   // user.setFirstName(_firstNameController.text);
    //userC.setPassword(_passwordController.text);
    //userC.setMail(_mailController.text);
    SQLHelper.getUser(userC);
    if(userC.getMail()==_mailController.text && userC.getPassword()==_passwordController.text){

    }
    SQLHelper.createUser(userC);
    users = await SQLHelper.getUsers();
    print(SQLHelper.getUsers());
  }

  void versNouvellePage(){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return Catalog();
    }));
  }
}
