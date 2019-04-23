# Data Serialisation

The stub needs to serialise input parameters to a remote method call. Dispatcher needs to deserialise input paramters to invoke remote obj.

Java provides simple means for object serialisation

```java
import java.io.Serializable;
public class MyClass implements Serializable { ... }
```

Compiler generates bytecode to handle serialisation.

We can use serialisation to create mobile code:

* Client sends message obj. to server that contains behaviour
* Server calls method on received obj. to execute behaviour
* Message obj. may then be sent back or to the next server

With serialisation, we're passing a copy of the whole object, not just a copy of the reference to that object. We can do that if the reference is to a remote object.

We can create custom serialisation to produce serialised data in a language-independent format. One example of a format to use in JSON. We can use JSON in conjunction with GSON, a Google-developed Java library to create JSON objects.

JSON can be extended with JSON for Linked Data (JSON-LD). It has a common schema, with attribute-value pairs. It is W3C recommended. Use of common schemas and ontologies provides some meaning to shared data. We can describe things, rule/policies, etc.