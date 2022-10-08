import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AddInfoPage extends StatefulWidget {
  const AddInfoPage({Key? key}) : super(key: key);

  @override
  State<AddInfoPage> createState() => _AddInfoPageState();
}

class _AddInfoPageState extends State<AddInfoPage> {
  final _productNameController = TextEditingController();
  final _productColorController = TextEditingController();
  final _productPriceController = TextEditingController();
  final _productBoughtDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Add Cloth'),
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: SizedBox(
                            width: 1,
                          ),
                          flex: 1,
                        ),
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: InkWell(
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 60,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Text(
                                      'Add Photo',
                                      textScaleFactor: 1.5,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            width: 1,
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: CustomTextField(
                          productNameController: _productNameController,
                          label: 'Name',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: CustomTextField(
                          productNameController: _productColorController,
                          label: 'Color',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: CustomTextField(
                          productNameController: _productPriceController,
                          label: 'Price',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                            style: TextStyle(fontSize: 15),
                            controller: _productBoughtDateController, //editing controller of this TextField
                            decoration: const InputDecoration(
                                icon: Icon(Icons.calendar_today),
                                labelText: "Date Bought",
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              iconColor: Color(0xFFef356f),
                              labelStyle: TextStyle(fontSize: 15, color: Color(0xFFef356f)),
                            ),

                            readOnly: true,  // when true user cannot edit text
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(), //get today's date
                                  firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime.now(),
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: const ColorScheme.light(
                                        primary: Color(0xFFE65C4F),
                                        onPrimary: Colors.white,
                                        onSurface: Color(0xFF326789),
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          primary: Colors.red, // button text color
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );
                              if(pickedDate!=null){
                                String selectedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                                _productBoughtDateController.value = TextEditingValue(text: selectedDate);
                              }

                            }
                        ),
                      ),
                      //Radio(value: 'Male', groupValue: "Gender",  onChanged: (v){}),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextDropdownFormField(
                          options: ["Male", "Female"],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.arrow_drop_down),
                              labelText: "Gender"),
                          dropdownHeight: 60,
                        ),
                      ),
                      //DropdownButton(items: , onChanged: onChanged)
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required TextEditingController productNameController,
    required String label,
  })  : _controller = productNameController,
        _label = label,
        super(key: key);

  final TextEditingController _controller;
  final String _label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 15),
      controller: _controller,
      obscureText: false,
      autofocus: false,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        labelText: _label,
        labelStyle: TextStyle(fontSize: 15, color: Color(0xFFef356f)),
      ),
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.none,
      autocorrect: false,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please Enter $_label';
        }
        return null;
      },
    );
  }
}
