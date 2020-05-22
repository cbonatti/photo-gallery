import 'package:flutter/material.dart';
import 'package:photogallery/pages/gallery/models/gallery.dart';

class GalleryDetailPage extends StatefulWidget {
  GalleryDetailPage({@required this.gallery});
  final Gallery gallery;

  @override
  _GalleryDetailPageState createState() => _GalleryDetailPageState();
}

class _GalleryDetailPageState extends State<GalleryDetailPage> {
  double initial = 0, distance = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    int moveRight() {
      if (index == widget.gallery.photos.length - 1)
        return 0;
      else
        return ++index;
    }

    int moveLeft() {
      if (index == 0)
        return widget.gallery.photos.length - 1;
      else
        return --index;
    }

    checkDistance() {
      int newIndex;
      if (distance < 0) {
        newIndex = moveRight();
      } else {
        newIndex = moveLeft();
      }
      setState(() {
        index = newIndex;
      });
    }

    final Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: GestureDetector(
          onPanStart: (DragStartDetails details) {
            initial = details.globalPosition.dx;
          },
          onPanUpdate: (DragUpdateDetails details) {
            distance = details.globalPosition.dx - initial;
          },
          onPanEnd: (DragEndDetails details) {
            initial = 0.0;
            checkDistance();
          },
          child: Image(
              image: AssetImage(
                  'assets/images/' + widget.gallery.photos[index].url),
              fit: BoxFit.fill),
        )),
        Text(
          'Autor: ' +
              widget.gallery.photos[index].author +
              ' | ' +
              (index + 1).toString() +
              '/' +
              widget.gallery.photos.length.toString(),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.gallery.title),
      ),
      body: Center(child: content),
    );
  }
}
