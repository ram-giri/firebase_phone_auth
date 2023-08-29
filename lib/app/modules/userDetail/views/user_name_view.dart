import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_name_controller.dart';

class UserNameView extends GetView<UserNameController> {
  UserNameView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            height: Get.height,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "User Name",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.userNameController,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 3) {
                      return "Please enter at least 3 character";
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    isDense: true,
                    filled: true,
                    contentPadding: EdgeInsets.all(6),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Full Name",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.fullNameController,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 3) {
                      return "Please enter at least 3 character";
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    isDense: true,
                    filled: true,
                    contentPadding: EdgeInsets.all(6),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.showOverlay(
                          asyncFunction: () async {
                            controller.createUser();
                          },
                          loadingWidget: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
