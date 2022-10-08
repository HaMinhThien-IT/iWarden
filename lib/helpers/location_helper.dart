// ignore: constant_identifier_names
const GOOGLE_API_KEY = 'AIzaSyCeR7YV7SU_0rjZgzMA-5tl3HO1brNH3q4';

class LocationHelper {
  static String generateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}
