import 'package:flutter/material.dart';
import 'package:passelivre/cpf.dart';

class SolicitaPasse extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<SolicitaPasse> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: AppBar(
        title: Text('Passe Livre - Nova Solicitação '),
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
              title: new Text("Solicitar Passe"),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.green),
                title: new Text("Consultar Situação ")),
          ]),
      // body is the majority of the screen.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: new Container(
          padding: const EdgeInsets.all(10.0),
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "INFORME OS DADOS DO ALUNO  ",
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
                  "Nesta tela informe os dados que constam no seu documento pessoal ",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.assignment_ind,
                          size: 30, color: Colors.green),
                      hintText: 'Nome completo do Aluno'),
                  style: TextStyle(fontSize: 20)),
              TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.person, size: 30, color: Colors.green),
                      hintText: 'Nome do Responsavel'),
                  style: TextStyle(fontSize: 20)),
              TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.location_city,
                          size: 30, color: Colors.green),
                      hintText: 'Naturalidade - Cidade onde Nasceu'),
                  style: TextStyle(fontSize: 20)),
              TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.phone_android,
                        color: Colors.green,
                        size: 30,
                      ),
                      hintText: 'Telefone para Contato'),
                  style: TextStyle(
                    fontSize: 20,
                  )),
              ButtonTheme(
                minWidth: double.infinity,
                height: 50,
                buttonColor: Colors.white60,
                child: RaisedButton.icon(
                  icon: Icon(Icons.send),
                  label: Text('Próximo ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => PossuiCpf()));
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
