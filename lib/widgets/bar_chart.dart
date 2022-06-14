import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  const BarChart(this.expenses, {Key? key}) : super(key: key);
  final List<double> expenses;

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expenses.forEach((double price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    });

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            'Weekly Spending',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              fontSize: 20,
            ),
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back,
                ),
                iconSize: 30,
              ),
              Text(
                'Nov 10, 2022 - Nov 11, 2022',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                  fontSize: 16,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward,
                ),
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Bar(label: 'Sa', amountSpent: expenses[0], mostExpensive: 200),
              Bar(label: 'Su', amountSpent: expenses[1], mostExpensive: 200),
              Bar(label: 'Mo', amountSpent: expenses[2], mostExpensive: 200),
              Bar(label: 'Tu', amountSpent: expenses[3], mostExpensive: 200),
              Bar(label: 'We', amountSpent: expenses[4], mostExpensive: 200),
              Bar(label: 'Th', amountSpent: expenses[5], mostExpensive: 200),
              Bar(label: 'Fr', amountSpent: expenses[6], mostExpensive: 200),
            ],
          ),
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  const Bar({
    Key? key,
    required this.amountSpent,
    required this.label,
    required this.mostExpensive,
  }) : super(key: key);
  final String label;
  final double amountSpent;
  final double mostExpensive;

  final double _maxBarHeight = 150;

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Column(
      children: [
        Text(
          '\$${amountSpent.toStringAsFixed(2)}',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 6),
        Container(
          height: barHeight,
          width: 18,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
