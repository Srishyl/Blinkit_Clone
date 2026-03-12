import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../cart_provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String selectedPayment = 'Google Pay';
  String selectedSlot = 'Express';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Navigator.pop(context)),
        title: const Text('Checkout', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.help_outline, color: Color(0xFF1E56B2)), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             _buildAddressSection(),
             _buildDeliverySlotSection(),
             _buildPaymentSection(),
             _buildOrderSummary(),
             const SizedBox(height: 100),
          ],
        ),
      ),
      bottomSheet: _buildBottomPlaceOrder(),
    );
  }

  Widget _buildAddressSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.location_on, color: Color(0xFFD4F400), size: 16),
              SizedBox(width: 8),
              Text('Deliver to', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF1E56B2))),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.home, color: Color(0xFFD4F400), size: 16),
                          SizedBox(width: 8),
                          Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '123, Sunny Enclave, Sector 125,\nMohali, Punjab, 140301',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        child: const Text('Change Address', style: TextStyle(color: Color(0xFFD4F400), fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(color: const Color(0xFFD4F400).withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                  child: const Icon(Icons.map_outlined, color: Colors.green),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(color: Color(0xFFD4F400), shape: BoxShape.circle),
                child: const Icon(Icons.add, size: 12),
              ),
              const SizedBox(width: 8),
              const Text('Add new address', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDeliverySlotSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Delivery Slot', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _buildSlotCard('EXPRESS DELIVERY', '10-12 Mins', 'Express'),
          const SizedBox(height: 8),
          _buildSlotCard('STANDARD DELIVERY', 'Today, 2 PM - 4 PM', 'Standard'),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildSlotCard(String title, String subtitle, String value) {
    bool isSelected = selectedSlot == value;
    return InkWell(
      onTap: () => setState(() => selectedSlot = value),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFD4F400).withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? const Color(0xFFD4F400) : Colors.transparent),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: isSelected ? const Color(0xFFD4F400) : Colors.grey)),
                  Text(subtitle, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                ],
              ),
            ),
            Icon(isSelected ? Icons.check_circle : Icons.circle_outlined, color: isSelected ? const Color(0xFFD4F400) : Colors.grey[300]),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentSection() {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Payment Options', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildPaymentOption('Google Pay (UPI)', 'Fastest and secure payment', 'Google Pay', Icons.account_balance_wallet_outlined),
          _buildPaymentOption('PhonePe / BHIM UPI', '', 'PhonePe', Icons.account_balance_outlined),
          _buildPaymentOption('Credit / Debit Cards', '', 'Card', Icons.credit_card_outlined),
          _buildPaymentOption('Cash on Delivery', '', 'Cash', Icons.money_outlined),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(String title, String subtitle, String value, IconData icon) {
    bool isSelected = selectedPayment == value;
    return InkWell(
      onTap: () => setState(() => selectedPayment = value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF1E56B2)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
                   if (subtitle.isNotEmpty)
                     Text(subtitle, style: TextStyle(color: Colors.grey[500], fontSize: 10)),
                ],
              ),
            ),
            Icon(isSelected ? Icons.check_circle : Icons.circle_outlined, color: isSelected ? const Color(0xFFD4F400) : Colors.grey[300]),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
               Text('Order Summary', style: TextStyle(fontWeight: FontWeight.bold)),
               Icon(Icons.keyboard_arrow_down, color: Color(0xFF1E56B2)),
            ],
          ),
          const SizedBox(height: 16),
          _buildRow('Item Total', '₹1,320'),
          _buildRow('Product Discount', '-₹125', color: Colors.green),
          _buildRow('Delivery Fee', '₹50'),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: const Color(0xFFD4F400), borderRadius: BorderRadius.circular(4)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('TOTAL SAVINGS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                Text('₹125', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          Text(value, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: color)),
        ],
      ),
    );
  }

  Widget _buildBottomPlaceOrder() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Color(0xFFF2F3F5)))),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
               Text('₹1,245', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
               Text('VIEW DETAILED BILL', style: TextStyle(color: Color(0xFF1E56B2), fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                final cart = Provider.of<CartProvider>(context, listen: false);
                cart.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Order Placed Successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD4F400),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.all(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Place Order', style: TextStyle(fontWeight: FontWeight.bold)),
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
