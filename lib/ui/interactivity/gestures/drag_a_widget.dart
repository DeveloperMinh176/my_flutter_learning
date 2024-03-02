import 'package:flutter/material.dart';

const List<Item> _items = <Item>[
  Item(
    name: 'Spinach Pizza',
    totalPriceCents: 1299,
    imageProvider: NetworkImage('https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg'),
  ),
  Item(
    name: 'Veggie Delight',
    totalPriceCents: 799,
    imageProvider: NetworkImage('https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Food2.jpg'),
  ),
  Item(
    name: 'Chicken Parmesan',
    totalPriceCents: 1499,
    imageProvider: NetworkImage('https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Food3.jpg'),
  ),
];

final List<Customer> _peoples = [
  Customer(
    name: 'Makayla',
    imageProvider: const NetworkImage('https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Avatar1.jpg'),
  ),
  Customer(
    name: 'Nathan',
    imageProvider: const NetworkImage('https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Avatar2.jpg'),
  ),
  Customer(
    name: 'Emilio',
    imageProvider: const NetworkImage('https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Avatar3.jpg'),
  ),
];

class DragAWidget extends StatefulWidget {
  final String title;

  const DragAWidget({super.key, required this.title});

  @override
  State<DragAWidget> createState() => _DragAWidgetState();
}

class _DragAWidgetState extends State<DragAWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF7F7F7F7),
      appBar: _buildAppBar(title: widget.title, context),
      body: _buildContent(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context,
      {required String title}) {
    return AppBar(
      backgroundColor: Color(0xF7F7F7F7),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Color(0xFFF64209),
            fontSize: 36,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildContent() {
    return SafeArea(
        child: Column(
      children: [Expanded(child: _buildMenuList(_items)), _buildPeopleRow()],
    ));
  }

  Widget _buildMenuList(List<Item> items) {
    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];
        return _buildMenuItem(item: item);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 12,
        );
      },
    );
  }

  Widget _buildPeopleRow() {
    return Container(
      color: Color(0xFFF7F7F7),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8),
        child: Row(
          children: _peoples
              .map((customer) => _buildPersonWithDropzone(customer))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildMenuItem({required Item item}) {
    return LongPressDraggable(
        data: item,
        child: MenuListItem(item: item),
        dragAnchorStrategy: pointerDragAnchorStrategy,
        feedback: DraggingListItem(photoProvider: item.imageProvider));
  }

  Widget DraggingListItem({required ImageProvider photoProvider}) {
    return FractionalTranslation(
      translation: Offset(-0.5, -0.5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: 150,
          height: 150,
          child: Opacity(
            opacity: 0.85,
            child: Image(
              image: photoProvider,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPersonWithDropzone(Customer customer) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: DragTarget<Item>(
          builder: (context, candidateData, rejectedData) {
            return CustomCart(
              customer: customer,
              hasItems: customer.items.isNotEmpty,
              hightlighted: candidateData.isNotEmpty,
            );
          },
          onAcceptWithDetails: (details) {
            _itemDroppedOnCustomerCart(item: details.data, customer: customer);
          },
        ),
      ),
    );
  }

  void _itemDroppedOnCustomerCart(
      {required Item item, required Customer customer}) {
    setState(() => customer.items.add(item));
  }
}

class CustomCart extends StatelessWidget {
  final Customer customer;
  final bool hightlighted;
  final bool hasItems;

  const CustomCart(
      {super.key,
      required this.customer,
      required this.hightlighted,
      required this.hasItems});

  @override
  Widget build(BuildContext context) {
    Color textColor = hightlighted ? Colors.white : Colors.black;
    return Transform.scale(
      scale: hightlighted ? 1.075 : 1.0,
      child: Material(
        elevation: hightlighted ? 8 : 4,
        color: hightlighted ? Color(0xFFF64209) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          child: Column(children: [
            ClipOval(
                child: SizedBox(
                    width: 46,
                    height: 46,
                    child: Image(image: customer.imageProvider))),
            SizedBox(
              height: 8,
            ),
            Text(
              customer.name,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: textColor,
                  fontWeight: hasItems ? FontWeight.normal : FontWeight.bold),
            ),
            Visibility(
                visible: hasItems,
                maintainAnimation: true,
                maintainSize: true,
                maintainState: true,
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text('\$${customer.formattedTotalItemPrice}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 4,
                    ),
                    Text('${customer.items.length} items',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: textColor, fontSize: 12)),
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}

class MenuListItem extends StatelessWidget {
  final Item item;

  const MenuListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 12,
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                  height: 120,
                  width: 120,
                  child: Image(image: item.imageProvider, fit: BoxFit.cover)),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 18)),
                  Text(item.formattedTotalItemPrice,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold))
                ],
              ),
            )
          ]),
        ));
  }
}

class Customer {
  final ImageProvider imageProvider;
  final String name;
  final List<Item> items;

  Customer({required this.imageProvider, required this.name, List<Item>? items})
      : items = items ?? [];
  String get formattedTotalItemPrice {
    int totalPriceCents =
        items.fold(0, (prev, item) => prev + item.totalPriceCents);
    return (totalPriceCents / 100).toStringAsFixed(2);
  }
}

class Item {
  final ImageProvider imageProvider;
  final String name;
  final int totalPriceCents;
  String get formattedTotalItemPrice =>
      '\$${(totalPriceCents / 100).toStringAsFixed(2)}';

  const Item(
      {required this.imageProvider,
      required this.name,
      required this.totalPriceCents});
}
