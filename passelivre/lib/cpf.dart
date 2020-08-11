import 'package:flutter/material.dart';
import 'package:passelivre/dados.aluno.dart';
import 'package:passelivre/dados.comprovante.residencia.dart';
import 'package:passelivre/dados.cpf.dart';
import 'package:passelivre/dados.declaracao.matricula.dart';
import 'package:passelivre/dados.responsavelCpf.dart';

class PossuiCpf extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<PossuiCpf> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: AppBar(
        title: Text('Passe Livre - Possui CPF? '),
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
                  "INFORME SE POSSUI CPF?",
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
                  "Caso possua clique em SIM, caso não possua clique em Não  ",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Column(
                children: [
                  ButtonTheme(
                    minWidth: double.infinity,
                    height: 50,
                    buttonColor: Colors.white60,
                    child: RaisedButton.icon(
                      icon: Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                      label: Text('SIM ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => DadosCpf()));
                      },
                      padding: const EdgeInsets.all(15.0),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(10.0)),
                  ButtonTheme(
                    minWidth: double.infinity,
                    height: 50,
                    buttonColor: Colors.white60,
                    child: RaisedButton.icon(
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                      label: Text('NÃO ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    DadosCpfResponsavel()));
                      },
                      padding: const EdgeInsets.all(15.0),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
