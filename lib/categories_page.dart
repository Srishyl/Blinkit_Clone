import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int _selectedCategoryIndex = 0;

  final List<String> _categories = [
    'Vegetables & Fruits',
    'Dairy & Breakfast',
    'Munchies',
    'Cold Drinks & Juices',
    'Instant & Frozen Food',
    'Tea, Coffee & Health Drinks',
    'Bakery & Biscuits',
    'Sweet Tooth',
    'Atta, Rice & Dal',
    'Dry Fruits, Masala & Oil',
    'Sauces & Spreads',
    'Chicken, Meat & Fish',
    'Organic & Premium',
    'Baby Care',
    'Pharma & Wellness',
    'Cleaning Essentials',
    'Home & Office',
    'Personal Care',
    'Pet Care',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Categories', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: Colors.white,
        elevation: 1,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Row(
                children: [
                   SizedBox(width: 12),
                   Icon(Icons.search, color: Colors.grey),
                   SizedBox(width: 12),
                   Text('Search for products', style: TextStyle(color: Colors.grey, fontSize: 16)),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Row(
        children: [
          // Left Side Navigation
          Container(
            width: 90,
            color: Colors.grey[100],
            child: ListView.builder(
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final isSelected = _selectedCategoryIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategoryIndex = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Colors.transparent,
                      border: Border(
                        left: BorderSide(
                          color: isSelected ? Colors.green : Colors.transparent,
                          width: 4,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.grey[300],
                          child: Icon(
                            _getCategoryIcon(index),
                            color: isSelected ? Colors.green : Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _categories[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            color: isSelected ? Colors.black : Colors.grey[800],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          
          // Right Side Products
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    _categories[_selectedCategoryIndex],
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return _buildProductItem(index);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(int index) {
    List<IconData> icons = [Icons.grass, Icons.water_drop, Icons.fastfood, Icons.local_drink, Icons.kitchen, Icons.local_cafe, Icons.bakery_dining, Icons.cake, Icons.rice_bowl, Icons.oil_barrel, Icons.soup_kitchen, Icons.set_meal, Icons.eco, Icons.child_friendly, Icons.medical_services, Icons.cleaning_services, Icons.business_center, Icons.face, Icons.pets];
    return icons[index % icons.length];
  }

  Widget _buildProductItem(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Center(
                child: Icon(Icons.image, size: 40, color: Colors.grey[300]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.timer, size: 12, color: Colors.green),
                    const SizedBox(width: 4),
                    Text('8 MINS', style: TextStyle(fontSize: 10, color: Colors.grey[700], fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Fresh Product Name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '1 pack',
                  style: TextStyle(color: Colors.grey[600], fontSize: 11),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '₹99',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'ADD',
                        style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
