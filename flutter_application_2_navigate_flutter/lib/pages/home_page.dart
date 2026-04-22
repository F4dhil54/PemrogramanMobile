import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    Item(name: 'Gula Pasir Premium', price: 15000, imageUrl: 'https://image.astronauts.cloud/product-images/2025/6/SusGulaPasirLokal1kg_299edd6a-0919-45fc-9f18-6ea257238cb5_900x900.jpg', stock: 25, rating: 4.8),
    Item(name: 'Garam Dapur Asli', price: 5000, imageUrl: 'https://solvent-production.s3.amazonaws.com/media/images/products/2023/07/DSC_0012.JPG', stock: 50, rating: 4.5),
    Item(name: 'Minyak Goreng 1L', price: 35000, imageUrl: 'https://media.monotaro.id/mid01/big/Perlengkapan%20Dapur%20%26%20Horeka/Makanan/Bahan%20Masak/Minyak%20Goreng/Jujur%20Cooking%20Oil%20Pouch%20(Minyak%20Goreng)/awP105477392-2.jpg', stock: 10, rating: 4.9),
    Item(name: 'Beras Pulen 5kg', price: 65000, imageUrl: 'https://c.alfagift.id/product/1/1_A8269800002167_20250407113953603_base.jpg', stock: 15, rating: 4.7),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        title: const Text('Toko Fadhil', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Rp${item.price}', 
                    style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.bold, fontSize: 16)
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(item.rating.toString(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      const Spacer(),
                      Text('Stok: ${item.stock}', style: TextStyle(fontSize: 12, color: Colors.grey[700])),
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
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      child: const Text(
        'Nama: Fadhil Syahidan Arizki | NIM: 244107060125',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }
}