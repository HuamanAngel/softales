class TaleData {
  final String taleId;
  final String title;
  final String author;
  final String publishedDate;
  final String lastUpdatedDate;
  final String description;
  final String image;
  final int readCount;
  final int likeCount;
  final List<String> tags;

  TaleData({
    this.taleId = '',
    this.title = '',
    this.author = '',
    this.publishedDate = '00/00/0000',
    this.lastUpdatedDate = '00/00/0000',
    this.description = '',
    this.image = '',
    this.readCount = 0,
    this.likeCount = 0,
    this.tags = const ['Hola', 'Mundo'],
  });
}

List<TaleData> DUMMY_TALES = [
  TaleData(
    taleId: '1',
    title: 'La Bella y la Bestia',
    author: '1',
    publishedDate: '01/01/2021',
    description:
        'La Bella y la Bestia es una historia de hadas escrita por Gabrielle-Suzanne Barbot de Villeneuve, publicada en 1740. La historia se basa en la novela de Jeanne-Marie Leprince de Beaumont, publicada en 1756. La historia se ha adaptado a numerosos medios, incluidos libros, películas, series de televisión, obras de teatro, ballets, juegos de video y parques temáticos.',
  ),
  TaleData(
    taleId: '2',
    title: 'Caperucita Roja',
    author: '2',
    publishedDate: '01/01/2021',
    description:
        'Caperucita Roja es un cuento de hadas escrito por Charles Perrault en 1697. La historia se ha adaptado a numerosos medios, incluidos libros, películas, series de televisión, obras de teatro, ballets, juegos de video y parques temáticos.',
  ),
  TaleData(
    taleId: '3',
    title: 'La Cenicienta',
    author: '3',
    publishedDate: '01/01/2021',
    description:
        'La Cenicienta es un cuento de hadas escrito por Charles Perrault en 1697. La historia se ha adaptado a numerosos medios, incluidos libros, películas, series de televisión, obras de teatro, ballets, juegos de video y parques temáticos.',
  ),
  TaleData(
    taleId: '4',
    title: 'La Sirenita',
    author: '4',
    publishedDate: '01/01/2021',
    description:
        'La Sirenita es un cuento de hadas escrito por Hans Christian Andersen en 1837. La historia se ha adaptado a numerosos medios,incluidos libros, películas, series de televisión, obras de teatro, ballets, juegos de video y parques temáticos.',
  ),
  TaleData(
    taleId: '5',
    title: 'La Bella Durmiente',
    author: '5',
    publishedDate: '01/01/2021',
    description:
        'La Bella Durmiente es un cuento de hadas escrito por Charles Perrault en 1697. La historia se ha adaptado a numerosos medios, incluidos libros, películas, series de televisión, obras de teatro, ballets, juegos de video y parques temáticos.',
  ),
  TaleData(
    taleId: '6',
    title: 'Blancanieves',
    author: '6',
    publishedDate: '01/01/2021',
    description:
        'Blancanieves es un cuento de hadas escrito por los hermanos Grimm en 1812. La historia se ha adaptado a numerosos medios, incluidos libros, películas, series de televisión, obras de teatro, ballets, juegos de video y parques temáticos.',
  ),
];