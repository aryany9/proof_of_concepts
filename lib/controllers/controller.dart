import 'package:get/get.dart';
import 'package:proof_of_concepts/models/feedsModel.dart';
import 'package:proof_of_concepts/services/feedsService.dart';

/* 
  Creating the FeedsController using GetxController for fetching the data
  from the API using the Service class and pass it to widgets for viewing the data
  Controllers are created for handling the business logics.
*/

class FeedsController extends GetxController {
  Rxn<FeedsModel> data = Rxn<
      FeedsModel>(); // Here we are creating model object so that if the data come we will assign it to model object and can call from Views
  var isLoading = true.obs; // Creating loader for waiting for data to come

  @override
  onInit() {
    fetchFeeds();
    super.onInit();
  }

  fetchFeeds() async {
    isLoading(true);

    // we are fetching the data by calling the API using service class.
    var response = await FeedService.fetchList();

    // verifying if the data is empty or not.
    if (response != null) {
      data.value = response;

      // if the response is successfully assigned to the data we will pause the loader.
      isLoading(false);
    }
  }
}
