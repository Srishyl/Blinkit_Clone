import 'package:flutter/material.dart';
import '../main.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F3F5),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black), onPressed: () {}),
          title: const Text('Orders History', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          actions: [
            IconButton(icon: const Icon(Icons.search, color: Colors.green), onPressed: () {}),
          ],
          bottom: const TabBar(
            labelColor: Color(0xFF1E56B2),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xFF1E56B2),
            indicatorWeight: 3,
            tabs: [
              Tab(text: 'Active'),
              Tab(text: 'Past Orders'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildActiveOrders(),
            _buildPastOrders(),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveOrders() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('ACTIVE ORDERS', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: const Border(left: BorderSide(color: Color(0xFFD4F400), width: 4)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   const Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Order #BK772190', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                       Text('Today, 02:15 PM • 4 items', style: TextStyle(color: Colors.grey, fontSize: 12)),
                     ],
                   ),
                   Container(
                     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                     decoration: BoxDecoration(color: const Color(0xFFD4F400), borderRadius: BorderRadius.circular(4)),
                     child: const Text('IN PROGRESS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                   ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _buildItemThumbnail(),
                  const SizedBox(width: 8),
                  _buildItemThumbnail(),
                  const SizedBox(width: 8),
                  _buildItemThumbnail(),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Row(
                     children: const [
                       Icon(Icons.flash_on, color: Color(0xFFD4F400), size: 16),
                       SizedBox(width: 4),
                       Text('Arriving in 8 mins', style: TextStyle(color: Color(0xFFD4F400), fontWeight: FontWeight.bold, fontSize: 13)),
                     ],
                   ),
                   ElevatedButton(
                     onPressed: () {},
                     style: ElevatedButton.styleFrom(
                       backgroundColor: const Color(0xFF1E56B2),
                       foregroundColor: Colors.white,
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                     ),
                     child: const Text('Track Order'),
                   ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItemThumbnail() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F3F5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: const Icon(Icons.image, size: 24, color: Colors.grey),
    );
  }

  Widget _buildPastOrders() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('PAST ORDERS', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
        const SizedBox(height: 12),
        _buildPastOrderCard('Yesterday, 10:30 AM', '2 items • ₹342'),
        const SizedBox(height: 12),
        _buildPastOrderCard('12 Oct, 08:15 PM', '6 items • ₹1,208'),
      ],
    );
  }

  Widget _buildPastOrderCard(String dateTime, String details) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dateTime, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text(details, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.check_circle, color: Color(0xFFD4F400), size: 16),
                  SizedBox(width: 4),
                  Text('DELIVERED', style: TextStyle(color: Color(0xFFD4F400), fontWeight: FontWeight.bold, fontSize: 10)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildItemThumbnail(),
                  const SizedBox(width: 8),
                   _buildItemThumbnail(),
                ],
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF1E56B2)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Reorder', style: TextStyle(color: Color(0xFF1E56B2))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
