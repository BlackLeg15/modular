# flutter_modular_test

Init Modules and test the integration

## Getting Started

Add in your pubspec.yaml

```yaml

dev_dependecies:
 modular_test:

```

## Using

### Start a Module

```dart

main(){
    setUp(){
        initModule(AppModule());
    }
}

```

### Start more then one Module

```dart

main(){
    setUp(){
        initModules([AppModule(), HomeModule(), PerfilModule()]);
    }
}

```

### Replace binds of Module

```dart

main(){

    final dioMock = DioMock();

    setUp(){
        initModule(AppModule(), replaceBinds: [
            Bind.instance<Dio>(dioMock),
        ]);
    }
}

```


