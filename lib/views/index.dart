import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proof_of_concepts/controllers/controller.dart';
import 'package:proof_of_concepts/widgets/cardWidget.dart';

class FeedsHome extends StatelessWidget {
  FeedsHome({Key? key}) : super(key: key);

  // Initializing the controller using the controller object.
  final FeedsController controller = Get.put(FeedsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feeds Home"),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return CardWidget(
                    row: controller.data.value!.rows![index],
                  );
                  // ListTile(
                  //   title: controller.data.value?.rows?[index].title != null
                  //       ? Text(controller.data.value!.rows![index].title!)
                  //       : null,
                  //   subtitle: controller.data.value?.rows?[index].description !=
                  //           null
                  //       ? Text(controller.data.value!.rows![index].description!)
                  //       : null,
                  // );
                },
                itemCount: controller.data.value?.rows?.length,
              ),
      ),
    );
  }
}
