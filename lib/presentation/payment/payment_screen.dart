import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(), // You can make this interactive.
        title: const Text('Preview Buy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(Icons.music_note), // Spotify Icon
                      title: Text('Spotify'),
                      subtitle: Text('SPOT'),
                    ),
                    Divider(),
                    Text('Market Price'),
                    Text('\$71.05'),
                    SizedBox(height: 8.0),
                    Text('Number of Shares'),
                    Text('0.013659756'),
                    SizedBox(height: 8.0),
                    Text('Amount'),
                    Text('\$10,000.00'),
                    SizedBox(height: 8.0),
                    Text('Trading Fee'),
                    Text('\$50.00'),
                    Divider(),
                    Text('Total Cost'),
                    Text('\$10,050.00'),
                  ],
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Add your onPressed code here!
              },
              child: const Text('Buy Now'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // background (button) color
                onPrimary: Colors.white, // foreground (text) color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
