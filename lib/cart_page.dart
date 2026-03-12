import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'main.dart';
import 'screens/checkout_screen.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    if (cart.items.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('My Cart', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey[300]),
              const SizedBox(height: 16),
              const Text('Your cart is empty', style: TextStyle(fontSize: 18, color: Colors.grey)),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Navigate to home
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: BlinkitApp.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: const Text('Start Shopping'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text('My Cart', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: const [
          Icon(Icons.edit_outlined, color: Color(0xFF1E56B2)),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDeliveryBanner(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Cart Items (${cart.items.length})',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            _buildCartItems(cart),
            _buildSuggestions(),
            _buildBillDetails(cart),
            _buildSafetyBanner(),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomSheet: _buildBottomCheckout(context, cart),
    );
  }

  Widget _buildDeliveryBanner() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: const Color(0xFFF2F3F5), borderRadius: BorderRadius.circular(8)),
            child: const Icon(Icons.timer_outlined, color: Color(0xFF1E56B2)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 13),
                    children: [
                      TextSpan(text: 'Delivery in '),
                      TextSpan(text: '10 minutes', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Text('Shipment to HSR Layout', style: TextStyle(color: Colors.grey[600], fontSize: 11)),
              ],
            ),
          ),
          TextButton(onPressed: () {}, child: const Text('Change', style: TextStyle(color: Color(0xFF1E56B2), fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  Widget _buildCartItems(CartProvider cart) {
    return Container(
      color: Colors.white,
      child: Column(
        children: cart.items.values.map((item) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F3F5),
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(image: NetworkImage(item.imageUrl), fit: BoxFit.contain),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      Text(item.subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 11)),
                      const SizedBox(height: 4),
                      Text('₹${item.price.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    ],
                  ),
                ),
                Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E56B2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        constraints: const BoxConstraints(minWidth: 32),
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.remove, color: Colors.white, size: 14),
                        onPressed: () => cart.removeSingleItem(item.id),
                      ),
                      Text('${item.quantity}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                      IconButton(
                        constraints: const BoxConstraints(minWidth: 32),
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.add, color: Colors.white, size: 14),
                        onPressed: () => cart.addItem(item.id, item.name, item.price, item.imageUrl, item.subtitle),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSuggestions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('You might also need', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                width: 120,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: Column(
                  children: [
                    const Expanded(child: Icon(Icons.image, color: Color(0xFFF2F3F5), size: 48)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('₹45', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(color: const Color(0xFF1E56B2), borderRadius: BorderRadius.circular(4)),
                            child: const Icon(Icons.add, color: Colors.white, size: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBillDetails(CartProvider cart) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Bill Details', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildBillRow('Item total', '₹${cart.totalAmount.toInt()}'),
          _buildBillRow('Delivery fee', 'FREE', isFree: true),
          _buildBillRow('Handling fee', '₹2'),
          _buildBillRow('Discount', '-₹10', isDiscount: true),
          const Divider(),
          _buildBillRow('Grand Total', '₹${(cart.totalAmount - 8).toInt()}', isBold: true),
        ],
      ),
    );
  }

  Widget _buildBillRow(String label, String value, {bool isFree = false, bool isDiscount = false, bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, fontSize: 13)),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: isFree ? Colors.green : (isDiscount ? Colors.lightGreenAccent[700] : Colors.black),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSafetyBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF1E56B2).withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          const Icon(Icons.verified_user_outlined, color: Color(0xFF1E56B2)),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'Your order is safe with us. Our delivery partners follow all safety protocols.',
              style: TextStyle(fontSize: 10, color: Color(0xFF1E56B2)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomCheckout(BuildContext context, CartProvider cart) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFF2F3F5))),
      ),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('₹${(cart.totalAmount - 8).toInt()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const Text('VIEW BILL DETAILS', style: TextStyle(color: Color(0xFF1E56B2), fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CheckoutScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: BlinkitApp.accentColor,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.all(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Proceed to Checkout', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 8),
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
