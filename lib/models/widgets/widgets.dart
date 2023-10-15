import 'package:flutter/material.dart';
import 'package:kt5/models/car/car.dart';

class CarWidget extends StatelessWidget {
  final Car car;
  final index;

  const CarWidget({super.key, required this.car, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
          isThreeLine: true,
          title: Text(car.brand),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Цвет машины: ${car.color}',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                'Модель: ${car.model}',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Цена: ',
                  style: TextStyle(color: Colors.black),
                  children: <InlineSpan>[
                    TextSpan(
                      text: car.price.toString(),
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    WidgetSpan(
                      child: Icon(
                        Icons.attach_money,
                        color: Colors.amber,
                        size: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(index.toString(),
                  style: TextStyle(color: Colors.blue, fontSize: 20)),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (car.availability == true)
                Icon(Icons.check, size: 26, color: Colors.green)
              else
                Icon(Icons.close, size: 26, color: Colors.red),
            ],
          )),
    );
  }
}
