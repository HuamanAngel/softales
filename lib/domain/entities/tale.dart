class Tale {
  final String id;
  final String title;
  final String? description;
  final String? coverImageUrl;
  final DateTime createdAt;
  final DateTime lastUpdatedAt;
  final String authorId;
  final List<String>? tags;

  Tale({
    required this.id,
    required this.title,
    this.description = '',
    this.coverImageUrl = '',
    required this.createdAt,
    required this.lastUpdatedAt,
    required this.authorId,
    this.tags = const [],
  });
}

List<Tale> DUMMY_TALES = [
  Tale(
    id: '1',
    title: 'Tale 1',
    description: 'Tale 1 description',
    coverImageUrl: 'https://picsum.photos/200/300',
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
    authorId: '1',
    tags: ['1', '2'],
  ),
  Tale(
    id: '2',
    title: 'Tale 2',
    description: 'LoremIpsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc. Donec auctor, nisl eget aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc. Donec auctor, nisl eget aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc. Donec auctor, nisl eget aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc. Donec auctor, nisl eget aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc. Donec auctor, nisl eget aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc. Donec auctor, nisl eget aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc. Donec auctor, nisl eget aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc. Donec auctor, nisl eget aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc. Donec auctor, nisl eget aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc. Donec auctor, nisl eget aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc. Donec auctor, nisl eget aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc. Donec auctor, nisl eget aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc. Donec auctor, nisl eget aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc. Donec auctor, nisl eget aliquam tincidunt, nunc',
    coverImageUrl: 'https://picsum.photos/200/300',
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
    authorId: '1',
    tags: ['1', '2'],
  ),
  Tale(
    id: '3',
    title: 'Tale 3',
    description: 'Tale 3 description',
    coverImageUrl: 'https://picsum.photos/200/300',
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
    authorId: '1',
    tags: ['1', '2'],
  ),
  Tale(
    id: '4',
    title: 'Tale 4',
    description: 'Tale 4 description',
    coverImageUrl: 'https://picsum.photos/200/300',
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
    authorId: '1',
    tags: ['1', '2'],
  ),
  Tale(
    id: '5',
    title: 'Tale 5',
    description: 'Tale 5 description',
    coverImageUrl: 'https://picsum.photos/200/300',
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
    authorId: '1',
    tags: ['1', '2'],
  ),
  Tale(
    id: '6',
    title: 'Tale 6',
    description: 'Tale 6 description',
    coverImageUrl: 'https://picsum.photos/200/300',
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
    authorId: '1',
    tags: ['1', '2'],
  ),
  Tale(
    id: '7',
    title: 'Tale 7',
    description: 'Tale 7 description',
    coverImageUrl: 'https://picsum.photos/200/300',
    createdAt: DateTime.now(),
    lastUpdatedAt: DateTime.now(),
    authorId: '1',
    tags: ['1', '2'],
  ),
];
