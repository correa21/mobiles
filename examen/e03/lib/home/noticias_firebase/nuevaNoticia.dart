import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_login/models/new.dart';

import 'bloc/my_news_bloc.dart';

class NuevaNoticia extends StatefulWidget {
  NuevaNoticia({Key key}) : super(key: key);

  @override
  _NuevaNoticiaState createState() => _NuevaNoticiaState();
}

class _NuevaNoticiaState extends State<NuevaNoticia> {
  MyNewsBloc newsBloc;
  File slectedImage;
  var autorTc = TextEditingController();
  var tituloTc = TextEditingController();
  var descrTc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        newsBloc = MyNewsBloc();
        return newsBloc;
      },
      child: BlocConsumer<MyNewsBloc, MyNewsState>(
        listener: (context, state) {
          if (state is PickedImageState) {
            slectedImage = state.image;
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text("Imagen seleccionada"),
                ),
              );
          } else if (state is SavedNewState) {
            autorTc.clear();
            tituloTc.clear();
            descrTc.clear();
            slectedImage = null;
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text("Noticia guardada.."),
                ),
              );
          } else if (state is ErrorMessageState) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text("No se pudo guardar la noticia."),
                ),
              );
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return _createForm();
        },
      ),
    );
  }

  Widget _createForm() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            slectedImage != null
                ? Image.file(
                    slectedImage,
                    fit: BoxFit.contain,
                    height: 120,
                    width: 120,
                  )
                : Container(
                    height: 120,
                    width: 120,
                    child: Placeholder(),
                  ),
            SizedBox(height: 16),
            TextField(
              controller: autorTc,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Autor',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: tituloTc,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Titulo',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: descrTc,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Descripcion',
              ),
            ),
            SizedBox(height: 16),
            MaterialButton(
              child: Text("Imagen"),
              onPressed: () {
                newsBloc.add(PickImageEvent());
              },
            ),
            MaterialButton(
              child: Text("Guardar"),
              onPressed: () {
                newsBloc.add(
                  SaveNewElementEvent(
                    noticia: New(
                      author: autorTc.text,
                      title: tituloTc.text,
                      description: descrTc.text,
                      publishedAt: DateTime.now(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
