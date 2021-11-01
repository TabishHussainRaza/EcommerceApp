// To parse this JSON data, do
//
//     final productList = productListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

ProductList productListFromJson(String str) => ProductList.fromJson(json.decode(str));
String productListToJson(ProductList data) => json.encode(data.toJson());

class ProductList {
  ProductList({
    required this.data,
    required this.links,
    required this.meta,
  });

  List<Product> data;
  Links links;
  Meta meta;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
    data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links.toJson(),
    "meta": meta.toJson(),
  };
}

class Product {
  Product({
    required this.id,
    required this.sku,
    required this.type,
    required this.name,
    required this.urlKey,
    required this.price,
    required this.formatedPrice,
    required this.shortDescription,
    required this.description,
    required this.images,
    required this.videos,
    required this.baseImage,
    required this.createdAt,
    required this.updatedAt,
    required this.reviews,
    required this.inStock,
    required this.isSaved,
    required this.isWishlisted,
    required this.isItemInCart,
    required this.showQuantityChanger,
  });

  int id;
  String sku;
  String type;
  String name;
  String urlKey;
  String price;
  String formatedPrice;
  String shortDescription;
  String description;
  List<image> images;
  List<dynamic> videos;
  BaseImage baseImage;
  DateTime createdAt;
  DateTime updatedAt;
  Reviews reviews;
  bool inStock;
  bool isSaved;
  bool isWishlisted;
  bool isItemInCart;
  bool showQuantityChanger;



  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    sku: json["sku"],
    type: json["type"],
    name: json["name"],
    urlKey: json["url_key"],
    price: json["price"],
    formatedPrice: json["formated_price"],
    shortDescription: json["short_description"],
    description: json["description"],
    images: List<image>.from(json["images"].map((x) => image.fromJson(x))),
    videos: List<dynamic>.from(json["videos"].map((x) => x)),
    baseImage: BaseImage.fromJson(json["base_image"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    reviews: Reviews.fromJson(json["reviews"]),
    inStock: json["in_stock"],
    isSaved: json["is_saved"],
    isWishlisted: json["is_wishlisted"],
    isItemInCart: json["is_item_in_cart"],
    showQuantityChanger: json["show_quantity_changer"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "type": type,
    "name": name,
    "url_key": urlKey,
    "price": price,
    "formated_price": formatedPrice,
    "short_description": shortDescription,
    "description": description,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "videos": List<dynamic>.from(videos.map((x) => x)),
    "base_image": baseImage.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "reviews": reviews.toJson(),
    "in_stock": inStock,
    "is_saved": isSaved,
    "is_wishlisted": isWishlisted,
    "is_item_in_cart": isItemInCart,
    "show_quantity_changer": showQuantityChanger,
  };
}

class BaseImage {
  BaseImage({
    required this.smallImageUrl,
    required this.mediumImageUrl,
    required this.largeImageUrl,
    required this.originalImageUrl,
  });

  String smallImageUrl;
  String mediumImageUrl;
  String largeImageUrl;
  String originalImageUrl;

  factory BaseImage.fromJson(Map<String, dynamic> json) => BaseImage(
    smallImageUrl: json["small_image_url"],
    mediumImageUrl: json["medium_image_url"],
    largeImageUrl: json["large_image_url"],
    originalImageUrl: json["original_image_url"],
  );

  Map<String, dynamic> toJson() => {
    "small_image_url": smallImageUrl,
    "medium_image_url": mediumImageUrl,
    "large_image_url": largeImageUrl,
    "original_image_url": originalImageUrl,
  };
}

class image {
  image({
    required this.id,
    required this.path,
    required this.url,
    required this.originalImageUrl,
    required this.smallImageUrl,
    required this.mediumImageUrl,
    required this.largeImageUrl,
  });

  int id;
  String path;
  String url;
  String originalImageUrl;
  String smallImageUrl;
  String mediumImageUrl;
  String largeImageUrl;

  factory image.fromJson(Map<String, dynamic> json) => image(
    id: json["id"],
    path: json["path"],
    url: json["url"],
    originalImageUrl: json["original_image_url"],
    smallImageUrl: json["small_image_url"],
    mediumImageUrl: json["medium_image_url"],
    largeImageUrl: json["large_image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "path": path,
    "url": url,
    "original_image_url": originalImageUrl,
    "small_image_url": smallImageUrl,
    "medium_image_url": mediumImageUrl,
    "large_image_url": largeImageUrl,
  };
}

class Reviews {
  Reviews({
    required this.total,
    required this.totalRating,
    required this.averageRating,
    required this.percentage,
  });

  int total;
  int totalRating;
  int averageRating;
  List<dynamic> percentage;

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
    total: json["total"],
    totalRating: json["total_rating"],
    averageRating: json["average_rating"],
    percentage: List<dynamic>.from(json["percentage"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "total_rating": totalRating,
    "average_rating": averageRating,
    "percentage": List<dynamic>.from(percentage.map((x) => x)),
  };
}

class Links {
  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  String first;
  String last;
  dynamic prev;
  dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  int currentPage;
  int from;
  int lastPage;
  List<Link> links;
  String path;
  int perPage;
  int to;
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
    "path": path,
    "per_page": perPage,
    "to": to,
    "total": total,
  };
}

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  String url;
  String label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"] == null ? null : json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "label": label,
    "active": active,
  };
}

List<Product> demoProducts = [
  Product
    (
      id: 8,
      sku: '14121412',
      type: 'simple',
      name: 'Bakehouse Garlic Bread 300g',
      urlKey: 'Gluten Free Bakehouse Garlic Bread 300g',
      price: '3.80',
      shortDescription: 'Gluten Free Bakehouse Garlic Bread is both gluten free and vegan friendly. Our crusty, golden garlic bread has no artificial flavours or colours, just good honest ingredients.',
      description: 'Gluten Free Bakehouse Garlic Bread is both gluten free and vegan friendly. Our crusty, golden garlic bread has no artificial flavours or colours, just good honest ingredients.',
      images: [
        image(
            id: 1,
            path: "product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            url: "http://localhost/storage/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            originalImageUrl: "http://localhost/storage/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            smallImageUrl: "assets/images/gf_gp.png",
            mediumImageUrl: "assets/images/gf_gp.png",
            largeImageUrl: "http://192.168.8.193:8090/cache/large/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png"

        )
      ],
      videos: [],
      baseImage: BaseImage(
          smallImageUrl: "http://192.168.8.193:8090/cache/small/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
          mediumImageUrl: "http://192.168.8.193:8090/cache/medium/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
          largeImageUrl: "http://192.168.8.193:8090/cache/large/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
          originalImageUrl: "http://192.168.8.193:8090/cache/original/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png"
      ),
      createdAt: DateTime.parse("2021-08-29T01:34:43.000000Z"),
      updatedAt: DateTime.parse("2021-08-29T01:34:43.000000Z"),
      reviews: Reviews(
          total: 0,
          totalRating: 0,
          averageRating: 0,
          percentage: []
      ),
      inStock: true,
      isSaved: false,
      isWishlisted: false,
      isItemInCart: false,
      showQuantityChanger: true,
      formatedPrice: '10,000.00'),
  Product
    (
      id: 7,
      sku: '14121412',
      type: 'simple',
      name: 'Gluten Free Flour 750g',
      urlKey: 'Gluten Free Flour 750g',
      price: '2.65',
      shortDescription: 'Free From Plain Flour is all purpose plain flour for use in everyday cooking and baking contains gluten free, soy free, egg free, no artificial preservatives and no artificial colours or flavours.',
      description: 'Free From Plain Flour is all purpose plain flour for use in everyday cooking and baking contains gluten free, soy free, egg free, no artificial preservatives and no artificial colours or flavours.',
      images: [
        image(
            id: 1,
            path: "product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            url: "http://localhost/storage/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            originalImageUrl: "http://localhost/storage/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            smallImageUrl: "assets/images/flour.png",
            mediumImageUrl: "assets/images/flour.png",
            largeImageUrl: "http://192.168.8.193:8090/cache/large/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png"

        ),
        image(
            id: 2,
            path: "product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            url: "http://localhost/storage/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            originalImageUrl: "http://localhost/storage/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            smallImageUrl: "http://192.168.8.193:8090/cache/small/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
            mediumImageUrl: "assets/images/flour_p2.png",
            largeImageUrl: "http://192.168.8.193:8090/cache/large/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png"

        )
      ],
      videos: [],
      baseImage: BaseImage(
          smallImageUrl: "http://192.168.8.193:8090/cache/small/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
          mediumImageUrl: "http://192.168.8.193:8090/cache/medium/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
          largeImageUrl: "http://192.168.8.193:8090/cache/large/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png",
          originalImageUrl: "http://192.168.8.193:8090/cache/original/product/1/pqrdYhgMrN4N2HBbCJmGbbIA0cdiBSEod5kXjnea.png"
      ),
      createdAt: DateTime.parse("2021-08-29T01:34:43.000000Z"),
      updatedAt: DateTime.parse("2021-08-29T01:34:43.000000Z"),
      reviews: Reviews(
          total: 0,
          totalRating: 0,
          averageRating: 0,
          percentage: []
      ),
      inStock: true,
      isSaved: false,
      isWishlisted: false,
      isItemInCart: false,
      showQuantityChanger: true,
      formatedPrice: '10,000.00')
];
