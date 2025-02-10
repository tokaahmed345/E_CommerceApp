class ItemInfo {
  final String? id;
  final String? name;
  final double? price;
  final String? description;
  final String? categoryId;
  final String? img;
  final List<ImageData>? images;
  final List<Review>? reviews;

  ItemInfo({
    this.id,
    this.name,
    this.price,
    this.description,
    this.categoryId,
    this.img,
    this.images,
    this.reviews,
  });

  factory ItemInfo.fromJson(Map<String, dynamic> json) {
    return ItemInfo(
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      price: (json['Price'] as num?)?.toDouble(),
      description: json['Description'] as String?,
      categoryId: json['CategoryId'] as String?,
      img: json['Img'] as String?,
      images: (json['Images'] as List<dynamic>?)
          ?.map((e) => ImageData.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviews: (json['Reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ImageData {
  final String? image;

  ImageData({this.image});

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(image: json['Image'] as String?);
  }
}

class Review {
  final String? username;
  final String? feedback;
  final double? rating;

  Review({
    this.username,
    this.feedback,
    this.rating,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      username: json['Username'] as String?,
      feedback: json['Feedback'] as String?,
      rating: (json['Rating'] as num?)?.toDouble(),
    );
  }
}
