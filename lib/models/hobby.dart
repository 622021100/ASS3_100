class Hobby {
  String? hobbyID;
  String? subName;
  bool? checked = false;

  //constructor
  Hobby(this.hobbyID, this.subName, this.checked);

  static List<Hobby> getHobby() {
    return [
      Hobby('00001', 'ชอบเล่นเกม', false),
      Hobby('00002', 'เก่งกีฬา Extreme ', true),
      Hobby('00003', 'วาดรูป', false),
      Hobby('00004', 'ถ่ายรูป', true),
      Hobby('00005', 'ทำอาหาร', false),
      Hobby('00006', 'สนใจเรื่องการลงทุน', false),
      Hobby('00007', 'เล่นดนตรี', true),
      Hobby('00008', 'จัดสวน/ปลูกต้นไม้', false),
    ];
  }
}