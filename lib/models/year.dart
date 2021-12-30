class Year {
  String? yearName;
  String? yearValue;

  //constructor
  Year(this.yearName, this.yearValue);

  static List<Year> getYear() {
    return [
      Year('ชั้นปีที่ 1', '1'),
      Year('ชั้นปีที่ 2', '2'),
      Year('ชั้นปีที่ 3', '3'),
      Year('ชั้นปีที่ 4', '4'),
    ];
  }
}
