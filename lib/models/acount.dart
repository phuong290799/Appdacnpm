class acount {
  late int maNd;
  late String email;
  late String tenNd;
  late String sdt;
  late String cmnd;
  late String diaChi;
  late String ngaySinh;
  late String imageUrl;

  acount(
      {required this.maNd,
      required this.email,
      required this.tenNd,
      required this.sdt,
      required this.cmnd,
      required this.diaChi,
      required this.ngaySinh,
      required this.imageUrl});

  acount.fromJson(Map<String, dynamic> json) {
    maNd = json['maNd'];
    email = json['email'];
    tenNd = json['tenNd'];
    sdt = json['sdt'];
    cmnd = json['cmnd'];
    diaChi = json['diaChi'];
    ngaySinh = json['ngaySinh'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maNd'] = this.maNd;
    data['email'] = this.email;
    data['tenNd'] = this.tenNd;
    data['sdt'] = this.sdt;
    data['cmnd'] = this.cmnd;
    data['diaChi'] = this.diaChi;
    data['ngaySinh'] = this.ngaySinh;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
