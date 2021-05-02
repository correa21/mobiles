import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewExcersise extends StatefulWidget {
  const NewExcersise({
    Key key,
  }) : super(key: key);
  @override
  _NewExcersiseState createState() => _NewExcersiseState();
}

class _NewExcersiseState extends State<NewExcersise> {
  File _image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Stack(
        children: [
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 2 / 16,
            child: Card(
              elevation: 4.0,
              margin: EdgeInsets.all(24.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: Colors.grey[200],
              child: Container(height: 180),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 10,
            left: MediaQuery.of(context).size.width - 310,
            child: Container(
              margin: EdgeInsets.only(left: 16),
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 115,
                    width: 2000,
                    child: IconButton(
                      icon: Icon(Icons.add_a_photo),
                      onPressed: () {
                        try {
                          _pickImage();
                        } catch (e) {}
                      },
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height - 620,
            left: MediaQuery.of(context).size.width - 350,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.10,
              width: MediaQuery.of(context).size.width - 80,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Nombre del ejercicio',
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height - 770,
            left: MediaQuery.of(context).size.width - 350,
            child: Container(
              height: MediaQuery.of(context).size.height * .20,
              width: MediaQuery.of(context).size.width - 80,
              child: TextField(
                decoration:
                    InputDecoration(hintText: 'Descripción del ejercicio'),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height / 20,
            left: MediaQuery.of(context).size.width - 150,
            child: MaterialButton(
              child: Text('Guardar'),
              color: Colors.indigo,
              textColor: Colors.white,
              onPressed: () {
                //TODO: PUT ELEMENT TO DATA BASE
              },
            ),
          )
        ],
      ),
    );
  }

  Future _pickImage() async {
    final picker = ImagePicker();
    final PickedFile choosenImage = await picker.getImage(
      source: ImageSource.camera,
      maxHeight: 720,
      maxWidth: 720,
      imageQuality: 85,
    );
    setState(() {
      if (choosenImage != null) {
        _image = File(choosenImage.path);
      } else {
        print('No image selected');
      }
    });
  }
}
