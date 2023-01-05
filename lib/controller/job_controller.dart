import 'package:get/get.dart';
import 'package:thoughtbox_test/model/joblist_model.dart';
import 'package:thoughtbox_test/model/location_model.dart';
import 'package:thoughtbox_test/services/service.dart';

class JobController extends GetxController {
  final Services _services = Services();
  List<JobTypeModel> jobs = [];
  List<LocationModel> locations = [];
  String currentValue = '';
  var tempJobs = [];
  bool isJobLoading = true;

  List<String> locationNames = [];
  getData() async {
    isJobLoading = true;
    update();

    tempJobs = jobs = await _services.getJobList();
    update();
    locations = await _services.getLocations();
    currentValue = locations[0].place;
    locationNames = locations.map((e) => e.place).toList();
    isJobLoading = false;

    update();
  }

  Future<void> changeLocation(String location) async {
    isJobLoading = true;
    update();

    jobs = await _services.getJobList();
    tempJobs = jobs
        .where((element) => element.location.contains(location.split(',')[0]))
        .toList();
    isJobLoading = false;

    update();
  }
}
