import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:passelivre/consulta.dart';
import 'package:passelivre/solicita.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Tutorial',
    home: Principal(),
  ));
}

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: AppBar(
        title: Text('Passe Livre - Rapidinho'),
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
                  "SOLICITAR PASSE: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.green),
                ),
              ),
              Container(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Ao clicar no botão logo abaixo é possivel iniciar o cadastro do seu cartão de estudante",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ButtonTheme(
                  minWidth: double.infinity,
                  height: 50,
                  buttonColor: Colors.white60,
                  child: RaisedButton.icon(
                    icon: Icon(Icons.directions_bus),
                    label:
                        Text('Solicitar Passe', style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  SolicitaPasse()));
                    },
                    padding: const EdgeInsets.all(10.0),
                  )),
              Padding(padding: const EdgeInsets.all(10.0)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "CONSULTAR : ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.green),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Você pode consultar aqui quando seu cartão estará pronto !",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ButtonTheme(
                minWidth: double.infinity,
                height: 50,
                buttonColor: Colors.white60,
                child: RaisedButton.icon(
                  icon: Icon(Icons.search),
                  label: Text('Consultar Passe ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ConsultaPasse()));
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

class PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
