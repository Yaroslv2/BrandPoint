import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:test_project/api/data/product.dart';
import 'package:test_project/design/styles.dart';

class ProductForm extends StatefulWidget {
  final Product product;

  const ProductForm({super.key, required this.product});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  Widget sizeButton(index) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        height: 50,
        width: 80,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25))),
          child: Text(
            "${widget.product.sizes[index]}",
            style: mainTextStyleBlack,
            textScaleFactor: 1,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            expandedHeight: 400,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Swiper(
                itemCount: widget.product.images.length,
                itemBuilder: (context, index) => Image(
                  image: widget.product.images[index],
                  fit: BoxFit.contain,
                ),
                autoplay: false,
              ),
            ),
            pinned: false,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Text(
                          "${widget.product.label}",
                          style: ProductPageStyle().productLabelStyle,
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Text(
                          "Sizes",
                          style: mainTextStyleBlack,
                        ),
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.product.sizes.length,
                            itemBuilder: ((context, index) {
                              return sizeButton(index);
                            })),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
