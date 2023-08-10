# Table of contents
- [Table of contents](#table-of-contents)
- [Riverpod guide](#riverpod-guide)
- [Before start development](#before-start-development)
  - [Git Hooks](#git-hooks)
- [Development guideline](#development-guideline)
  - [Naming](#naming)
  - [Application structure](#application-structure)

# Riverpod guide

Pilot project to take-off with Riverpod base code

# Before start development

## Git Hooks
Make sure to activate `git_hooks` in shell
```
pub global activate git_hooks
```
Now, We can let the `git_hooks` bring into effect
```
git_hooks create bin/git_hooks.dart
```
Every commit should then be reviewed and sorted before committing to further push the code to the remote.

# Development guideline

## Naming

1. Libraries, packages, directories and source file names


`snake_case(lowercase_with_underscores).`
```dart
❌ Do not
- homeScreen.dart
- home-screen.dart
- HomeScreen.dart
- Home_Screen.dart

✅ Do
- home_screen.dart
- primary_button.dart
- button.dart

```

2. Classes, enums, typedefs and extensions

`UpperCamelCase`
```dart
❌ Do not
class homeScreen { ... }
enum Producttype { .. } // Doable but should not, for clearly each word
typedef predicate<T> = bool Function(T value);
extension items<T> on List<T> { ... }


✅ Do
class HomeScreen { ... }
enum ProductType { .. }
typedef Predicate<T> = bool Function(T value);
extension Items<T> on List<T> { ... }
```

3. Please always specify types for class member

avoid using `var` when possible
```dart
❌ Do not
var name = "Eric"; // This type still dynamic. and may mislead assign value.
final manualInput = 8; // However even initialized as int and cannot assign new value. 

✅ Do
String firstName = "John";
final List<String> fruits = ["apple", "banana", "kiwi"]
```

## Application structure

1. **Presentation Layer:**

    This layer is responsible for the user interface and interaction.
    Contains Flutter widgets, screens, and views.
    Handles UI rendering, user input, and visual components.

2. **Application Layer:**

    Orchestrates the use cases and interactions between the UI and domain.
    Translates user actions into meaningful commands for the domain.
    Contains application-specific logic. 

    **But** in Riverpod we use provider as a bridge the gap between presentation and domain. And can be thought of as encapsulating specific application-level logic. which is responsible for managing asynchronous operations, data fetching, and handling the flow of data to and from the domain and presentation layers.

3. **Domain Layer:**

    Represents the core business logic and rules.
    Contains entities, aggregates, value objects, and domain services.
    Is the heart of your application and should be independent of frameworks.

4. **Infrastructure Layer:**

    Deals with data storage, external APIs, and third-party integrations.
    Implements repositories, data sources, and external services.
    Connects the application to the outside world.

5. **Shared Layer**:

    Contains code that is shared across different layers and modules.
    Includes constants, utilities, extensions, and possibly base classes.

```
lib/
|-- presentation/
|   |-- auth/
|   |   |-- screens/
|   |   |-- widgets/
|   |
|   |-- other_feature/
|   |   |-- screens/
|   |   |-- widgets/
|   |
|   |-- main.dart
|
|-- application/
|   |-- auth/
|   |   |-- some_provider/
|   |
|   |-- other_feature/
|   |   |-- some_provider/
|   |
|   |-- config/
|   |   |-- network/
|
|-- domain/
|   |-- auth/
|   |   |-- entities
|   |   |-- value_objects
|   |   |-- repositories
|   |
|   |-- other_feature/
|   |   |-- entities
|   |   |-- value_objects
|   |   |-- repositories
|
|-- infrastructure/
|   |-- auth/
|   |   |-- data_sources
|   |   |-- repositories
|   |   |-- external_services
|   |
|   |-- other_feature/
|   |   |-- data_sources
|   |   |-- repositories
|   |   |-- external_services
|
|-- shared/
|   |-- constants/
|   |-- utilities/
|   |-- extensions/
|
|-- main.dart
```