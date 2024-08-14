import 'package:flutter/material.dart';
import 'package:app1/widgets/quickaccess_buttons.dart';
import 'package:app1/widgets/summary.dart';
import 'package:flutter/services.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/custom_card.dart';

class GiveScreen extends StatefulWidget {
  const GiveScreen({super.key});

  @override
  _GiveScreenState createState() => _GiveScreenState();
}

class _GiveScreenState extends State<GiveScreen> {
  bool _isBalanceVisible = true;

  void _toggleBalanceVisibility() {
    setState(() {
      _isBalanceVisible = !_isBalanceVisible;
    });
  }

  void _copyDetailsToClipboard(String details) {
    Clipboard.setData(ClipboardData(text: details));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Details copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Give'),
        centerTitle: true,
        elevation: 0,
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Track your donations and givings on the go!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                QuickAccessButton(icon: Icons.account_balance_wallet, label: 'Fund wallet'),
                QuickAccessButton(icon: Icons.history, label: 'Giving history'),
                QuickAccessButton(icon: Icons.repeat, label: 'Recurring'),
              ],
            ),
            const SizedBox(height: 16.0),
            CustomCard(
              title: 'Wallet Balance',
              subtitle: 'Wema Bank - 0902902993 (Rereloluwa .A)',
              amount: _isBalanceVisible ? '₦790,000.00' : '******',
              iconPath: 'assets/images/wallet.jpg',
              actions: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      _isBalanceVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _toggleBalanceVisibility,
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () => _copyDetailsToClipboard('Wema Bank - 0902902993 (Rereloluwa .A)'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const GivingSummaryChart(),
          ],
        ),
      ),
    );
  }
}
