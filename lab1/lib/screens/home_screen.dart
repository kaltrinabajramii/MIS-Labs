import 'package:flutter/material.dart';
import '../models/clothing_item.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<ClothingItem> items = [
    ClothingItem(
      id: 1,
      name: 'T-Shirt',
      description: 'Comfortable cotton t-shirt',
      price: 29.99,
      imageUrl: 'assets/tshirt1.jpg',
    ),
    ClothingItem(
      id: 2,
      name: 'T-Shirt',
      description: 'Comfortable cotton t-shirt',
      price: 29.99,
      imageUrl: 'assets/tshirt2.jpg',
    ),
    ClothingItem(
      id: 3,
      name: 'T-Shirt',
      description: 'Comfortable cotton t-shirt',
      price: 29.99,
      imageUrl: 'assets/tshirt3.jpg',
    ),
    ClothingItem(
      id: 4,
      name: 'Blouse',
      description: 'Comfortable cotton t-shirt',
      price: 39.99,
      imageUrl: 'assets/bluza1.jpg',
    ),
    ClothingItem(
      id: 5,
      name: 'Blouse',
      description: 'Comfortable cotton t-shirt',
      price: 39.99,
      imageUrl: 'assets/bluza2.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '211530',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(item: items[index]),
                ),
              );
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                        image: DecorationImage(
                          image: AssetImage(items[index].imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          items[index].name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '\$${items[index].price}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}