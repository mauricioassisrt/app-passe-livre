import 'package:flutter/material.dart';
import 'package:passelivre/resultado.dart';

class ConsultaPasse extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<ConsultaPasse> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: AppBar(
        title: Text('Passe Livre - Consultar Cadastro '),
        backgroundColor: Colors.green[500],
      ),
      backgroundColor: Colors.lightGreen[50],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              _index = index;
            });
          },
          currentIndex: _index,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.directions_bus, color: Colors.green),
              title: new Text("Solicitar  Passe"),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.green),
                title: new Text("Consultar Situação ")),
          ]),
      // body is the majority of the screen.
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Container(
          padding: const EdgeInsets.all(10.0),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "PESQUISAR SITUAÇÃO DO CARTÃO  ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green),
                ),
              ),
              Container(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Caso já tenha realizado o cadastro, digite seu CPF do Aluno ou Responsával ",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon:
                          Icon(Icons.person_pin, size: 30, color: Colors.green),
                      hintText: 'CPF do Responsavel ou Aluno'),
                  style: TextStyle(fontSize: 20)),
              ButtonTheme(
                minWidth: double.infinity,
                height: 50,
                buttonColor: Colors.white60,
                child: RaisedButton.icon(
                  icon: Icon(
                    Icons.search,
                    color: Colors.green,
                  ),
                  label: Text('Buscar ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Resultado()));
                  },
                  padding: const EdgeInsets.all(15.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
