import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mini_app/Controller/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';
import '../model/user.dart';
import '../vue/connexion.dart';
import 'package:mini_app/vue/nav_bar.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {

  User user= User();
  final _nameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _displayInfo = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('ISCRIPTION', textAlign: TextAlign.center,),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width*0.9,
                child: Text("Renseignez vos informations pour pouvoir créer un compte",style: TextStyle(color: Colors.grey[900],fontSize: 18.0),textAlign: TextAlign.center,),
              ),
              SizedBox(
                height: 300,
                width: 300,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _nameController,
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: 'Entrer votre nom',
                            labelText: 'Nom*'
                        ),
                        validator: (String? value){
                          return (value==null || value=="")? "Ce champ est obligatoire" : null;
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _firstNameController,
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: 'Entrer votre prénom',
                            labelText: 'Prenom*'
                        ),
                        validator: (String? value){
                          return (value==null || value=="")? "Ce champ est obligatoire" : null;
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _mailController,
                        decoration: InputDecoration(
                            icon: Icon(Icons.mail_outline),
                            hintText: 'Entrer votre adresse mail',
                            labelText: 'Adresse mail*'
                        ),
                        validator: (String? value){
                          return (value==null || value=="")? "Ce champ est obligatoire" : null;
                        },
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
                  ),
                ),
              ),
              TextButton(
                  onPressed: (){
                    versNouvellePage();
                  },
                  child: Text("J'ai déjà un compte")
              ),
              TextButton(
                onPressed: ()async{
                  if(formKey.currentState!.validate()){
                    register();
                    Fluttertoast.showToast(
                        msg: "Votre compte a été créé avec succès !!",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM
                    );
                    versNouvellePage();
                  }
                },
                child: Text("Valider"),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(selectedIndex: 0),
    );
  }

  Future<Null> _displayDialog(BuildContext context)async{
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Confirmation'),
            content: Text("Le compte a été créer avec succès"),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context,'OK');
                  },
                  child: Text("OK")
              )
            ],
          );
        }
    );
  }
  void register()async{
    User currentUser;
    List<User> users=[];
    //Database database = await SQLHelper.db();
    user.setName(_nameController.text);
    user.setFirstName(_firstNameController.text);
    user.setPassword(_passwordController.text);
    user.setMail(_mailController.text);
    currentUser=SQLHelper.createUser(user) as User;
    print(currentUser.getId().toString());
    users = await SQLHelper.getUsers();
    print(SQLHelper.getUsers());
  }

  void versNouvellePage(){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return Connexion();
    }));
  }
}
