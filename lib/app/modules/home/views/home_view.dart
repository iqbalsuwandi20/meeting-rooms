import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meeting_room/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ClipOval(
                      child: Container(
                        width: 75,
                        height: 75,
                        color: Colors.grey[400],
                        child: Image.network(
                          "https://ui-avatars.com/api/?name=Yosi",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Padding(
                    padding: EdgeInsets.only(top: 25, left: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Yosi",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Web Developer"),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "Jadwal Ruang Meeting Hari Ini",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
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
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            Get.toNamed(Routes.SCHEDULE_SCREEN);
          } else if (index == 1) {
            Get.toNamed(Routes.BOOKING_SCREEN);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Jadwal Ruang Meeting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Booking Ruang Meeting',
          ),
        ],
      ),
    );
  }
}
