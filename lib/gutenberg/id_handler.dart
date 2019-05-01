const String baseUrl =
    "ftp://ftp.mirrorservice.org/sites/ftp.ibiblio.org/pub/docs/books/gutenberg/";

String urlGenerator(String id) {
  String idUrl = "";
  id.substring(0, id.length - 1).runes.forEach((int rune) {
    var character = new String.fromCharCode(rune);
    idUrl += character + "/";
  });
  idUrl += id;
  return baseUrl + idUrl;
}
