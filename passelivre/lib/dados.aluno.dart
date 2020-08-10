import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:passelivre/cpf.dart';

class InformacaoAluno extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _InformacaoAlunoState();
}

class _InformacaoAlunoState extends State<InformacaoAluno> {
  int _index = 0;
  File _comprovanteResidencia, _rg, _cpf, _declaracao;

  Future getImageComprovanteResidencia() async {
    var imageComprovanteResidencia =
        await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _comprovanteResidencia = imageComprovanteResidencia;
    });
  }

  Future getImageRg() async {
    var imagemRg = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _rg = imagemRg;
    });
  }

  Future getImageCpf() async {
    var imagemCpf = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _cpf = imagemCpf;
    });
  }

  Future getImagemDeclaracao() async {
    var imagemDeclaracao =
        await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _declaracao = imagemDeclaracao;
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
                  "AGORA  VAMOS TIRAR UMA FOTO DOS SEUS DOCUMENTOS PARA COMPLETAR O CADASTRO ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green),
                ),
              ),
              Container(),
              Text(
                "Agora com o comprovante de residencia RG, CPF e declaração de matrícula em mãos vamos tirar fotos deles?",
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.assignment_ind,
                          size: 30, color: Colors.green),
                      hintText: 'CPF DO Aluno '),
                  style: TextStyle(fontSize: 20)),
              Text(
                "COMPROVANTE DE RESIDÊNCIA ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: _comprovanteResidencia == null
                    ? new Text('Nenhum comprovante de residencia SELECIONADO  ')
                    : new Image.file(
                        _comprovanteResidencia,
                        width: 100,
                        height: 100,
                      ),
              ),
              FloatingActionButton(
                onPressed: getImageComprovanteResidencia,
                heroTag: 'btn-residencia',
                tooltip: 'Pick Image',
                child: new Icon(
                  Icons.photo_camera,
                ),
              ),
              Text(
                "RG ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: _rg == null
                    ? new Text('Nenhum RG SELECIONADO  ')
                    : new Image.file(
                        _rg,
                        width: 100,
                        height: 100,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              FloatingActionButton(
                onPressed: getImageRg,
                heroTag: 'btn-rg',
                tooltip: 'Pick Image',
                child: new Icon(
                  Icons.photo_camera,
                ),
              ),
              Text(
                "CPF ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: _cpf == null
                    ? new Text('Nenhum CPF SELECIONADO  ')
                    : new Image.file(
                        _cpf,
                        width: 100,
                        height: 100,
                      ),
              ),
              FloatingActionButton(
                onPressed: getImageCpf,
                tooltip: 'Pick Image',
                heroTag: 'btn-cpf',
                child: new Icon(
                  Icons.photo_camera,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "DECLARAÇÃO DE MATRÍCULA",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: _declaracao == null
                    ? new Text('Nenhum declaração de matrícula selecionada ')
                    : new Image.file(
                        _declaracao,
                        width: 100,
                        height: 100,
                      ),
              ),
              FloatingActionButton(
                onPressed: getImagemDeclaracao,
                heroTag: 'btn-declaracao',
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
