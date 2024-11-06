In `build.yaml`:

```yaml
targets:
  $default:
    builders:
      json_serializable:
        options:
          # Options configure how source code is generated for every
          # `@JsonSerializable`-annotated class in the package.
          #
          # The default value for each is listed.
          any_map: false
          checked: false
          constructor: ""
          create_factory: true
          create_to_json: true
          disallow_unrecognized_keys: false
          explicit_to_json: true
          field_rename: snake
          generic_argument_factories: false
          ignore_unannotated: false
          include_if_null: true
```

The `build.yaml` is designed to ensure that JSON serialization is consistent with naming conventions. This setup is especially useful for generating the necessary boilerplate code, making it easier to work with JSON data in Dart.

To Create `YourModel`, create a class with @JsonSerializable() and extends with `BaseModel`. Then generate the `your_model.g.dart` file by running command:

```bash
dart run build_runner build -d
```

### References:
- `build.yaml`: [![json_serializable](https://img.shields.io/pub/v/json_serializable.svg)](https://pub.dev/packages/json_serializable)
