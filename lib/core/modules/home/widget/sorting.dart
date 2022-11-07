import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceSort extends StatefulWidget {
  const PriceSort({super.key});

  @override
  State<PriceSort> createState() => _PriceSortState();
}

class _PriceSortState extends State<PriceSort> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            children: const [
              Expanded(
                  child: ListTile(
                leading: Text('Sort By'),
                trailing: Icon(Icons.filter_alt_rounded),
              )),
              Expanded(
                  child: ElevatedButton(
                      onPressed: null, child: Text('Low to High'))),
              SizedBox(width: 5),
              Expanded(
                  child: ElevatedButton(
                      onPressed: null, child: Text('High to Low'))),
            ],
          ),
        )
      ],
    );
  }
}
