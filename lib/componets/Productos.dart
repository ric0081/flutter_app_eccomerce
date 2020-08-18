
import 'package:flutter/material.dart';
import 'package:flutter_app_eccomerce/pages/ProductDetails.dart';

class Products extends StatefulWidget{
  @override
  _ProductosState createState() => _ProductosState();

}

class _ProductosState extends State<Products>{
  var product_list=[
    {
      "name":"Balzer",
      "picture":"images/products/blazer1.jpeg",
      "old_price":120,
      "price":85,
    },

    {
      "name":"Red dress",
      "picture":"images/products/dress1.jpeg",
      "old_price":100,
      "price":50,
    }
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1),
        itemBuilder:(BuildContext context, int index){
          return Single_prod(
            product_name: product_list[index]['name'],
            product_picture: product_list[index]['picture'],
            product_old_price: product_list[index]['old_price'],
            product_price: product_list[index]['price']
          );
        }
    );
  }
  
}

class Single_prod extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_old_price;
  final product_price;
  Single_prod({
    this.product_name,
    this.product_picture,
    this.product_old_price,
    this.product_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
         child:Hero(
           tag: product_name,
           child: Material(
              child:
              InkWell(
                    /*Llamar a otra pagina*/
                    onTap: ()=>Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (context) => new ProductDetails())
                    ) ,


                    child:GridTile(
                          footer: Container(
                              color: Colors.white70,
                              child: ListTile(
                                  leading:
                                      Text(
                                      product_name,
                                      style: TextStyle(
                                            fontWeight: FontWeight.bold,

                                        ),
                                      ),
                                      title: Text("\$$product_price",
                                          style: TextStyle(
                                          color:Colors.lightBlue,
                                          fontWeight: FontWeight.w800
                                          )),
                                      subtitle: Text("\$$product_old_price",
                                        style: TextStyle(
                                        color:Colors.black12,
                                        fontWeight: FontWeight.w800,
                                        decoration:
                                          TextDecoration.lineThrough
                                    )),

                              ),
                          ),
                          child: Image.asset(
                                product_picture,
                                fit: BoxFit.cover,

                          )
                        ),
                        ),
                    ),
                ),

           );
  }
}
