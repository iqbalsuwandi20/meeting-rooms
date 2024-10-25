import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/schedule_screen_controller.dart';

class ScheduleScreenView extends GetView<ScheduleScreenController> {
  const ScheduleScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(230),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey[200],
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Jadwal Ruang Meeting',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Ruang Meeting",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    items: controller.meetingRooms.map((String room) {
                      return DropdownMenuItem<String>(
                        value: room,
                        child: Text(room),
                      );
                    }).toList(),
                    onChanged: (value) {
                      controller.onMeetingRoomChanged(value);
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller.dateController,
                    decoration: InputDecoration(
                      labelText: "Tanggal Meeting",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey[100],
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () async {
                          await controller.selectDate(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: controller.streamRoomMeeting(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[400],
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text("Terjadi kesalahan. Coba lagi nanti."),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text("Tidak ada jadwal ruangan meeting untuk hari ini."),
            );
          }

          var meetingSchedules = snapshot.data!;

          return ListView(
            padding: EdgeInsets.all(40),
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: meetingSchedules.length,
                itemBuilder: (context, index) {
                  var schedule = meetingSchedules[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text(
                            schedule['waktu_mulai'] ?? "Unknown",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            " - ",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            schedule['waktu_selesai'] ?? "Unknown",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            schedule['nama_ruangan'] ?? "No Room",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
