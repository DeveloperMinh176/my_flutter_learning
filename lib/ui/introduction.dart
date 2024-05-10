import 'package:flutter/material.dart';

class Shopping extends StatelessWidget {
  const Shopping({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
            child: Column(
      children: [
        Container(
          height: 56,
          decoration: BoxDecoration(color: Colors.blue[500]),
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
              tooltip: 'Menu',
            ),
            Expanded(
                child: Text(
              'Shopping List',
              style: Theme.of(context).primaryTextTheme.titleLarge,
            )),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              tooltip: 'Search',
            ),
          ]),
        ),
        Expanded(
          child: ShoppingList(
            products: <Product>[
              Product(name: 'Chocolate'),
              Product(name: 'Cream'),
              Product(name: 'Coffee')
            ],
          ),
        ),
      ],
    )));
  }
}

class Product {
  final String name;

  Product({required this.name});
}

class ShoppingList extends StatefulWidget {
  ShoppingList({super.key, required this.products});
  final List<Product> products;

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <Product>{};
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      for (final product in widget.products)
        ShoppingListItem(
          product: product,
          inCart: _shoppingCart.contains(product),
          onCartChanged: _handleCartChanged,
        ),
    ]);
  }

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }
}

typedef CartChangedCallback = Function(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem(
      {super.key,
      required this.product,
      required this.inCart,
      required this.onCartChanged});
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color? _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle() {
    if (!inCart) return null;
    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () => onCartChanged(product, inCart),
        leading: CircleAvatar(
          backgroundColor: _getColor(context),
          child: Text(product.name[0]),
        ),
        title: Text(product.name, style: _getTextStyle()));
  }
}
