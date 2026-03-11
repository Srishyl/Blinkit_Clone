import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';
import 'cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final cartItems = cart.items.values.toList();

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
              '${cart.itemCount} Items in your bag',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // This is usually handled by the BottomNavigationBar in main.dart
            // but we can add a fallback or local pop if needed.
          },
        ),
      ),
      body: cart.itemCount == 0
          ? _buildEmptyCart(context)
          : SingleChildScrollView(
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
                      children: cartItems.map((item) {
                        return Column(
                          children: [
                            _buildCartItem(
                              context: context,
                              cartItem: item,
                            ),
                            if (cartItems.last != item) const Divider(),
                          ],
                        );
                      }).toList(),
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
                              _buildBillRow('Item Total', '₹${cart.totalAmount.toInt()}'),
                              const SizedBox(height: 8),
                              _buildBillRow('Delivery Fee', '₹40'),
                              const SizedBox(height: 8),
                              _buildBillRow('Taxes & Charges', '₹${(cart.totalAmount * 0.05).toInt()}'),
                              const Divider(height: 24),
                              _buildBillRow('Total Amount', '₹${(cart.totalAmount + 40 + (cart.totalAmount * 0.05)).toInt()}', isTotal: true),
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
                  const SizedBox(height: 140),
                ],
              ),
            ),
      bottomSheet: cart.itemCount == 0
          ? null
          : Container(
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
                      Text('₹${(cart.totalAmount + 40 + (cart.totalAmount * 0.05)).toInt()}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                        }),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 100, color: Colors.grey[300]),
          const SizedBox(height: 24),
          const Text(
            'Your cart is empty',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Looks like you haven\'t added anything to your cart yet',
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              // Usually handled by BottomNavigationBar
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEC5B13),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Start Shopping', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem({required BuildContext context, required CartItem cartItem}) {
    final cart = Provider.of<CartProvider>(context, listen: false);
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
              image: DecorationImage(image: NetworkImage(cartItem.imageUrl), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cartItem.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(cartItem.subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                const SizedBox(height: 4),
                Text('₹${cartItem.price.toInt()}', style: const TextStyle(color: Color(0xFFEC5B13), fontWeight: FontWeight.bold)),
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
                _buildCountButton(
                  icon: Icons.remove,
                  bgColor: Colors.white,
                  iconColor: Colors.black,
                  onTap: () => cart.removeSingleItem(cartItem.id),
                ),
                const SizedBox(width: 8),
                Text('${cartItem.quantity}', style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                _buildCountButton(
                  icon: Icons.add,
                  bgColor: const Color(0xFFEC5B13),
                  iconColor: Colors.white,
                  onTap: () => cart.addItem(cartItem.id, cartItem.name, cartItem.price, cartItem.imageUrl, cartItem.subtitle),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountButton({required IconData icon, required Color bgColor, required Color iconColor, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
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
