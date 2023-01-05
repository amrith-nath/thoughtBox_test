import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thoughtbox_test/controller/job_controller.dart';
import 'package:thoughtbox_test/core/font/fonts.dart';
import 'package:thoughtbox_test/services/service.dart';

class JobListScreen extends StatelessWidget {
  JobListScreen({super.key});

  List<String> itemList = List.generate(10, (index) => index.toString());
  final controller = Get.put(JobController());
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getData();
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Job List'),
      ),
      body: Center(
        child: GetBuilder(
            init: JobController(),
            builder: (jobController) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: jobController.locations.isNotEmpty
                          ? DropdownButton(
                              value: jobController.currentValue,
                              items: jobController.locationNames
                                  .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e,
                                        style: GoogleFont.subTextStyle,
                                      )))
                                  .toList(),
                              onChanged: (value) {
                                jobController.currentValue = value!;
                                jobController.changeLocation(value);
                                jobController.update();
                              })
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                    ),
                    jobController.jobs.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: jobController.tempJobs.length,
                                itemBuilder: (context, index) {
                                  var job = jobController.tempJobs[index];

                                  return Card(
                                    child: Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage:
                                                NetworkImage(job.image),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                job.position,
                                                style: GoogleFont.subTextStyle,
                                              ),
                                              Text(
                                                job.company,
                                                style: GoogleFont
                                                    .listTileTextStyle,
                                              ),
                                              Text(
                                                job.location,
                                                style: GoogleFont
                                                    .listTileTextStyle,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : jobController.isJobLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : const Center(
                                child: Text('NO jobs found'),
                              ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
