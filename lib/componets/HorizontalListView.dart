import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 100.0,
      child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
                Categoria(
                  image_location: 'images/cats/tshirt.png',
                  image_caption: 'shirt',
                ),
                 Categoria(
                  image_location: 'images/cats/dress.png',
                  image_caption: 'dress',
                ),
                Categoria(
                  image_location: 'images/cats/jeans.png',
                  image_caption: 'pants',
                ),
                Categoria(
                  image_location: 'images/cats/formal.png',
                  image_caption: 'formal',
                ),


/*          new Icon(Icons.help),
          new Icon(Icons.help),
          new Icon(Icons.help),
*/
        ],
      ),

    );
  }
}

class  Categoria extends StatelessWidget {
  final String image_location;
  final String image_caption;
      Categoria({
          this.image_location,
          this.image_caption
  });

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: () {},
          child: Container(
            width: 100.0,
            child: ListTile(
              title: Image.asset(
                  image_location,
                  width: 100.0,
                  height: 60.0),
              subtitle:Container(
                  alignment: Alignment.topCenter,
                  child: Text(image_caption, style: new TextStyle(fontSize: 12.0,color: Colors.red,fontWeight: FontWeight.bold),),
              )


            ),
          ),
        ),
      );

  }
}