import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));


}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' home screen'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          
          children: [
            ElevatedButton(
              
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DetailScreen()),
            );
          },
          child: const Text( "Go To Detailes"),
        ),
        SizedBox(
          width: 10,
        ),
        
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  ProductListScreen()),
            );
          },
          child: const Text( "Go To Detailes whith parameter"),
        ),
          ],
        )
      ),
    );
  }
}

// --- شاشة التفاصيل ---
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(' Go To Home Screen '),
        ),
      ),
    );
  }
}



class Product {
  final String name;
  final String description;
  final double price;
  final IconData icon; 

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.icon,
  });
}


class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  final List<Product> products = [
    Product(name: 'laptop', description: '   this is only for Devlopers !', price: 1200.0, icon: Icons.laptop),
    Product(name: 'smart phone', description: ' smart phone with big screen', price: 800.0, icon: Icons.smartphone),
    Product(name: 'keybord', description: ' keybord for professionals', price: 150.0, icon: Icons.keyboard),
    Product(name: 'key for car', description: ' custom keys for cars', price: 150.0, icon: Icons.car_rental),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('list product '),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            color: const Color.fromARGB(255, 185, 235, 230),
            child: ListTile(
              leading: Icon(product.icon, size: 40),
              title: Text(product.name),
              subtitle: Text('price \$${product.price}'),
              onTap: ()  {
                   Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                );
            
                
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Icon(product.icon, size: 100, color: Colors.blueGrey)),
            const SizedBox(height: 20),
            Text('name: ${product.name}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Description: ${product.description}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('price: \$${product.price}', style: const TextStyle(fontSize: 20, color: Colors.green)),
            const Spacer(),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, ' go back sucessfully !   ${product.name}');
                },
                child: const Text(' go back '),
              ),
            ),
          ],
        ),
      ),
    );
  }
}