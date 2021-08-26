class Reviews {
  late String tenNhaXe;
  late String tenNd;
  late String sdt;
  late String imageUrl;
  late int sao;
   late String noiDungDanhGia;
   late String maDanhGia;
   late String maNd;

  Reviews(
      {required this.tenNhaXe,
        required this.tenNd,
        required this.sdt,
        required this.imageUrl,
        required this.sao,
        required this.noiDungDanhGia,required this.maNd, required this.maDanhGia});

  Reviews.fromJson(Map<String, dynamic> json) {
    tenNhaXe = json['tenNhaXe'];
    tenNd = json['tenNd'];
    sdt = json['sdt'];
    imageUrl = json['imageUrl']??"";
    sao = json['sao'];
    noiDungDanhGia = json['noiDungDanhGia'];
    maDanhGia=json["maDanhGia"];
    maNd=json['maNd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenNhaXe'] = this.tenNhaXe;
    data['tenNd'] = this.tenNd;
    data['sdt'] = this.sdt;
    data['imageUrl'] = this.imageUrl;
    data['sao'] = this.sao;
    data['noiDungDanhGia'] = this.noiDungDanhGia;
    data['maNd']=this.maNd;
    data['maDanhGia']=this.maDanhGia;
    return data;
  }
}
