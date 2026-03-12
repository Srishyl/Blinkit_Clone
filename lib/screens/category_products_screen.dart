import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart_provider.dart';
import '../main.dart';

class CategoryProductsScreen extends StatefulWidget {
  final String categoryName;
  const CategoryProductsScreen({super.key, this.categoryName = 'Dairy & Breakfast'});

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  String selectedSubCategory = 'Milk';

  final List<Map<String, String>> products = [
    {'id': 'm1', 'name': 'Amul Taaza Toned Fresh Milk', 'size': '500 ml', 'price': '27', 'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDteyfHk9UGu2OBFIyLfm8uhhHtfcTx7V21IYFZMMRbPg9xRXzTmX4pVFfdqS43TWr_mvoovZ14lItXRhIqqbHF-NcmPvvv5pJv01jBMiIRdCBF3-wKao2fcZnEuAfwjJWUmcxdC-gFL4mfNfUU8b2GOJ95TILpQ0eifLAzYGcUJO8jKt0P7JNE-1JdGiDx9bPMseFY0pjYYAXrIqkGeUcBQ2fqNF2USplO8XBhIzhnSXrQ3xe3WyTfdjruXfgOhBitKs0GUirUb6M'},
    {'id': 'm2', 'name': 'Mother Dairy Full Cream Milk', 'size': '500 ml', 'price': '33', 'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuBkSbw64P8vT7LVo2ZK_Hl8KHhS4qPx2H8G39nWmDPF3rRH2u8_R0XeSD5qXRaJpo1zlVbdtOwVd9P899k6TY_rkjbLfCH5NA3WmFp9R6lhaD02Tyi0a7i0gLHdeI0VTuw1VoRlu3MwgWGl9zvJRQE4rn_28tStxfbhW-Nz22KPtIrrKUv9-HBWid2SSKBbep2waJb9eoy6TnK8pVtpubVibRv1Tgo9vF7SK_6cjyi36fVE4xtkBehf4HQZZR2k0ThAqJOfga1sXCQ'},
    {'id': 'm3', 'name': 'Nandini GoodLife Toned Milk', 'size': '500 ml', 'price': '28', 'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuB4ozuS452FOnuUGUMOQwvzDKTFu_-xRfb1lqvegUlsni3z-qVr6Lm85F-2TPmYsrn5bAESBjPVgsYcJFkUKwY08ixruqeNYi32K17uPnk-iNodEr9-lPDgvc2UFH2kqAnvttwX0gWGBmv-QybGNEJZCl_mCXiNTpj28-OIpZQQXqMh281tVuHuqF-u2ebdHBy3xNJkI_MGyVrONnsG_0RFpChBxAn3LkYSjB1T2IlKD5M638vtTL2uHGOlKnNtZuciNVAo6gg-Gp0'},
    {'id': 'm4', 'name': 'Akshayakalpa Organic Cow Milk', 'size': '1 L', 'price': '90', 'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuB4ozuS452FOnuUGUMOQwvzDKTFu_-xRfb1lqvegUlsni3z-qVr6Lm85F-2TPmYsrn5bAESBjPVgsYcJFkUKwY08ixruqeNYi32K17uPnk-iNodEr9-lPDgvc2UFH2kqAnvttwX0gWGBmv-QybGNEJZCl_mCXiNTpj28-OIpZQQXqMh281tVuHuqF-u2ebdHBy3xNJkI_MGyVrONnsG_0RFpChBxAn3LkYSjB1T2IlKD5M638vtTL2uHGOlKnNtZuciNVAo6gg-Gp0'},
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Navigator.pop(context)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.categoryName, style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
            const Text('15 MINS', style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Colors.black), onPressed: () {}),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black), onPressed: () {}),
              if (cart.items.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                    constraints: const BoxConstraints(minWidth: 14, minHeight: 14),
                    child: Text('${cart.items.length}', style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Row(
        children: [
          _buildSidebar(),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Buy $selectedSubCategory (12)', style: const TextStyle(fontWeight: FontWeight.bold)),
                      Row(
                        children: const [
                          Text('Sort By', style: TextStyle(color: Colors.green, fontSize: 12)),
                          Icon(Icons.keyboard_arrow_down, color: Colors.green, size: 16),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return _buildProductCard(products[index], cart);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: cart.items.isNotEmpty ? _buildBottomBar(cart) : null,
    );
  }

  Widget _buildSidebar() {
    List<String> subCategories = ['Milk', 'Curd', 'Butter', 'Paneer', 'Eggs'];
    return Container(
      width: 80,
      color: const Color(0xFFF2F3F5),
      child: ListView.builder(
        itemCount: subCategories.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedSubCategory == subCategories[index];
          return InkWell(
            onTap: () => setState(() => selectedSubCategory = subCategories[index]),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.transparent,
                border: isSelected ? Border(left: BorderSide(color: BlinkitApp.primaryColor, width: 4)) : null,
              ),
              child: Column(
                children: [
                  CircleAvatar(radius: 20, backgroundColor: Colors.grey[300], child: const Icon(Icons.category, size: 20)),
                  const SizedBox(height: 8),
                  Text(subCategories[index], style: TextStyle(fontSize: 10, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductCard(Map<String, String> product, CartProvider cart) {
    final id = product['id']!;
    final name = product['name']!;
    final size = product['size']!;
    final price = double.parse(product['price']!);
    final image = product['image']!;
    
    final isInCart = cart.items.containsKey(id);
    final quantity = isInCart ? cart.items[id]!.quantity : 0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Center(child: Image.network(image, fit: BoxFit.contain))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12), maxLines: 2),
                Text(size, style: TextStyle(color: Colors.grey[600], fontSize: 10)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('₹${price.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold)),
                    if (isInCart)
                       _buildQuantityControl(id, name, price, image, size, quantity, cart)
                    else
                      ElevatedButton(
                        onPressed: () => cart.addItem(id, name, price, image, size),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: BlinkitApp.accentColor,
                          foregroundColor: Colors.black,
                          minimumSize: const Size(60, 30),
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text('ADD', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
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

  Widget _buildQuantityControl(String id, String name, double price, String image, String size, int quantity, CartProvider cart) {
    return Container(
      height: 30,
      decoration: BoxDecoration(color: BlinkitApp.accentColor, borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            constraints: const BoxConstraints(minWidth: 24),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.remove, size: 12),
            onPressed: () => cart.removeSingleItem(id),
          ),
          Text('$quantity', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          IconButton(
            constraints: const BoxConstraints(minWidth: 24),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.add, size: 12),
            onPressed: () => cart.addItem(id, name, price, image, size),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(CartProvider cart) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: BlinkitApp.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${cart.items.length} ITEMS | ₹${cart.totalAmount.toInt()}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: const [
              Text('View Cart', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Icon(Icons.keyboard_arrow_right, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}
