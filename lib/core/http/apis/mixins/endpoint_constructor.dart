mixin EndpointConstructor {
  String get path;

  String fetchOneUrl({
    String? id,
    bool collection = true,
  }) {
    bool resource = !collection;

    if (resource) assert(id == null);
    if (collection) assert(id != null);

    return [
      path,
      if (collection) id,
    ].join('/');
  }

  String fetchAllUrl() {
    return [
      path,
    ].join('/');
  }

  String updatelUrl({
    String? id,
    bool collection = true,
  }) {
    bool resource = !collection;

    if (resource) assert(id == null);
    if (collection) assert(id != null);

    return [
      path,
      if (collection) id,
    ].join('/');
  }

  String deletelUrl({
    String? id,
    bool collection = true,
  }) {
    bool resource = !collection;

    if (resource) assert(id == null);
    if (collection) assert(id != null);

    return [
      path,
      if (collection) id,
    ].join('/');
  }

  String createUrl() {
    return [
      path,
    ].join('/');
  }
}
