import 'dart:core';

class DesModel {
  final String id;
  final String name;
  final String image;
  final List<String> genre;
  final String rating;

  DesModel(this.id, this.name, this.image, this.genre, this.rating);

  static List<DesModel> MockData() {
    List<DesModel> ls = [];
    ls.add(DesModel(
        '1', 'Nhà Quốc Tuấn', 'assets/images/TuanBoidoi2.png', [''], '4'));

    ls.add(DesModel('2', 'Nhà Công Đạt', 'assets/images/Dat.jpg', [''], '4'));

    ls.add(DesModel(
        '3', 'Trường Khoa Học Huế', 'assets/images/lhoahoc.jpg', [''], '4'));

    ls.add(DesModel(
        '4', 'Trường Nguyễn Huệ', 'assets/images/nguyenhue.jpg', [''], '4'));
    return ls;
  }
}
