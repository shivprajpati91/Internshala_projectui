import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VegNonVegToggle extends StatefulWidget {
  const VegNonVegToggle({super.key});

  @override
  _VegNonVegToggleState createState() => _VegNonVegToggleState();
}

class _VegNonVegToggleState extends State<VegNonVegToggle> {
  double _vegNonVegValue = 0; // 0 for Veg, 1 for Non-Veg
  String _selectedCategory = "Starter"; // Default category
  final List<String> _selectedItems = [];
  double _totalPrice = 0;

  final Map<String, double> _itemPrices = {
    "Veg Manchurian": 150.0,
    "Paneer Tikka": 200.0,
    "Spring Rolls": 120.0,
    "Veg Pakora": 100.0,
    "Hara Bhara Kebab": 130.0,
    "Aloo Tikki": 80.0,
    "Paneer Butter Masala": 220.0,
    "Dal Tadka": 120.0,
    "Veg Biryani": 160.0,
    "Aloo Gobi": 110.0,
    "Palak Paneer": 180.0,
    "Chole Bhature": 140.0,
    "Gulab Jamun": 70.0,
    "Rasgulla": 80.0,
    "Kheer": 90.0,
    "Jalebi": 60.0,
    "Rabri": 100.0,
    "Carrot Halwa": 120.0,
    "Chicken 65": 250.0,
    "Fish Fingers": 280.0,
    "Prawn Tempura": 300.0,
    "Chicken Tikka": 220.0,
    "Mutton Seekh Kebab": 350.0,
    "Fish Amritsari": 270.0,
    "Butter Chicken": 280.0,
    "Chicken Biryani": 250.0,
    "Mutton Curry": 300.0,
    "Fish Curry": 280.0,
    "Chicken Korma": 260.0,
    "Mutton Rogan Josh": 350.0,
    "Egg Pudding": 100.0,
    "Mango Mousse": 130.0,
    "Chocolate Lava Cake": 150.0,
    "Custard Pudding": 90.0,
    "Tiramisu": 180.0,
  };

  final Map<String, List<Map<String, String>>> _vegItems = {
    "Starter": [
      {"name": "Veg Manchurian", "image": "Starter/1pc.jpg"},
      {"name": "Paneer Tikka", "image": "maincourse/idli.jpg"},
      {"name": "Spring Rolls", "image": "Starter/2pc.jpg"},
      {"name": "Veg Pakora", "image": "Starter/3pc.jpeg"},
      {"name": "Hara Bhara Kebab", "image": "Starter/4pc.jpeg"},
      {"name": "Aloo Tikki", "image": "Starter/5pc.jpeg"},
    ],
    "Main": [
      {"name": "Paneer Butter Masala", "image": "maincourse/idli.jpg"},
      {"name": "Dal Tadka", "image": "maincourse/idli.jpg"},
      {"name": "Veg Biryani", "image": "maincourse/idli.jpg"},
      {"name": "Aloo Gobi", "image": "maincourse/idli.jpg"},
      {"name": "Palak Paneer", "image": "maincourse/idli.jpg"},
      {"name": "Chole Bhature", "image": "maincourse/idli.jpg"},
    ],
    "Sweets": [
      {"name": "Gulab Jamun", "image": "maincourse/idli.jpg"},
      {"name": "Rasgulla", "image": "maincourse/idli.jpg"},
      {"name": "Kheer", "image": "maincourse/idli.jpg"},
      {"name": "Jalebi", "image": "maincourse/idli.jpg"},
      {"name": "Rabri", "image": "maincourse/idli.jpg"},
      {"name": "Carrot Halwa", "image": "maincourse/idli.jpg"},
    ],
  };

