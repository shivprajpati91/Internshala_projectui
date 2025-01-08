import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';  // Import intl package for date formatting

class PreviewOrderScreen extends StatefulWidget {
  final String occasion;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final int totalGuests;
  final double pricePerPlate;
  final double totalPrice;
  final double sliderValue;

  PreviewOrderScreen({
    required this.occasion,
    required this.selectedDate,
    required this.selectedTime,
    required this.totalGuests,
    required this.pricePerPlate,
    required this.totalPrice,
    required this.sliderValue,
  });

  @override
  _PreviewOrderScreenState createState() => _PreviewOrderScreenState();
}

class _PreviewOrderScreenState extends State<PreviewOrderScreen> {
  bool _isDropdownOpen = false;
  final double discountPercentage = 10.0; // Example: 10% discount

  @override
  Widget build(BuildContext context) {
    // Format the date using DateFormat
    String formattedDate = DateFormat('yyyy-MM-dd').format(widget.selectedDate);

    // Calculate the subtotal, discount, and total amount
    double subtotal = widget.totalGuests * widget.pricePerPlate;
    double discount = (subtotal * discountPercentage) / 100;
    double totalToPay = subtotal - discount;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Order review",style: TextStyle(fontWeight: FontWeight.w500),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Container: Millet Breakfast Icon and Name
            Card(
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.restaurant, color: Colors.purple),
                    SizedBox(width: 10),
                    Text(
                      "Millet Breakfast",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500 ,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: MediaQuery.sizeOf(context).width*0.26,),
                    TextButton(onPressed: (){}, child: Text("Edit",style: TextStyle(color: Colors.red.shade300,
                      fontSize: 18,),))
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Second Column: Guests Information
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.person, color: Colors.purple, size: 20),
                    SizedBox(width: 0),
                    Text(
                      "${widget.totalGuests} Guests",
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
                // Date and Time Section
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.date_range, color: Colors.purple),
                      Text(
                        "  Date: $formattedDate", // Show the formatted date here
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                      Icon(CupertinoIcons.time, color: Colors.purple),
                      Text(
                        "  Time: ${widget.selectedTime.format(context)}",
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Subtotal Section with Dropdown
            GestureDetector(
              onTap: () {
                setState(() {
                  _isDropdownOpen = !_isDropdownOpen;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtotal: ₹${subtotal.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    _isDropdownOpen
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: Colors.purple,
                  ),
                ],
              ),
            ),
            if (_isDropdownOpen) ...[
              // This will show the selected items when dropdown is open
              SizedBox(height: 10),
              Text(
                "Selected Items: Millet Breakfast",
                style: TextStyle(fontSize: 14),
              ),
            ],
            SizedBox(height: 20),

            // Second Container: Total Amount, Price Off, and Total to Pay
            Padding(
              padding: const EdgeInsets.only(left: 3.0,right: 3),
              child: Container(
                height: MediaQuery.sizeOf(context).height*0.03,
                     child: Center(child: Text("Hurry! You saved ₹195/- on total order",style: TextStyle(color: Colors.white),)),
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight:
                Radius.circular(15),topLeft: Radius.circular(15)),color: Colors.purple),
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.sizeOf(context).width*0.9,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Amount:                                  ₹${subtotal.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Price Off ($discountPercentage%):                                        -₹${discount.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 13, color: Colors.green.shade400 ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Total to Pay:                                     ₹${totalToPay.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 340),

            // Confirm Order Button
            Container(
              height: MediaQuery.sizeOf(context).height*0.06,
              width: MediaQuery.sizeOf(context).width*0.9,
              child: ElevatedButton(
                onPressed: () {
                  // Implement order confirmation logic
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text("Order Confirmation"),
                      content: Text("Your order has been confirmed!"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Close"),
                        ),
                      ],
                    ),
                  );
                },
                child: Text("Place Order",style: TextStyle(color: Colors.white,fontSize: 16),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple.shade700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
