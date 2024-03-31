import 'package:flutter/material.dart';

class PricingComponent extends StatefulWidget {
  @override
  _PricingComponentState createState() => _PricingComponentState();
}

class _PricingComponentState extends State<PricingComponent> {
  double _pageViews = 10.0;
  bool _isYearlyBilling = false;

  Map<double, double> _pricingMap = {
    10.0: 8.0,
    50.0: 12.0,
    100.0: 16.0,
    500.0: 24.0,
    1000.0: 36.0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pricing Component'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Page Views: ${_pageViews.toInt()}K',
              style: TextStyle(fontSize: 16.0),
            ),
            Slider(
                min: 10.0,
                max: 1000.0,
                divisions: 100,
                value: _pageViews,
                onChanged: (value) {
                  setState(() {
                    _pageViews = value;
                  });
                },
                activeColor: _getSliderColor(_pageViews)
            ),
            Row(
              children: [
                Text('Yearly Billing'),
                Switch(
                  value: _isYearlyBilling,
                  onChanged: (value) {
                    setState(() {
                      _isYearlyBilling = value;
                    });
                  },
                ),
              ],
            ),
            Text(
              'Price: \$${_calculatePrice().toStringAsFixed(2)} per month',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }

  double _calculatePrice() {
    double price = _pricingMap.entries
        .firstWhere((entry) => entry.key >= _pageViews)
        ?.value ?? 0.0;
    if (_isYearlyBilling) {
      price *= 0.75; // Apply 25% discount for yearly billing
    }
    return price;
  }

  Color _getSliderColor(double pageViews) {
    // Lấy mức giá của _pricingMap gần nhất với _pageViews
    double? nearestPrice = _pricingMap.entries
        .firstWhere((entry) => entry.key >= pageViews)
        ?.value;

    // Trả về màu sắc phù hợp dựa trên mức giá
    if (nearestPrice != null) {
      if (nearestPrice == 8.0) {
        return Colors.green; // Mốc giá $8
      } else if (nearestPrice == 12.0) {
        return Colors.blue; // Mốc giá $12
      } else if (nearestPrice == 16.0) {
        return Colors.orange; // Mốc giá $16
      } else if (nearestPrice == 24.0) {
        return Colors.red; // Mốc giá $24
      } else if (nearestPrice == 36.0) {
        return Colors.purple; // Mốc giá $36
      }
    }

    return Colors.grey; // Mặc định cho trường hợp không tìm thấy mức giá
  }
}

void main() {
  runApp(MaterialApp(
    home: PricingComponent(),
  ));
}
