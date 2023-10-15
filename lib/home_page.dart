import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kt5/models/car/car.dart';
import 'package:kt5/models/car_data/car_data.dart';
import 'package:kt5/models/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Dio client = Dio();
  String url = 'https://myfakeapi.com/api/cars/';
  List<Car> lcar = [];

  void lGetCar() async {
    Response response = await client.get(url);
    lcar = CarData.fromJson(response.data).cars;
    print(lcar);
    setState(() {});
  }

  @override
  void initState() {
    lGetCar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'МАШИНКИ',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: lcar.length,
                itemBuilder: (context, index) {
                  return CarWidget(car: lcar[index], index: index + 1);
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text('МАШИНКИ ЗАКОНЧИЛИСЬ'),
            ],
          ),
        ),
      ),
    );
  }
}