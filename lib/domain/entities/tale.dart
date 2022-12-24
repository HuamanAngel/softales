class Tale {
  final String id;
  final String title;
  final String? description;
  final String? coverImageUrl;
  final DateTime createdAt;
  final DateTime lastUpdatedAt;
  final String authorId;
  final String content;

  Tale({
    required this.id,
    required this.title,
    this.description = '',
    this.coverImageUrl = '',
    required this.createdAt,
    required this.lastUpdatedAt,
    required this.authorId,
    required this.content,
  });

  Tale.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        title = json['tal_titl'],
        description = json['tal_desc'],
        coverImageUrl = json['tal_fron_img'] ?? '',
        createdAt = DateTime.parse(json['created_at']),
        lastUpdatedAt = DateTime.parse(json['updated_at']),
        authorId = json['col_id'],
        content = json['tal_cont'];

  Map<String, dynamic> toJson() => {
        'id': int.parse(id),
        'tal_titl': title,
        'tal_desc': description,
        'tal_fron_img': coverImageUrl,
        'tal_cont': content,
        'created_at': createdAt.toIso8601String(),
        'updated_at': lastUpdatedAt.toIso8601String(),
        'col_id': authorId,
      };
}
