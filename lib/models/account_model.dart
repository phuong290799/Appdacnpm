class Account_model {
  late int maNd;
  late String tenNd;
  late String sdt;
  late String cmnd;
  late String diaChi;
  late String ngaySinh;
  late int vaitro;
  Account_model(
      {required this.cmnd,
        required this.diaChi,
        required this.maNd,
        required this.ngaySinh,
        required this.sdt,
        required this.tenNd,
        required this.vaitro});

  Account_model.fromJson(Map<String, dynamic> json) {
    maNd = json['maNd'];
    // tenNd = json['tenNd'];
    // sdt = json['sdt'];
    // cmnd = json['cmnd'];
    // diaChi = json['diaChi'];
    // ngaySinh = json['ngaySinh'];
    //vaitro = json['vaitro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maNd'] = this.maNd;
    data['tenNd'] = this.tenNd;
    data['sdt'] = this.sdt;
    data['cmnd'] = this.cmnd;
    data['diaChi'] = this.diaChi;
    data['ngaySinh'] = this.ngaySinh;
    data['vaitro'] = this.vaitro;
    return data;
  }
}