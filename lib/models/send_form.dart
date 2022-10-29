class TypeSendForm {
  final int id;
  final String title;
  TypeSendForm({required this.id, required this.title});
}

final List<TypeSendForm> listType = [
  TypeSendForm(id: 1, title: "Health and safety"),
  TypeSendForm(id: 2, title: "Signage"),
  TypeSendForm(id: 3, title: "Incident report"),
];
final List<TypeSendForm> listLevel = [
  TypeSendForm(id: 1, title: "High damage"),
  TypeSendForm(id: 2, title: "Medium damage"),
  TypeSendForm(id: 3, title: "Low damage"),
];
