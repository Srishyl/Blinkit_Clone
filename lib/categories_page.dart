import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'main.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final List<Map<String, String>> _products = [
    {
      'id': 'milk1',
      'name': 'Amul Gold Milk',
      'subtitle': '500 ml',
      'price': '33',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuBkSbw64P8vT7LVo2ZK_Hl8KHhS4qPx2H8G39nWmDPF3rRH2u8_R0XeSD5qXRaJpo1zlVbdtOwVd9P899k6TY_rkjbLfCH5NA3WmFp9R6lhaD02Tyi0a7i0gLHdeI0VTuw1VoRlu3MwgWGl9zvJRQE4rn_28tStxfbhW-Nz22KPtIrrKUv9-HBWid2SSKBbep2waJb9eoy6TnK8pVtpubVibRv1Tgo9vF7SK_6cjyi36fVE4xtkBehf4HQZZR2k0ThAqJOfga1sXCQ'
    },
    {
      'id': 'milk2',
      'name': 'Mother Dairy Milk',
      'subtitle': '500 ml',
      'price': '27',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDteyfHk9UGu2OBFIyLfm8uhhHtfcTx7V21IYFZMMRbPg9xRXzTmX4pVFfdqS43TWr_mvoovZ14lItXRhIqqbHF-NcmPvvv5pJv01jBMiIRdCBF3-wKao2fcZnEuAfwjJWUmcxdC-gFL4mfNfUU8b2GOJ95TILpQ0eifLAzYGcUJO8jKt0P7JNE-1JdGiDx9bPMseFY0pjYYAXrIqkGeUcBQ2fqNF2USplO8XBhIzhnSXrQ3xe3WyTfdjruXfgOhBitKs0GUirUb6M'
    },
    {
       'id': 'milk3',
       'name': 'Favorite Delight',
       'subtitle': '1 L',
       'price': '64',
       'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuB4ozuS452FOnuUGUMOQwvzDKTFu_-xRfb1lqvegUlsni3z-qVr6Lm85F-2TPmYsrn5bAESBjPVgsYcJFkUKwY08ixruqeNYi32K17uPnk-iNodEr9-lPDgvc2UFH2kqAnvttwX0gWGBmv-QybGNEJZCl_mCXiNTpj28-OIpZQQXqMh281tVuHuqF-u2ebdHBy3xNJkI_MGyVrONnsG_0RFpChBxAn3LkYSjB1T2IlKD5M638vtTL2uHGOlKnNtZuciNVAo6gg-Gp0',
    },
  ];

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.7,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Filter', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        TextButton(onPressed: () {}, child: const Text('Clear All', style: TextStyle(color: Color(0xFF1E56B2)))),
                      ],
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          color: const Color(0xFFF2F3F5),
                          child: ListView(
                            children: [
                              _buildFilterCategory('Brand', true),
                              _buildFilterCategory('Price', false),
                              _buildFilterCategory('Discount', false),
                              _buildFilterCategory('Pack Size', false),
                              _buildFilterCategory('Ratings', false),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildFilterOption('Amul', true, setModalState),
                                _buildFilterOption('Mother Dairy', false, setModalState),
                                _buildFilterOption('Country Delight', false, setModalState),
                                _buildFilterOption('Nandini', false, setModalState),
                                _buildFilterOption('Epigamia', true, setModalState),
                                _buildFilterOption('Nestle', false, setModalState),
                                const Spacer(),
                                const Text('Price Range', style: TextStyle(fontWeight: FontWeight.bold)),
                                RangeSlider(
                                  values: const RangeValues(10, 500),
                                  max: 500,
                                  min: 0,
                                  activeColor: BlinkitApp.accentColor,
                                  onChanged: (val) {},
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('₹10', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF1E56B2))),
                                    Text('₹500+', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF1E56B2))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: BlinkitApp.accentColor,
                        foregroundColor: Colors.black,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Apply Filters', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            );
          }
        );
      },
    );
  }

  Widget _buildFilterCategory(String title, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        border: isSelected ? Border(left: BorderSide(color: BlinkitApp.accentColor, width: 4)) : null,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? Colors.black : Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildFilterOption(String title, bool isSelected, Function setModalState) {
    return Row(
      children: [
        Checkbox(
          value: isSelected,
          activeColor: BlinkitApp.accentColor,
          checkColor: Colors.black,
          onChanged: (val) {},
        ),
        Text(title),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Icon(Icons.arrow_back),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F3F5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'milk',
                          prefixIcon: Icon(Icons.search, color: Colors.green),
                          suffixIcon: Icon(Icons.cancel, color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Icon(Icons.mic, color: Colors.green),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildChip('Sort', isSelected: true),
                  _buildChip('Brand'),
                  _buildChip('Price'),
                  _buildChip('Pack Size'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Showing 24 results for "milk"',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  IconButton(
                    onPressed: _showFilterSheet,
                    icon: const Icon(Icons.tune, color: Color(0xFF1E56B2)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  final product = _products[index];
                  return _buildProductCard(product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Row(
          children: [
            Text(label),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down, size: 16),
          ],
        ),
        selected: isSelected,
        onSelected: (val) {},
        backgroundColor: Colors.white,
        selectedColor: Colors.green,
        labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
        checkmarkColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: Colors.grey[300]!)),
      ),
    );
  }

  Widget _buildProductCard(Map<String, String> product) {
    final cart = Provider.of<CartProvider>(context);
    final id = product['id']!;
    final name = product['name']!;
    final subtitle = product['subtitle']!;
    final price = double.parse(product['price']!);
    final image = product['image']!;
    
    final isInCart = cart.items.containsKey(id);
    final quantity = isInCart ? cart.items[id]!.quantity : 0;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF2F3F5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(image: NetworkImage(image), fit: BoxFit.contain),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                  ),
                  child: const Text('Sol Off', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 1),
                Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('₹${price.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    if (isInCart)
                       Container(
                         height: 32,
                         decoration: BoxDecoration(color: BlinkitApp.accentColor, borderRadius: BorderRadius.circular(8)),
                         child: Row(
                           mainAxisSize: MainAxisSize.min,
                           children: [
                             IconButton(
                               constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                               padding: EdgeInsets.zero,
                               icon: const Icon(Icons.remove, color: Colors.black, size: 14),
                               onPressed: () => cart.removeSingleItem(id),
                             ),
                             Text('$quantity', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13)),
                             IconButton(
                               constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                               padding: EdgeInsets.zero,
                               icon: const Icon(Icons.add, color: Colors.black, size: 14),
                               onPressed: () => cart.addItem(id, name, price, image, subtitle),
                             ),
                           ],
                         ),
                       )
                    else
                      InkWell(
                        onTap: () => cart.addItem(id, name, price, image, subtitle),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: BlinkitApp.accentColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.add, size: 20, color: Colors.black),
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
