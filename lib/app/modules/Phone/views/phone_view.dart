import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/phone_controller.dart';

class PhoneView extends GetView<PhoneController> {
  PhoneView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Enter Phone Number',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => TextFormField(
                    style: const TextStyle(fontSize: 20),
                    keyboardType: TextInputType.phone,
                    controller: controller.pController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a phone number";
                      }
                      if (value.length < 7) {
                        return "Please enter a valid phone number with country code";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.all(4),
                        hintText: 'Enter phone number',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.orangeAccent)),
                        prefixIcon: Container(
                          padding: const EdgeInsets.all(12),
                          child: InkWell(
                            onTap: () {
                              controller.countryPicker();
                              Get.reload();
                            },
                            child: Text(
                              "${controller.country.value.flagEmoji} ${controller.country.value.phoneCode}",
                              style: const TextStyle(fontSize: 19),
                            ),
                          ),
                        )),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: Get.width * 0.6,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      // backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.showOverlay(
                          asyncFunction: () async {
                            await controller.verifyPhone();
                          },
                          loadingWidget: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(fontSize: 22),
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
