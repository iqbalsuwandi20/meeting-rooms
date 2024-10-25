import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/booking_screen_controller.dart';

class BookingScreenView extends GetView<BookingScreenController> {
  const BookingScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Ruang Meeting'),
        backgroundColor: Colors.grey[400],
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.all(30),
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Divisi",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                items: controller.divisiRooms.map((String roomDvisi) {
                  return DropdownMenuItem<String>(
                    value: roomDvisi,
                    child: Text(roomDvisi),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.onDivisiRoomChanged(value);
                },
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
              SizedBox(height: 20),
              TextFormField(
                controller: controller.startTimeController,
                decoration: InputDecoration(
                  labelText: "Waktu Mulai Meeting",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                  suffixIcon: IconButton(
                    icon: Icon(Icons.lock_clock_outlined),
                    onPressed: () async {
                      await controller.selectStartTime(context);
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: controller.endTimeController,
                decoration: InputDecoration(
                  labelText: "Waktu Selesai Meeting",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                  suffixIcon: IconButton(
                    icon: Icon(Icons.lock_clock_outlined),
                    onPressed: () async {
                      await controller.selectEndTime(context);
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                autocorrect: false,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Jumlah Peserta",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              SizedBox(height: 200),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.grey[400]),
                onPressed: () {
                  controller.moveSuccessButton();
                },
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          Obx(() => AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                top: controller.isButtonSuccessVisible.value
                    ? MediaQuery.of(context).size.height / 2 - 30
                    : MediaQuery.of(context).size.height + 100,
                left: MediaQuery.of(context).size.width / 2 - 75,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[400],
                  ),
                  onPressed: () {
                    Get.snackbar("Sukses", "Booking berhasil!",
                        snackPosition: SnackPosition.BOTTOM);
                  },
                  child: Text(
                    "Booking Sukses!",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
