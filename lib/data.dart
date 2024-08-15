class Article {
  final String title;
  final String image;
  final String location;
  final String author;
  final int likes;
  final int comments;
  final int shares;
  final double rating;
  bool isLiked = false;

  Article(this.title, this.image, this.comments, this.likes, this.isLiked,
      this.location, this.shares, this.author, this.rating);
}

List<Article> articles = [
  Article(
      'Japan\'s second largest metropolitan area',
      'https://images.pexels.com/photos/326055/pexels-photo-326055.jpeg',
      100,
      32000,
      true,
      'Osaka Japan',
      50,
      'Hussain Mustafa',
      4),
  Article(
      'Known as the sleepless town for obvious reasons',
      'https://images.pexels.com/photos/2749481/pexels-photo-2749481.jpeg',
      300,
      50000,
      true,
      'Kabuikicho Japan',
      1250,
      'Tim Salvatore',
      3.5),
  Article(
      'Japan\'s second largest metropolitan area',
      'https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg',
      200,
      10000,
      true,
      'Tokyo Japan',
      1000,
      'Ely Marya',
      5),
];
