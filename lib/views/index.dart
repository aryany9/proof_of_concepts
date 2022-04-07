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
        title: Obx(
          () => Text(controller.data.value?.title ?? "Feeds Home"),
        ),
        actions: [
          // Refresh Button
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => controller.fetchFeeds(),
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  // calling CardWidget to load in ListView
                  return CardWidget(
                    row: controller.data.value!.rows![index],
                  );
                },
                itemCount: controller.data.value?.rows?.length,
              ),
      ),
    );
  }
}
