class Reviews {
  late String tenNhaXe;
  late String tenNd;
  late String sdt;

  late String imageUrl;
  late int sao;
   late String noiDungDanhGia;

  Reviews(
      {required this.tenNhaXe,
        required this.tenNd,
        required this.sdt,
        required this.imageUrl,
        required this.sao,
        required this.noiDungDanhGia});

  Reviews.fromJson(Map<String, dynamic> json) {
    tenNhaXe = json['tenNhaXe'];
    tenNd = json['tenNd'];
    sdt = json['sdt'];
    imageUrl = json['imageUrl'];
    sao = json['sao'];
    noiDungDanhGia = json['noiDungDanhGia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenNhaXe'] = this.tenNhaXe;
    data['tenNd'] = this.tenNd;
    data['sdt'] = this.sdt;
    data['imageUrl'] = this.imageUrl;
    data['sao'] = this.sao;
    data['noiDungDanhGia'] = this.noiDungDanhGia;
    return data;
  }
}
