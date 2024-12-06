import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxsratemanagment/controller/counterGetx.dart';

class Counterpage extends StatelessWidget {
  const Counterpage({super.key});

  @override
  Widget build(BuildContext context) {
    Countergetx countergetx = Get.put(Countergetx());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Counter App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Obx(
          () => Text(
            '${countergetx.counter.value}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: () {
            countergetx.increment();
          },child: Icon(Icons.add),),
          SizedBox(width: 10,),
          FloatingActionButton(onPressed: () {
            countergetx.decrement();
          },child: Icon(Icons.remove,),),
        ],
      ),
    );
  }
}
