import 'package:flutter/material.dart';
import 'package:google_login/utils/news_repository.dart';

import 'item_noticia.dart';

class NoticiasDeportes extends StatefulWidget {
  const NoticiasDeportes({Key key}) : super(key: key);
  @override
  _NoticiasDeportesState createState() => _NoticiasDeportesState();
}

class _NoticiasDeportesState extends State<NoticiasDeportes> {
  final _newsType = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology'
  ];
  var _newsTypeIndex = 4;
  var _selection = [false, false, false, false, false, true, false];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future:
            NewsRepository().getAvailableNoticias(_newsType[_newsTypeIndex]),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Algo salio mal", style: TextStyle(fontSize: 32)),
            );
          }
          if (snapshot.hasData) {
            return Column(children: [
              Container(
                  height: 40,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _newsType.length,
                      itemBuilder: (context, index) {
                        return ChoiceChip(
                          label: Text(_newsType[index]),
                          selected: _selection[index],
                          onSelected: (bool) {
                            setState(() {
                              _selection[_newsTypeIndex] = false;
                              _newsTypeIndex = index;
                              _selection[_newsTypeIndex] = true;
                              NewsRepository().getAvailableNoticias(
                                  _newsType[_newsTypeIndex]);
                            });
                          },
                        );
                      })),
              Container(
                  height: 553,
                  child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ItemNoticia(
                          noticia: snapshot.data[index],
                        );
                      })),
            ]);
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
