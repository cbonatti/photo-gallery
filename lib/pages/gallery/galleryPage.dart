import 'package:flutter/material.dart';
import 'package:photogallery/pages/gallery/models/photo.dart';

import 'galleryDetailPage.dart';
import 'models/gallery.dart';

class GalleryPage extends StatefulWidget {
  final int imageSize = 300;
  final List<Gallery> galleries = <Gallery>[
    Gallery(title: 'Floresta', photos: [
      Photo(author: 'Paul Jarvis', url: '10.jpg'),
      Photo(author: 'William Hook', url: '1023.jpg'),
      Photo(author: 'Jordan McQueen', url: '1037.jpg'),
    ]),
    Gallery(title: 'Praia', photos: [
      Photo(author: 'Tina Rataj', url: '100.jpg'),
      Photo(author: 'Danielle MacInnes', url: '1001.jpg'),
      Photo(author: 'Annie Spratt', url: '1052.jpg'),
    ]),
    Gallery(title: 'Montanha', photos: [
      Photo(author: 'Lukas Budimaier', url: '1000.jpg'),
      Photo(author: 'Vladimir Kudinov', url: '1006.jpg'),
      Photo(author: 'Alexey Topolyanskiy', url: '1015.jpg'),
      Photo(author: 'Philippe Wuyts', url: '1016.jpg'),
    ]),
    Gallery(title: 'Computadores', photos: [
      Photo(author: 'Alejandro Escamilla', url: '0.jpg'),
      Photo(author: 'Alejandro Escamilla', url: '1.jpg'),
    ]),
  ];
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galeria de Fotos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Text('Selecione uma categoria:',
                    style: TextStyle(fontSize: 22))),
            Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          color: Colors.black38,
                        ),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    itemCount: widget.galleries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => GalleryDetailPage(
                                    gallery: widget.galleries[index]),
                              ),
                            );
                          },
                          child: Text(widget.galleries[index].title,
                              style: TextStyle(fontSize: 30)));
                    }))
          ],
        ),
      ),
    );
  }
}
