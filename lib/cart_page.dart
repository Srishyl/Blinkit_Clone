import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Cart',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              '3 Items in your bag',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Delivery Address
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEC5B13).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.location_on, color: Color(0xFFEC5B13)),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Delivery to Home', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                              TextButton(
                                onPressed: () {},
                                child: const Text('CHANGE', style: TextStyle(color: Color(0xFFEC5B13), fontSize: 12, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          const Text(
                            '4522 Westside Avenue, Apt 4B, Brooklyn, NY 11201',
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Cart Items
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildCartItem(
                    name: 'Organic Bananas',
                    subtitle: '1 lb approx.',
                    price: '₹82',
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBjFrEwW0hWwLStvoes0GSKj8yd-1t__dh7HoToHWsI2Rp2N-hy4EcGxlFW2R4AfKROUHvQkPRQjEv170O8ojKdKAY3_-rGBhNGQ3OOKzOsWSP9Bk50WPDy20nFk5s3-cx05XBuD4Dgtu0D6eXXbZV6WnDO-YZvvOsNXmRs0tOfqefMzgosfTxJU9qjZYKaLYPqVhXySGPXUtr8aFliJoqyP8q9W8p6_Y_dMxomjZaWgYhKe9KfArOvjjg9-54c8jPZIdSWGVwbVZA',
                    count: 1,
                  ),
                  const Divider(),
                  _buildCartItem(
                    name: 'Whole Milk',
                    subtitle: '1 Gallon',
                    price: '₹289',
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCR9rd3S24pEpRHaOSWvope8MNYPVpHy7WxZOsZHmPq09bneZ1Yz8ihg8Y77ErqG6nihLkm2p1ydtcFkiifk5riWi3jRB15qTVXpEIKlP3mljgTKwYFXv5qkBNMk0immQ-lfsZSxiIHX9NJPQFthyvqlV90N4S9nrxVls2-9iqfTLC9x2p1JL8ZhZbTzNOQFa7e3Nz7PiruTQKHEmdBlqgvyYSRDuFt2oPZXw8Zk5xqLT7jHE0ypct8gke2C7ZCoeNLL87bkuhnzJM',
                    count: 2,
                  ),
                  const Divider(),
                  _buildCartItem(
                    name: 'Hass Avocado',
                    subtitle: 'Large size',
                    price: '₹124',
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBbJO29o3COfQdUHulO3q4IOpI8WfYS78-hScvfaWxo5ny2hw8IqV19WGSsoctxVxj2lpiN616j9X_1fxdyPFC1B1HvI1-4iuTzrMo1YS6b2P7GNbXbcICC2YEgPO7AwNvUDAH-mX4GyH-WgKwAfRgmhwsGTD1mQ5SCm0uVm5VhG1NeOTDXPvUl6oVpyzPbnvLbtKLYf5nOJY0ohAFCD8699GLlHRCj99QFxP4Xyk8p6VU6jEzNPZ3ovfkTYHwoj4e2B4Cpm2RX5EM',
                    count: 3,
                  ),
                ],
              ),
            ),

            // Promo Code
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFEC5B13).withOpacity(0.05),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFEC5B13).withOpacity(0.3), width: 2, style: BorderStyle.solid),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.sell, color: Color(0xFFEC5B13)),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        "Use promo code 'FRESH20'",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('APPLY', style: TextStyle(color: Color(0xFFEC5B13), fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),

            // Bill Summary
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Bill Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildBillRow('Item Total', '₹1030'),
                        const SizedBox(height: 8),
                        _buildBillRow('Delivery Fee', '₹164'),
                        const SizedBox(height: 8),
                        _buildBillRow('Taxes & Charges', '₹70'),
                        const Divider(height: 24),
                        _buildBillRow('Total Amount', '₹1264', isTotal: true),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              'Cancellations are only possible within 2 minutes\nof placing the order.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 12, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Total to Pay', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
                const Text('₹1264', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  final isLoggedIn = snapshot.hasData;
                  return ElevatedButton(
                    onPressed: () {
                      if (!isLoggedIn) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing Payment...')));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEC5B13),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(isLoggedIn ? 'Proceed to Pay' : 'Login to Proceed', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem({required String name, required String subtitle, required String price, required String imageUrl, required int count}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[200]!),
              image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                const SizedBox(height: 4),
                Text(price, style: const TextStyle(color: Color(0xFFEC5B13), fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F6F6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                _buildCountButton(Icons.remove, Colors.white, Colors.black),
                const SizedBox(width: 8),
                Text('$count', style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                _buildCountButton(Icons.add, const Color(0xFFEC5B13), Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountButton(IconData icon, Color bgColor, Color iconColor) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 2),
        ],
      ),
      child: Icon(icon, size: 16, color: iconColor),
    );
  }

  Widget _buildBillRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isTotal ? Colors.black : Colors.grey[600],
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            fontSize: isTotal ? 16 : 14,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: isTotal ? const Color(0xFFEC5B13) : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: isTotal ? 18 : 14,
          ),
        ),
      ],
    );
  }
}