  final Map<String, List<Map<String, String>>> _nonVegItems = {
    "Starter": [
      {"name": "Chicken 65", "image": "maincourse/idli.jpg"},
      {"name": "Fish Fingers", "image": "maincourse/idli.jpg"},
      {"name": "Prawn Tempura", "image": "maincourse/idli.jpg"},
      {"name": "Chicken Tikka", "image": "maincourse/idli.jpg"},
      {"name": "Mutton Seekh Kebab", "image": "maincourse/idli.jpg"},
      {"name": "Fish Amritsari", "image": "maincourse/idli.jpg"},
    ],
    "Main": [
      {"name": "Butter Chicken", "image": "maincourse/idli.jpg"},
      {"name": "Chicken Biryani", "image": "maincourse/idli.jpg"},
      {"name": "Mutton Curry", "image": "maincourse/idli.jpg"},
      {"name": "Fish Curry", "image": "maincourse/idli.jpg"},
      {"name": "Chicken Korma", "image": "maincourse/idli.jpg"},
      {"name": "Mutton Rogan Josh", "image": "maincourse/idli.jpg"},
    ],
    "Sweets": [
      {"name": "Egg Pudding", "image": "maincourse/idli.jpg"},
      {"name": "Mango Mousse", "image": "maincourse/idli.jpg"},
      {"name": "Chocolate Lava Cake", "image": "maincourse/idli.jpg"},
      {"name": "Gulab Jamun", "image": "maincourse/idli.jpg"},
      {"name": "Custard Pudding", "image": "maincourse/idli.jpg"},
      {"name": "Tiramisu", "image": "maincourse/idli.jpg"},
    ],
  };
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> items = _vegNonVegValue == 0
        ? _vegItems[_selectedCategory] ?? []
        : _nonVegItems[_selectedCategory] ?? [];

    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.arrow_left_circle_fill, color: Colors.black, size: 35),
        title: Row(
          children: [
            const Text("South Indian Breakfast", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
            SizedBox(width: MediaQuery.sizeOf(context).width*0.04),
            Icon(Icons.edit_note_outlined,color: Colors.black54),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Top Section: Veg/Non-Veg Slider
          // Top Section: Veg/Non-Veg Switch Buttons
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: SingleChildScrollView(scrollDirection: Axis.horizontal,
              child: Container(
                height: MediaQuery.sizeOf(context).height*0.055,

                decoration: BoxDecoration( color: Colors.white,),
                child: Card(elevation: 2,color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Card(
                            elevation: 5,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Pure Veg  ",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,),
                                      ),
                                      Switch(
                                        activeThumbImage: const AssetImage('img/vegicon.png'),

                                        activeColor: Colors.green,// Veg icon for selected state
                                        inactiveThumbImage: const AssetImage('img/vegicon.png'), // Veg icon for unselected state
                                        inactiveTrackColor: Colors.white, // Unselected track color
                                        value: _vegNonVegValue == 0,
                                        onChanged: (bool value) {
                                          setState(() {
                                            if (value) {
                                              _vegNonVegValue = 0; // Set to Veg
                                            }
                                          });
                                        },),
                                     ],
                                  ),),
                                const SizedBox(width: 0), // Spacing between Veg and Non-Veg sections
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Non-Veg  ",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),),
                                      Switch(
                                        activeThumbImage: const AssetImage('img/nonvegicon.png'), // Non-Veg icon for selected state
                                        inactiveThumbImage: const AssetImage('img/nonvegicon.png'), // Non-Veg icon for unselected state
                                        inactiveTrackColor: Colors.white,
                                        activeColor: Colors.red,// Unselected track color
                                        value: _vegNonVegValue == 1,
                                        onChanged: (bool value) {
                                          setState(() {
                                            if (value) {
                                              _vegNonVegValue = 1; // Set to Non-Veg
                                            }
                                          });
                                        },),

                                    ],),
                                ),],
                            ),),
                        ),),
                       // Spacing between Veg and Non-Veg sections
                    ],),
                ),),
            ),),
          // Main Content with Category Selector on the Left
          Expanded(
            child: Row(
              children: [
                // Left Section: Category Buttons (Vertical)
                Container(

                  width: screenWidth * 0.18, // 30% width for the category section
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildCategoryButton("Starter",),
                      _buildCategoryButton("Main"),
                      _buildCategoryButton("Sweets"),
                    ],
                  ),),
                // Right Section: Display Items in a Scrollable Row
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: (items.length / 2).ceil(), // Calculate number of rows
                    itemBuilder: (context, rowIndex) {
                      int firstItemIndex = rowIndex * 2;
                      int secondItemIndex = firstItemIndex + 1;

                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (firstItemIndex < items.length)
                              _buildItemCard(items[firstItemIndex], screenWidth, screenHeight),
                            if (secondItemIndex < items.length)
                              _buildItemCard(items[secondItemIndex], screenWidth, screenHeight),
                          ],
                        ),);
                    },),
                ),],
            ),),
          // Bottom Section: Price and Add to Cart button
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 0.1,

            color: Colors.white,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text("Price per plate"),
                      Text(
                        "Total: ₹${_totalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),],
                  ),),
                const SizedBox(height: 10, width: 65),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.06,
                  width: MediaQuery.sizeOf(context).width * 0.43,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.purple),
                  child: Center(child: Text("Fill Details", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17))),
                )],
            ),),
        ],),
    );
  }
  Widget _buildCategoryButton(String category) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.135,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Image.asset("7 catogries/1.png"),
            InkWell(
              child: Column(
                children: [
                  Text( category,style:TextStyle(color: Colors.black54,fontWeight: FontWeight.bold) ,),
                ],
              ),onTap: (){

              setState(() {
                _selectedCategory = category;
              });
            },
            ), InkWell(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(

                  height: MediaQuery.sizeOf(context).height*0.03,
                  width: MediaQuery.sizeOf(context).width*0.15,
                  decoration: BoxDecoration(border: Border.all(color: Colors.green),color: _selectedCategory == category
                      ? (_vegNonVegValue == 0 ? Colors.green.shade200 : Colors.red.shade400)
                      : Colors.purple.shade400,borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text("2/2",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white) ,),
                  ),),),
              onTap: (){

                setState(() {
                  _selectedCategory = category;
                });
              },),
          ],),
      ),);}
  Widget _buildItemCard(Map<String, String> item, double screenWidth, double screenHeight) {
    return Container(

      width: screenWidth * 0.45,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                child: Container(
                  height: screenHeight * 0.18,
                  width: screenWidth * 0.7,
                  child: Image.asset(
                    item["image"]!,
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.15,
                    fit: BoxFit.cover,
                  ),
                ),),
              const SizedBox(height: 10),
              Container(
                height: screenHeight * 0.045,
                width: screenWidth,
                child: Text(
                  item["name"]!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: screenHeight * 0.05,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _selectedItems.contains(item["name"])
                        ? Colors.pink  // Full pink color when item is added
                        : Colors.white,  // White color when item is not added
                    border: Border.all(
                      color: _selectedItems.contains(item["name"])
                          ? Colors.transparent  // No border when added
                          : Colors.pink,  // Pink border when not added
                    ),),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (_selectedItems.contains(item["name"])) {
                          _selectedItems.remove(item["name"]);
                          _totalPrice -= _itemPrices[item["name"]!]!;
                        } else {
                          _selectedItems.add(item["name"]!);
                          _totalPrice += _itemPrices[item["name"]!]!;
                        }
                      });
                    },
                    child: Center(
                      child: Text(
                        _selectedItems.contains(item["name"]) ? "Added" : "Add",  // Text changes based on selection state
                        style: TextStyle(
                          color: _selectedItems.contains(item["name"])
                              ? Colors.white  // White text when added
                              : Colors.pink,  // Pink text when not added
                          fontWeight: FontWeight.bold,
                        ),),
                    ),),),),
            ],),
        ),),);}}
