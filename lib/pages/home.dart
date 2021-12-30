import 'package:ass3register/models/hobby.dart';
import 'package:ass3register/models/branch.dart';
import 'package:ass3register/models/year.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _studentIDcontroller = TextEditingController();

  String? yearValue;
  String? branchValue;

  late List<Year> years;
  late List<Branch> branchs;
  late List<Hobby> hobbys;

  List<ListItem> dropdownItems = ListItem.getListItem();
  late List<DropdownMenuItem<ListItem>> dropdownMenuItems;
  late ListItem _selectedItem;

  List selectedHobby = [];

  @override
  void initState() {
    super.initState();
    years = Year.getYear();
    branchs = Branch.getBranch();
    hobbys = Hobby.getHobby();

    dropdownMenuItems = createDropdownMenu(dropdownItems);
     _selectedItem = dropdownMenuItems[0].value!;
  }

  List<DropdownMenuItem<ListItem>> createDropdownMenu(
    List<ListItem> dropdownItems) {
      List<DropdownMenuItem<ListItem>> items = [];

      for (var item in dropdownItems) {
        items.add(DropdownMenuItem(
          child: Text(item.name!), 
          value: item,
        ));
      }
    
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.app_registration_rounded,
            size: 30,
          ),
        ),
        backgroundColor: Colors.lightBlueAccent,
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  subTitle1(),
                  const SizedBox(height: 14),
                  username(),
                  const SizedBox(height: 14),
                  studentID(),
                  const SizedBox(height: 14),
                  subTitle2(),
                  Column(
                    children: createYearRadio(),
                  ),
                  subTitle3(),
                  Column(
                    children: createBranchRadio(),
                  ),
                  const SizedBox(height: 14),
                  subTitle4(),
                  DropdownButton(
                      value: _selectedItem,
                      items: dropdownMenuItems,
                      onChanged: (value) {
                        setState(() {
                          _selectedItem = value as ListItem;
                        });
                      },
                    ),
                  const SizedBox(height: 14),
                  subTitle5(),
                  Column(
                    children: createHobbyCheckbox(),
                  ),
                  const SizedBox(height: 14),
                  submitButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ButtonTheme submitButton() {
    return ButtonTheme(
      // ignore: deprecated_member_use
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // ignore: avoid_print
            print(_usernamecontroller.text);
            // ignore: avoid_print
            print(_studentIDcontroller.text);
          }
        },
        child: const Text('ยืนยัน'),
      ),
    );
  }

   Padding subTitle5() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'งานอดิเรกที่ชอบทำ',
        style: TextStyle(
          fontSize: 22,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Padding subTitle4() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'คณะที่กำลังศึกษา',
        style: TextStyle(
          fontSize: 22,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Padding subTitle3() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'หลักสูตรที่กำลังศึกษา',
        style: TextStyle(
          fontSize: 22,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Padding subTitle2() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'ชั้นปีที่กำลังศึกษา',
        style: TextStyle(
          fontSize: 22,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Padding subTitle1() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'ข้อมูลนิสิต',
        style: TextStyle(
          fontSize: 22,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  TextFormField studentID() {
    return TextFormField(
      controller: _studentIDcontroller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'โปรดกรอกข้อมูลให้ครบถ้วน';
        }
        return null;
      },
      // obscureText: true,
      decoration: const InputDecoration(
          labelText: 'รหัสนิสิต',
          prefixIcon: Icon(Icons.assignment_ind_sharp),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32),
              ),
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 2,
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32),
              ),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2,
              ))),
    );
  }

  TextFormField username() {
    return TextFormField(
      controller: _usernamecontroller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'โปรดกรอกข้อมูลให้ครบถ้วน';
        }
        return null;
      },
      // obscureText: true,
      decoration: const InputDecoration(
          labelText: 'ชื่อ-นามสกุล',
          prefixIcon: Icon(Icons.person),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32),
              ),
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 2.0,
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32),
              ),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2,
              ))),
    );
  }

  List<Widget> createYearRadio() {
    List<Widget> listRadioYear = [];

    for (var year in years) {
      listRadioYear.add(
        RadioListTile<dynamic>(
          title: Text(year.yearName!),
          value: year.yearValue,
          groupValue: yearValue,
          onChanged: (value) {
            setState(() {
              yearValue = value.toString();
            });
          },
        ),
      );
    }
    return listRadioYear;
  }

  List<Widget> createBranchRadio() {
    List<Widget> listRadioBranch = [];

    for (var branch in branchs) {
      listRadioBranch.add(
        RadioListTile<dynamic>(
          title: Text(branch.branchName!),
          subtitle: Text(branch.subName!),
          value: branch.branchValue,
          groupValue: branchValue,
          onChanged: (value) {
            setState(() {
              branchValue = value.toString();
            });
          },
        ),
      );
    }
    return listRadioBranch;
  }

  List<Widget> createHobbyCheckbox() {
    List<Widget> listCheckboxHobby = [];

    for (var hobby in hobbys) {
      listCheckboxHobby.add(
        CheckboxListTile(
          title: Text(hobby.subName!),
          // subtitle: Text('credit: ${subject.credit}'),
          value: hobby.checked,
          onChanged: (value) {
            setState(() {
              hobby.checked = value!;
            });
            if (value!) {
              selectedHobby.add(hobby.subName!);
            } else {
              selectedHobby.remove(hobby.subName!);
            }
            print(selectedHobby);
          },
        ),
      );
    }
    return listCheckboxHobby;
  }
}

class ListItem{
  int? value;
  String? name;

  ListItem(this.value, this.name);

  static List<ListItem> getListItem() {
    return [
      ListItem(1, 'คณะวิทยาศาสตร์'),
      ListItem(2, 'คณะวิทยาการสุขภาพและการกีฬา'),
      ListItem(3, 'คณะเทคโนโลยีและการพัฒนาชุมชน'),
      ListItem(4, 'คณะวิศวกรรมศาสตร์'),
      ListItem(5, 'คณะพยาบาลศาสตร์'),
      ListItem(6, 'คณะนิติศาสตร์'),
      ListItem(7, 'คณะอุตสาหกรรมเกษตรและชีวภาพ'),
    ];
  }
}