import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/app/models/user_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: controller.getUser(),
          builder: (context, snapshot) {
            AuthUser? data = snapshot.data as AuthUser?;
            if (snapshot.hasData) {
              return SizedBox(
                height: Get.height,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data!.fullName,
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        data.userName,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return const Center(
              child: Text('Something went wrong'),
            );
          }),
    );
  }
}
