import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final List<Map<String, String>> _products = [
    {
      'name': 'Amul Gold Milk (Full Cream)',
      'size': '500 ml',
      'price': '₹33',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuBkSbw64P8vT7LVo2ZK_Hl8KHhS4qPx2H8G39nWmDPF3rRH2u8_R0XeSD5qXRaJpo1zlVbdtOwVd9P899k6TY_rkjbLfCH5NA3WmFp9R6lhaD02Tyi0a7i0gLHdeI0VTuw1VoRlu3MwgWGl9zvJRQE4rn_28tStxfbhW-Nz22KPtIrrKUv9-HBWid2SSKBbep2waJb9eoy6TnK8pVtpubVibRv1Tgo9vF7SK_6cjyi36fVE4xtkBehf4HQZZR2k0ThAqJOfga1sXCQ'
    },
    {
      'name': 'Mother Dairy Toned Milk',
      'size': '500 ml',
      'price': '₹27',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDteyfHk9UGu2OBFIyLfm8uhhHtfcTx7V21IYFZMMRbPg9xRXzTmX4pVFfdqS43TWr_mvoovZ14lItXRhIqqbHF-NcmPvvv5pJv01jBMiIRdCBF3-wKao2fcZnEuAfwjJWUmcxdC-gFL4mfNfUU8b2GOJ95TILpQ0eifLAzYGcUJO8jKt0P7JNE-1JdGiDx9bPMseFY0pjYYAXrIqkGeUcBQ2fqNF2USplO8XBhIzhnSXrQ3xe3WyTfdjruXfgOhBitKs0GUirUb6M'
    },
    {
      'name': 'Nandini GoodLife Milk',
      'size': '1 L • Tetra Pack',
      'price': '₹54',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuB4ozuS452FOnuUGUMOQwvzDKTFu_-xRfb1lqvegUlsni3z-qVr6Lm85F-2TPmYsrn5bAESBjPVgsYcJFkUKwY08ixruqeNYi32K17uPnk-iNodEr9-lPDgvc2UFH2kqAnvttwX0gWGBmv-QybGNEJZCl_mCXiNTpj28-OIpZQQXqMh281tVuHuqF-u2ebdHBy3xNJkI_MGyVrONnsG_0RFpChBxAn3LkYSjB1T2IlKD5M638vtTL2uHGOlKnNtZuciNVAo6gg-Gp0',
      'inCart': 'true'
    },
    {
      'name': 'Country Delight Buffalo Milk',
      'size': '500 ml',
      'price': '₹42',
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDREKMWnvQ2BtgnJ9wCEJqv1BIyd5Pm2coNCA36QOKVxwrvydb-xQMlTkh1E3Jcb2ie_YJrZ31pOAK-ROdrbgrSuT7VAShgLyZYINbyNTwuOQXoieeVsPZAUGwfbomQSJrYC713msgxOf7F2VqPeaSN38j15ImeY_-6DjFGLo0x5xsgnGZ-BTDzTKZ40Ay5AEcrzuBR58Z_Ynq2baVvtqsYQJWqDq4LLEKuOs6bjt1mGCEsT4SKuuzWqMxBKCvLRYNz17aWLj4CqNI'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F6),
      body: SafeArea(
        child: Column(
          children: [
            // Search Header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEC5B13).withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Color(0xFFEC5B13)),
                          suffixIcon: Icon(Icons.cancel, color: Colors.grey, size: 20),
                          hintText: 'Search for groceries...',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Chips
            Container(
              color: Colors.white,
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildChip('All Results', isSelected: true),
                  _buildChip('Fresh Milk', hasDropdown: true),
                  _buildChip('Dairy & Eggs'),
                  _buildChip('Oat & Soy'),
                ],
              ),
            ),

            const Divider(height: 1),

            // Results Summary
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'FOUND 12 ITEMS FOR "MILK"',
                    style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.tune, size: 18, color: Color(0xFFEC5B13)),
                    label: const Text('Filter', style: TextStyle(color: Color(0xFFEC5B13), fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),

            // Product List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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

  Widget _buildChip(String label, {bool isSelected = false, bool hasDropdown = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8, bottom: 8, top: 2),
      child: Chip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 13,
              ),
            ),
            if (hasDropdown) ...[
              const SizedBox(width: 4),
              Icon(Icons.keyboard_arrow_down, size: 16, color: isSelected ? Colors.white : Colors.black87),
            ],
          ],
        ),
        backgroundColor: isSelected ? const Color(0xFFEC5B13) : Colors.white,
        side: BorderSide(color: isSelected ? Colors.transparent : Colors.grey[200]!),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget _buildProductCard(Map<String, String> product) {
    bool inCart = product['inCart'] == 'true';
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[100]!),
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(image: NetworkImage(product['image']!), fit: BoxFit.contain),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name']!,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  product['size']!,
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product['price']!,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    if (inCart)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEC5B13),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.remove, color: Colors.white, size: 16),
                            SizedBox(width: 8),
                            Text('1', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            SizedBox(width: 8),
                            Icon(Icons.add, color: Colors.white, size: 16),
                          ],
                        ),
                      )
                    else
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFFEC5B13), width: 2),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                        ),
                        child: const Text('ADD', style: TextStyle(color: Color(0xFFEC5B13), fontWeight: FontWeight.bold)),
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
