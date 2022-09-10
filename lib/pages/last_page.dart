import 'package:flutter/material.dart';

class LastPage extends StatefulWidget {
  //const LastPage({Key? key}) : super(key: key);
  String subt;
  LastPage({required this.subt});

  @override
  State<LastPage> createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController town = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController optional = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.25,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Image.asset(
          "assets/images/logo_black.png",
          // height: 48,
          width: 63,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey[100],
        padding: EdgeInsets.all(5),
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Billing Details',
                style: TextStyle(
                    fontFamily: 'kalpurush', fontSize: 38, color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'First Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 40,
                        width: 150,
                        child: TextFormField(
                            //  autofillHints: '1',
                            //  keyboardType: TextInputType.number,
                            cursorHeight: 20,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              // hintText: '1',
                              contentPadding:
                                  EdgeInsets.only(left: 14.0, top: 14.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFFCCCCCC), width: 1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 24, 24, 24),
                                    width: 1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            controller: firstname),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Last Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 40,
                        width: 150,
                        child: TextFormField(
                          //  autofillHints: '1',
                          // keyboardType: TextInputType.number,
                          cursorHeight: 20,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            //   hintText: '1',
                            contentPadding:
                                EdgeInsets.only(left: 14.0, top: 14.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xFFCCCCCC), width: 1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 24, 24, 24),
                                  width: 1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          controller: lastname,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Company Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                    width: 320,
                    child: TextFormField(
                      //  autofillHints: '1',
                      //  keyboardType: TextInputType.number,
                      cursorHeight: 20,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        //     hintText: '1',
                        contentPadding: EdgeInsets.only(left: 14.0, top: 14.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFCCCCCC), width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 24, 24, 24), width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      controller: company,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Country/Region',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                    width: 320,
                    child: TextFormField(
                      //  autofillHints: '1',
                      //   keyboardType: TextInputType.number,
                      cursorHeight: 20,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        //hintText: '1',
                        contentPadding: EdgeInsets.only(left: 14.0, top: 14.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFCCCCCC), width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 24, 24, 24), width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      controller: country,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Street Address',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                    width: 320,
                    child: TextFormField(
                      //  autofillHints: '1',
                      //  keyboardType: TextInputType.number,
                      cursorHeight: 20,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        // hintText: '1',
                        contentPadding: EdgeInsets.only(left: 14.0, top: 14.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFCCCCCC), width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 24, 24, 24), width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      controller: street,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 40,
                    width: 320,
                    child: TextFormField(
                      //  autofillHints: '1',
                      //  keyboardType: TextInputType.number,
                      cursorHeight: 20,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        //  hintText: '1',
                        contentPadding: EdgeInsets.only(left: 14.0, top: 14.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFCCCCCC), width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 24, 24, 24), width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      controller: street,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Town / City',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                    width: 320,
                    child: TextFormField(
                      //  autofillHints: '1',
                      //  keyboardType: TextInputType.number,
                      cursorHeight: 20,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        // hintText: '1',
                        contentPadding: EdgeInsets.only(left: 14.0, top: 14.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFCCCCCC), width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 24, 24, 24), width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      controller: town,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'State',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                    width: 320,
                    child: TextFormField(
                      //  autofillHints: '1',
                      //  keyboardType: TextInputType.number,
                      cursorHeight: 20,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        //  hintText: '1',
                        contentPadding: EdgeInsets.only(left: 14.0, top: 14.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFCCCCCC), width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 24, 24, 24), width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      controller: state,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PIN CODE',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                    width: 320,
                    child: TextFormField(
                      //  autofillHints: '1',
                      keyboardType: TextInputType.number,
                      cursorHeight: 20,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        //  hintText: '1',
                        contentPadding: EdgeInsets.only(left: 14.0, top: 14.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFCCCCCC), width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 24, 24, 24), width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      controller: pincode,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phone',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                    width: 320,
                    child: TextFormField(
                      //  autofillHints: '1',
                      keyboardType: TextInputType.number,
                      cursorHeight: 20,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        // hintText: '1',
                        contentPadding: EdgeInsets.only(left: 14.0, top: 14.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFCCCCCC), width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 24, 24, 24), width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      controller: phone,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email Address',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                    width: 320,
                    child: TextFormField(
                      //  autofillHints: '1',
                      keyboardType: TextInputType.emailAddress,
                      cursorHeight: 20,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        //  hintText: '1',
                        contentPadding: EdgeInsets.only(left: 14.0, top: 14.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFCCCCCC), width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 24, 24, 24), width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      controller: email,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Notes (Optional)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 70,
                    width: 320,
                    child: TextFormField(
                      //  autofillHints: '1',
                      //   keyboardType: TextInputType.number,
                      cursorHeight: 20,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        //   hintText: '1',
                        contentPadding: EdgeInsets.only(left: 14.0, top: 14.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFCCCCCC), width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 24, 24, 24), width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      controller: optional,
                    ),
                  )
                ],
              ),
              Text(
                'My Order',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: ListTile(
                        //   minVerticalPadding: 1,
                        //  tileColor: Colors.grey,
                        title: Text(
                          'SubTotal :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        // subtitle:
                        //     Text('cost: ${item.id.toString() ?? 'free'}'),
                        trailing: Text(
                          widget.subt,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(
                              color: Color.fromARGB(255, 197, 191, 191))),
                      child: ListTile(
                        //   minVerticalPadding: 1,
                        //  tileColor: Colors.grey,
                        title: Text(
                          'Shipping Amount :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        // subtitle:
                        //     Text('cost: ${item.id.toString() ?? 'free'}'),
                        trailing: Text(
                          'Rs. 50',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: ListTile(
                        //   minVerticalPadding: 1,
                        //  tileColor: Colors.grey,
                        title: Text(
                          'Total :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        // subtitle:
                        //     Text('cost: ${item.id.toString() ?? 'free'}'),
                        trailing: Text(
                        (int.parse(widget.subt.toString()) + 50).toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    // Spacer(),
                    // Expanded(
                    //   child: Center(
                    //     child: Text(
                    //       'Oops! There are no products in cart',
                    //       style: TextStyle(
                    //           fontFamily: 'kalpurush',
                    //           fontSize: 19.sp,
                    //           color: Colors.black),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 1,
                    //   width: double.infinity,
                    //   child: Divider(
                    //     color: Colors.black,
                    //     thickness: 0.2,
                    //   ),
                    // ),
                    // Expanded(
                    //   child: Container(
                    //     child: ,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
