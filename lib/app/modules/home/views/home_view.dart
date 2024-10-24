import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(40),
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ClipOval(
                  child: Container(
                    width: 75,
                    height: 75,
                    color: Colors.grey,
                    child: Image.network(
                      "https://ui-avatars.com/api/?name=Yosi",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Row()
            ],
          )
        ],
      ),
    );
  }
}
