import 'package:app_loja_online/datas/cart_product.dart';
import 'package:app_loja_online/datas/product_data.dart';
import 'package:app_loja_online/models/cart_model.dart';
import 'package:app_loja_online/models/user_model.dart';
import 'package:app_loja_online/screens/cart_screen.dart';
import 'package:app_loja_online/screens/login_screen.dart';
import 'package:app_loja_online/widgets/cart_button.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductScreen extends StatefulWidget {
  final ProductData product;
  ProductScreen(this.product);

  @override
  State<ProductScreen> createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductData product;
  String? selectedSize;
  _ProductScreenState(this.product);
  int _current = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            product.title!,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                ),
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1.5,
                      child: CarouselSlider(
                        carouselController: _carouselController,
                        items: product.images!.map((url) {
                          return Image.network(url);
                        }).toList(),
                        options: CarouselOptions(
                          pageSnapping: true,
                          enlargeCenterPage: true,
                          autoPlay: false,
                          aspectRatio: 1.0,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: product.images!.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _carouselController.animateToPage(entry.key),
                          child: Container(
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    (Theme.of(context).brightness == Brightness.dark
                                            ? Colors.white
                                            : Theme.of(context).primaryColor)
                                        .withOpacity(
                                            _current == entry.key ? 0.9 : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title!,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 20.0),
                  ),
                  Text(
                    "R\$ ${product.price!.toStringAsFixed(2)}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    product.description!,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  const SizedBox(height: 20),
                  const Text("Tamanhos", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                  SizedBox(
                    height: 34.0,
                    child: GridView(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 0.5,
                        mainAxisSpacing: 8.0,
                        ),
                        children: product.sizes!.map((sizes) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = sizes;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: sizes == selectedSize? Theme.of(context).primaryColor : Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                border: Border.all(color: sizes == selectedSize ? Theme.of(context).primaryColor : Colors.grey , width: 1)
                              ),
                              alignment: Alignment.center,
                              width: 50,
                              child: Text(sizes, textAlign: TextAlign.center, style: TextStyle(
                                fontWeight: sizes == selectedSize ? FontWeight.bold : FontWeight.normal,
                                color: sizes == selectedSize ? Colors.white : Colors.black
                              ),),
                            ),
                          );
                        }). toList(),
                        ),
                  ),
                  Center(
                    child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                    fixedSize: const Size(250, 50),
                    elevation: 20,
                    backgroundColor: selectedSize != null ? Theme.of(context).primaryColor : Colors.grey,
                                  ),
                                onPressed: selectedSize != null ?
                                (){
                                  if(UserModel.of(context).isLoggedIn()) {
                                    //adicionar ao carrinho
                                    CartProduct cartProduct = CartProduct();
                                    cartProduct.size = selectedSize;
                                    cartProduct.quantity = 1;
                                    cartProduct.pid = product.id;
                                    cartProduct.category = product.category;
                                    cartProduct.productData = product;
                                    CartModel.of(context).addCartItem(cartProduct);
                                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen(),));
                                  } else {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen(),));
                                  }
                                } 
                                : 
                                null, 
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                    const Icon(Icons.shopping_cart, color: Colors.white,),
                    const SizedBox(width: 20,),
                    Text(UserModel.of(context).isLoggedIn() ? "Adicionar ao Carrinho" : "Entre para comprar", style: const TextStyle(color: Colors.white),)
                                  ],
                                ),
                                ),
                              ),
                  ),
                ],
              ),
            ),
            
            
          ],
        ),
        floatingActionButton: CartButton(),
        );
  }
}
