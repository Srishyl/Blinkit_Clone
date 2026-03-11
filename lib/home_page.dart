import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class Product {
  final String id;
  final String name;
  final String subtitle;
  final double price;
  final String imageUrl;
  final IconData? icon;
  final Color? color;

  Product({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.imageUrl,
    this.icon,
    this.color,
  });
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _buildHeader(),
            ),
            SliverToBoxAdapter(
              child: _buildSearchBar(),
            ),
            SliverToBoxAdapter(
              child: _buildBanner(),
            ),
            SliverToBoxAdapter(
              child: _buildSectionTitle('Explore by Category'),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.8,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return _buildCategoryItem(index);
                  },
                  childCount: 8,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _buildSectionTitle('Bestsellers'),
            ),
            SliverToBoxAdapter(
              child: _buildHorizontalList(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 100), // spacing at bottom
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: const Color(0xFFF7CB46),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.black),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Delivery in 8 minutes',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    'Home - 123 Main Street',
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
            ],
          ),
          const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.black),
          )
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      color: const Color(0xFFF7CB46),
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: const [
            SizedBox(width: 12),
            Icon(Icons.search, color: Colors.grey),
            SizedBox(width: 12),
            Text(
              'Search "milk"',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(Icons.mic, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1542838132-92c53300491e?auto=format&fit=crop&q=80&w=800'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.black.withOpacity(0.3),
          ),
          child: const Center(
            child: Text(
              'Fresh Groceries\nDelivered in 8 Mins',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCategoryItem(int index) {
    List<String> categories = ['Vegetables', 'Fruits', 'Milk', 'Bread & Bakery', 'Snacks', 'Drinks', 'Meat', 'Pharmacy'];
    List<IconData> icons = [Icons.grass, Icons.apple, Icons.local_drink, Icons.bakery_dining, Icons.fastfood, Icons.local_cafe, Icons.restaurant, Icons.medical_services];
    List<Color> colors = [Colors.green, Colors.red, Colors.blue, Colors.brown, Colors.orange, Colors.brown, Colors.redAccent, Colors.teal];

    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: colors[index % colors.length].withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(
                  icons[index % icons.length],
                  size: 32,
                  color: colors[index % colors.length],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            categories[index % categories.length],
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalList() {
    final List<Product> bestsellers = [
      Product(
        id: 'p1',
        name: 'Organic Bananas',
        subtitle: '1 lb approx.',
        price: 82.0,
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBjFrEwW0hWwLStvoes0GSKj8yd-1t__dh7HoToHWsI2Rp2N-hy4EcGxlFW2R4AfKROUHvQkPRQjEv170O8ojKdKAY3_-rGBhNGQ3OOKzOsWSP9Bk50WPDy20nFk5s3-cx05XBuD4Dgtu0D6eXXbZV6WnDO-YZvvOsNXmRs0tOfqefMzgosfTxJU9qjZYKaLYPqVhXySGPXUtr8aFliJoqyP8q9W8p6_Y_dMxomjZaWgYhKe9KfArOvjjg9-54c8jPZIdSWGVwbVZA',
        icon: Icons.inventory_2,
        color: Colors.orange,
      ),
      Product(
        id: 'p2',
        name: 'Whole Milk',
        subtitle: '1 Gallon',
        price: 289.0,
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCR9rd3S24pEpRHaOSWvope8MNYPVpHy7WxZOsZHmPq09bneZ1Yz8ihg8Y77ErqG6nihLkm2p1ydtcFkiifk5riWi3jRB15qTVXpEIKlP3mljgTKwYFXv5qkBNMk0immQ-lfsZSxiIHX9NJPQFthyvqlV90N4S9nrxVls2-9iqfTLC9x2p1JL8ZhZbTzNOQFa7e3Nz7PiruTQKHEmdBlqgvyYSRDuFt2oPZXw8Zk5xqLT7jHE0ypct8gke2C7ZCoeNLL87bkuhnzJM',
        icon: Icons.local_drink,
        color: Colors.blue,
      ),
      Product(
        id: 'p3',
        name: 'Hass Avocado',
        subtitle: 'Large size',
        price: 124.0,
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBbJO29o3COfQdUHulO3q4IOpI8WfYS78-hScvfaWxo5ny2hw8IqV19WGSsoctxVxj2lpiN616j9X_1fxdyPFC1B1HvI1-4iuTzrMo1YS6b2P7GNbXbcICC2YEgPO7AwNvUDAH-mX4GyH-WgKwAfRgmhwsGTD1mQ5SCm0uVm5VhG1NeOTDXPvUl6oVpyzPbnvLbtKLYf5nOJY0ohAFCD8699GLlHRCj99QFxP4Xyk8p6VU6jEzNPZ3ovfkTYHwoj4e2B4Cpm2RX5EM',
        icon: Icons.local_florist,
        color: Colors.green,
      ),
      Product(
        id: 'p4',
        name: 'Fresh Bread',
        subtitle: '500g',
        price: 45.0,
        imageUrl: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&q=80&w=400',
        icon: Icons.bakery_dining,
        color: Colors.brown,
      ),
      Product(
        id: 'p5',
        name: 'Orange Juice',
        subtitle: '1 Litre',
        price: 150.0,
        imageUrl: 'https://images.unsplash.com/photo-1621506289937-e8e498c0b36b?auto=format&fit=crop&q=80&w=400',
        icon: Icons.local_cafe,
        color: Colors.orangeAccent,
      ),
    ];

    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: bestsellers.length,
        itemBuilder: (context, index) {
          final product = bestsellers[index];
          return Container(
            width: 150,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      image: DecorationImage(
                        image: NetworkImage(product.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product.subtitle,
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '₹${product.price.toInt()}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          _AddButton(product: product),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Product product;
  const _AddButton({required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final isInCart = cart.items.containsKey(product.id);
    final quantity = isInCart ? cart.items[product.id]!.quantity : 0;

    if (!isInCart) {
      return InkWell(
        onTap: () {
          cart.addItem(product.id, product.name, product.price, product.imageUrl, product.subtitle);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${product.name} added to cart'),
              duration: const Duration(seconds: 1),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.green[50],
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'ADD',
            style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Row(
        children: [
          IconButton(
            constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.remove, color: Colors.white, size: 16),
            onPressed: () => cart.removeSingleItem(product.id),
          ),
          Text(
            '$quantity',
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          IconButton(
            constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.add, color: Colors.white, size: 16),
            onPressed: () => cart.addItem(product.id, product.name, product.price, product.imageUrl, product.subtitle),
          ),
        ],
      ),
    );
  }
}
