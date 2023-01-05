import 'package:http/http.dart' as http;
import 'package:thoughtbox_test/core/strings/strings.dart';
import 'package:thoughtbox_test/model/joblist_model.dart';
import 'package:thoughtbox_test/model/location_model.dart';

class Services {
  Future<List<LocationModel>> getLocations() async {
    var response = await http.get(Uri.parse(locationUrl));
    if (response.statusCode == 200) {
      List<LocationModel> locations = locationModelFromJson(response.body);

      return locations;
    } else {
      throw Exception();
    }
  }

  Future<List<JobTypeModel>> getJobList() async {
    var response = await http.get(Uri.parse(jobURL));

    if (response.statusCode == 200) {
      List<JobTypeModel> jobs = jobTypeModelFromJson(response.body);

      return jobs;
    } else {
      throw Exception();
    }
  }
}
