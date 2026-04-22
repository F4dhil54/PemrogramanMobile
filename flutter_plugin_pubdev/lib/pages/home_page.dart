import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    Item(
      name: 'Smartphone Android',
      price: 2500000,
      imageUrl:
          'https://imgsrv2.voi.id/9Le_rwV-QWypUEoItXWG7GcOK62OC-C9XrMogx0oCA8/auto/1200/675/sm/1/bG9jYWw6Ly8vcHVibGlzaGVycy80MzA5NTcvMjAyNDExMDQyMjE0LW1haW4uY3JvcHBlZF8xNzMwNzMzMjUzLnBuZw.jpg',
      stock: 12,
      rating: 4.7,
    ),
    Item(
      name: 'Laptop Ultrabook',
      price: 8500000,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_IDhrVHVK39-a_g4gqc_ZL_6sSEAn5PJUbQ&s',
      stock: 8,
      rating: 4.8,
    ),
    Item(
      name: 'Headset Gaming',
      price: 450000,
      imageUrl:
          'https://png.pngtree.com/png-vector/20240806/ourmid/pngtree-blue-gaming-headphones-with-led-lights---3d-render-png-image_13396977.png',
      stock: 20,
      rating: 4.6,
    ),
    Item(
      name: 'Smart TV 43 Inch',
      price: 4200000,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT23lAmvWY58SrxFpd9UZjKP2_agzALTn_LEQ&s',
      stock: 6,
      rating: 4.9,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Toko Elektronik',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ItemCard(item: items[index]);
              },
            ),
          ),
          const FooterWidget(),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go('/item', extra: item),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: item.name,
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Rp${item.price}',
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        item.rating.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Stok: ${item.stock}',
                        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: const Text(
        'Nama: Rojalingga Prana Abinaya | NIM: 244107060070',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}