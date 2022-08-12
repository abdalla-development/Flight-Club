import 'package:flutter/material.dart';


class FlightDealsFilterByDayWidgetConstructor extends StatelessWidget {
  const FlightDealsFilterByDayWidgetConstructor(
      {Key? key,
      required this.date,
      required this.startingPrice,
      required this.index})
      : super(key: key);

  final String date;
  final String startingPrice;
  final int index;

  @override
  Widget build(BuildContext context) {
    int rowDateIndex = 0;

    return GestureDetector(
      onTap: () {
        // context.read<FlightDealsProvider>().updateRowDateIndexActive(index);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: (rowDateIndex == index) ? Colors.grey : Colors.blueGrey,
        ),
        child: Column(
          children: [
            Text(date),
            const SizedBox(
              height: 5,
            ),
            Text('From $startingPrice'),
          ],
        ),
      ),
    );
  }
}
