import 'package:flutter/material.dart';
import 'package:rest_api_with_getx/models/product.dart';

class ProductTile extends StatelessWidget {
  const ProductTile(this.product);

  final Product product;

  Size getRealSize(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appBarSize = MediaQuery.of(context).padding.top + kToolbarHeight;

    return Size(size.width, size.height - appBarSize);
  }

  @override
  Widget build(BuildContext context) {
    final size = getRealSize(context);

    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  product.imageLink,
                  alignment: Alignment.center,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.blue,
                    ),
                    backgroundColor: Colors.white,
                  ),
                )
              ],
            ),
            Text(
              product.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            //Rating Element
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: size.width * 0.15,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        '${product.rating ?? '0.0'}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.star_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '\$ ${product.price}',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
          ],
        ),
      ),
    );
  }
}
