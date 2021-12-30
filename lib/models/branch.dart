class Branch {
  String? branchName;
  String? subName;
  String? branchValue;

  //constructor
  Branch(this.branchName, this.subName, this.branchValue);

  static List<Branch> getBranch() {
    return [
      Branch('วิทยาการคอมพิวเตอร์', 'Computer Science', '1'),
      Branch('เทคโนโลยีสารสนเทศ', 'Information Technology', '2'),
    ];
  }
}
