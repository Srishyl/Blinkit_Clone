import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'cart_provider.dart';
import 'screens/category_products_screen.dart';

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
                  childAspectRatio: 0.7,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return _buildCategoryItem(context, index);
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: BlinkitApp.accentColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.flash_on, size: 14, color: Colors.black),
                        SizedBox(width: 4),
                        Text(
                          '10 MINS',
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.notifications_none_outlined, color: Colors.black),
                  const SizedBox(width: 16),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: BlinkitApp.accentColor,
                    child: const Icon(Icons.person, color: Colors.black, size: 20),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Text(
                'HSR Layout, Bengaluru',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F3F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  SizedBox(width: 12),
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 12),
                  Text(
                    'Search for "atta dal and more"',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: BlinkitApp.accentColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.mic, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF1E56B2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 20,
              top: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'UP TO 50% OFF\nON GROCERIES',
                    style: TextStyle(
                      color: Color(0xFFD4F400),
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD4F400),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'SHOP NOW',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 20, height: 6, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(3))),
                  const SizedBox(width: 4),
                  Container(width: 6, height: 6, decoration: BoxDecoration(color: Colors.white.withOpacity(0.5), shape: BoxShape.circle)),
                  const SizedBox(width: 4),
                  Container(width: 6, height: 6, decoration: BoxDecoration(color: Colors.white.withOpacity(0.5), shape: BoxShape.circle)),
                  const SizedBox(width: 4),
                  Container(width: 6, height: 6, decoration: BoxDecoration(color: Colors.white.withOpacity(0.5), shape: BoxShape.circle)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Text(
            'See all',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    List<String> categories = [
      'Vegetables &\nFruits',
      'Dairy &\nBreakfast',
      'Munchies',
      'Cold Drinks',
      'Instant Food',
      'Cleaning',
      'Baby Care',
      'Pharma'
    ];
    List<IconData> icons = [
      Icons.grass,
      Icons.egg_outlined,
      Icons.fastfood,
      Icons.local_drink,
      Icons.soup_kitchen,
      Icons.cleaning_services_outlined,
      Icons.baby_changing_station,
      Icons.medical_services
    ];
    List<Color> colors = [Colors.blue, Colors.green, Colors.orange, Colors.blue, Colors.blue, Colors.blue, Colors.green, Colors.orange];

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryProductsScreen(
              categoryName: categories[index % categories.length].replaceAll('\n', ' '),
            ),
          ),
        );
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F3F5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: (index == 1 || index == 2 || index == 6 || index == 7) 
                    ? BlinkitApp.accentColor 
                    : const Color(0xFF1E56B2),
                  width: 2,
                ),
              ),
              child: Center(
                child: Icon(
                  icons[index % icons.length],
                  size: 32,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            categories[index % categories.length],
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
            maxLines: 2,
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
        imageUrl: 'https://images.unsplash.com/photo-1621506289937-e8e498c0b36b?auto=format&fit=crop&q=80&w=600',
        icon: Icons.local_cafe,
        color: Colors.orangeAccent,
      ),
    ];

    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: bestsellers.length,
        itemBuilder: (context, index) {
          final product = bestsellers[index];
          final hasOffer = index % 2 == 0;
          return Container(
            width: 160,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F3F5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: NetworkImage(product.imageUrl),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    if (hasOffer)
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: BlinkitApp.accentColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                          child: const Text(
                            '20% OFF',
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        index % 2 == 0 ? 'Kitchen Staples' : 'Soft Drinks',
                        style: TextStyle(color: Colors.grey[600], fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product.subtitle,
                        style: TextStyle(color: Colors.grey[500], fontSize: 11),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '₹${product.price.toInt()}',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
        },
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: BlinkitApp.accentColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.add, color: Colors.black, size: 20),
        ),
      );
    }

    return Container(
      height: 32,
      decoration: BoxDecoration(
        color: BlinkitApp.accentColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.remove, color: Colors.black, size: 14),
            onPressed: () => cart.removeSingleItem(product.id),
          ),
          Text(
            '$quantity',
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
          ),
          IconButton(
            constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.add, color: Colors.black, size: 14),
            onPressed: () => cart.addItem(product.id, product.name, product.price, product.imageUrl, product.subtitle),
          ),
        ],
      ),
    );
  }
}
