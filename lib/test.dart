import 'dart:io';
import 'dart:convert';
void main() async{

  // produces a request object
  var request = await HttpClient().getUrl(Uri.parse('https://swapi.co/api/people/1'));
  // sends the request
  var response = await request.close();
  print(response);
  // transforms and prints the response
  await for (var contents in response.transform(Utf8Decoder())) {
    print(contents);
  }

  HttpClient()
      .getUrl(Uri.parse('https://swapi.co/api/people/1')) // produces a request object
      .then((request) => request.close()) // sends the request
      .then((response) =>
      response.transform(Utf8Decoder()).listen(print)); // transforms and prints the response
}