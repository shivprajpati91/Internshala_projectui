import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../Order_Preview/Order_Preview.dart';
 // Import the PreviewOrderScreen

class FileDetail extends StatefulWidget {
  const FileDetail({super.key});

  @override
  _FileDetailState createState() => _FileDetailState();
}

class _FileDetailState extends State<FileDetail> {
  // Dropdown values
  String? selectedDish;
  List<String> availableDishes = ["Birthday 1", "Birthday 2", "Birthday 3"];

  // DateTime picker
  DateTime selectedDate = DateTime.now();

  // Time picker
  TimeOfDay selectedTime = TimeOfDay.now();

  // Total guests and price per plate
  int totalGuests = 1;
  double pricePerPlate = 150.0; // Initially set to 150 for Veg
  double totalPrice = 150.0;

  // Slider value for time
  double sliderValue = 10; // Initially 10 minutes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Fill Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back, color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // First Section: Title
            Row(
              children: [
                Icon(CupertinoIcons.cube_box, color: Colors.purple),
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.01),
                Text(
                  " South Indian Breakfast",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500, color: Colors.black),
                ),
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.02),
                Icon(Icons.edit_note_outlined, color: Colors.black54, size: 30),
              ],
            ),
            const SizedBox(height: 20),

            // Second Section: Date & Time Pickers
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Select Occasion Dropdown
                  Text(
                    "Select Occasion:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButton<String>(
                      value: selectedDish,
                      hint: Text("Occasion"),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDish = newValue;
                          pricePerPlate = 150.0;
                          totalPrice = pricePerPlate * totalGuests;
                        });
                      },
                      isExpanded: true,
                      items: availableDishes.map<DropdownMenuItem<String>>((String dish) {
                        return DropdownMenuItem<String>(value: dish, child: Text(dish));
                      }).toList(),
                    ),
                  ),

                  // Select Date & Time
                  const SizedBox(height: 20),
                  Text(
                    "  Date & Time:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          // Date Picker
                          IconButton(
                            icon: Icon(CupertinoIcons.calendar, color: Colors.purple),
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: selectedDate,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (newDate != null) {
                                setState(() {
                                  selectedDate = newDate;
                                });
                              }
                            },
                          ),
                          Expanded(
                            child: Text(
                              "${selectedDate.toLocal()}".split(' ')[0],
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          // Time Picker
                          IconButton(
                            icon: Icon(CupertinoIcons.clock, color: Colors.purple),
                            onPressed: () async {
                              TimeOfDay? newTime = await showTimePicker(
                                context: context,
                                initialTime: selectedTime,
                              );
                              if (newTime != null) {
                                setState(() {
                                  selectedTime = newTime;
                                });
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Text(
                              "${selectedTime.format(context)}",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Third Section: Price per plate
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price Per Plate:                              ₹$pricePerPlate",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 0), // Spacing between price and discounts
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "₹299 off",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.red),
                      ),
                      SizedBox(width: 15), // Spacing between the discounts
                      Text(
                        "20% off",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Fourth Section: Total Guests Input
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Total Guests:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove_circle_outline, color: Colors.purple.shade200, size: 35),
                          onPressed: () {
                            setState(() {
                              if (totalGuests > 1) {
                                totalGuests--;
                                totalPrice = pricePerPlate * totalGuests;
                              }
                            });
                          },
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.2,
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          decoration: BoxDecoration(border: Border.all(color: Colors.black54), color: Colors.white, borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              "$totalGuests",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add_circle_outline, color: Colors.purple.shade200, size: 35),
                          onPressed: () {
                            setState(() {
                              totalGuests++;
                              totalPrice = pricePerPlate * totalGuests;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Fifth Section: Slider for Time Selection
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Set Time (Minutes): ${sliderValue.round()} min", // Display the value rounded to the nearest minute
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Slider(
                    thumbColor: Colors.purple,
                    value: sliderValue,
                    min: 10,
                    max: 1500,
                    divisions: 150,  // Adjust divisions for smoother increments
                    label: "${sliderValue.round()} min",  // Display rounded value as label
                    onChanged: (double value) {
                      setState(() {
                        sliderValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 0),

            // Submit Button
            // Submit Button (Order Preview)
            Container(
              color: Colors.white,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.04,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to PreviewOrderScreen and pass data

                },
                child: Row(
                  children: [
                    Text("  DYNAMIC PRICING", style: TextStyle(color: Colors.purple.shade700, fontWeight: FontWeight.bold)),
                    Text("   more guest, more saving.", style: TextStyle(color: Colors.black54)),
                  ],
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              ),
            ),

            SizedBox(height: MediaQuery.sizeOf(context).height*0.14,),

            Container(
              height: MediaQuery.sizeOf(context).height*0.06,
              width: MediaQuery.sizeOf(context).width*0.9,
              child: TextButton(       onPressed: () {
                // Navigate to PreviewOrderScreen and pass data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PreviewOrderScreen(
                      occasion: selectedDish ?? "No Occasion",  // If null, show "No Occasion"
                      selectedDate: selectedDate,
                      selectedTime: selectedTime,
                      totalGuests: totalGuests,
                      pricePerPlate: pricePerPlate,
                      totalPrice: totalPrice,
                      sliderValue: sliderValue,
                    ),
                  ),
                );
              }, child: Text("Order Review",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15),),
                style: TextButton.styleFrom(backgroundColor: Colors.purple.shade700),),
            )
          ],
        ),
      ),
    );
  }
}
