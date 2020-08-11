import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DadosDm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _DadosDmState();
}

class _DadosDmState extends State<DadosDm> {
  int _index = 0;
  File _imageDm;

  Future getImageimageDeclaracao() async {
    var imageimageDeclaracao =
        await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _imageDm = imageimageDeclaracao;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: AppBar(
        title: Text(' Fotos dos documentos '),
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
                  "AGORA  VAMOS TIRAR UMA FOTO DA SUA DECLARAÇÃO DE MATRÍCULA PARA COMPLETAR O CADASTRO ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green),
                ),
              ),
              Container(),
              Text(
                "Agora com a declaração de matrícula em mãos vamos tirar uma foto dela?",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Declaração de matrícula",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: _imageDm == null
                    ? new Text('Nenhuma declaração SELECIONADA')
                    : new Image.file(
                        _imageDm,
                        width: 100,
                        height: 100,
                      ),
              ),
              FloatingActionButton(
                onPressed: getImageimageDeclaracao,
                heroTag: 'btn-dm',
                tooltip: 'Pick Image',
                child: new Icon(
                  Icons.photo_camera,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
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
                            builder: (BuildContext context) => DadosDm()));
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
