enum KEY {
  LOGIN_DATA(false),
  CART(true),
  USER_MODEL(true);

  final bool needRemove;

  const KEY([this.needRemove = false]);
}
