class MyTicket {
 late int maVe;
 late String tenKh;
   late String sdt;
 late int maChoNgoi;
 late String tenTuyenXe;
 late String bienSoXe;
  late String ngayXuatBen;
  late double donGia;
 late String ghiChu;

  MyTicket(
      {required this.maVe,
        required this.tenKh,
        required this.sdt,
        required this.maChoNgoi,
        required this.tenTuyenXe,
        required this.bienSoXe,
        required this.ngayXuatBen,
        required this.donGia,
        required this.ghiChu});

  MyTicket.fromJson(Map<String, dynamic> json) {
    maVe = json['maVe'];
    tenKh = json['tenKh'];
    sdt = json['sdt'];
    maChoNgoi = json['maChoNgoi'];
    tenTuyenXe = json['tenTuyenXe'];
    bienSoXe = json['bienSoXe'];
    ngayXuatBen = json['ngayXuatBen'];
    donGia = json['donGia'];
    ghiChu = json['ghiChu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maVe'] = this.maVe;
    data['tenKh'] = this.tenKh;
    data['sdt'] = this.sdt;
    data['maChoNgoi'] = this.maChoNgoi;
    data['tenTuyenXe'] = this.tenTuyenXe;
    data['bienSoXe'] = this.bienSoXe;
    data['ngayXuatBen'] = this.ngayXuatBen;
    data['donGia'] = this.donGia;
    data['ghiChu'] = this.ghiChu;
    return data;
  }
}
