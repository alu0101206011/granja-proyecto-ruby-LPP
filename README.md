# Farm

¡Bienvenido a tu nueva gema! En este directorio, encontrará los archivos que necesita para poder empaquetar su biblioteca Ruby en una gema. Pon tu código Ruby en el archivo `lib/farm`. Para experimentar con ese código, ejecute `bin/console` para obtener un mensaje interactivo.

## Instalación

Agregue esta línea al Gemfile de su aplicación:

```ruby
gem 'farm'
```

Y luego ejecuta:

    $ bundle install

O instálalo tu mismo de la siguiente manera:

    $ gem install farm

## Desarrollo

Después de verificar el repositorio, ejecute `bin/setup` para instalar las dependencias. Luego, ejecute `rake spec` para ejecutar las pruebas. También puede ejecutar `bin/console` para obtener un mensaje interactivo que le permitirá experimentar.

Para instalar esta gema en su máquina local, ejecute `bundle exec rake install`. Para lanzar una nueva versión, actualice el número de versión en `version.rb`, y luego ejecute` bundle exec rake release`, que creará una etiqueta git para la versión, enviará git commits y etiquetas, y luego enviará el `.gem` archivo a [rubygems.org] (https://rubygems.org).

## Contribuciones

Los informes de errores y las pull requests son bienvenidos en GitHub en https://github.com/ULL-ESIT-LPP-2122/granja-alu0101206011.

# Clases de la gema

# Clase Funcion
Es una de las clases de la gema. Esta describirá las funcionalidades de la granja.

## Atributos

- vida: atributo que representa las condiciones de vida de los animales `(Excelente, Bien, Regular, Mal)`.
- cuidados: atributo para los tipos de cuidados de los animales `(Primarios, Especiales, Normales)`.
- reproduccion: atributo para la reproducción de los animales `(Vivíparos, Ovíparos, Ovovivíparos)`.

```ruby
module Farm
  class Funcion
    attr_reader :vida, :cuidados, :reproduccion
    def initialize(vida, cuidados, reproduccion)
      @vida = vida
      @cuidados = cuidados
      @reproduccion = reproduccion
    end
  end
end
```

## Métodos

### to_s
Método que transforma el objeto en un string.

```ruby
def to_s 
  return "Condiciones de vida: #{@vida}\nTipos de cuidados: #{@cuidados}\nReproducción: #{@reproduccion}"
end
```



# Clase Datos
Es una de las clases de la gema. Esta clase tiene como función el representar la granja propiamente dicha.

## Atributos

- id: atributo que contiene la identificación la granja.
- nombre: atributo que contiene el nombre de la granja.
- tipo: atributo que contiene el tipo de granja `(Tradicional, Comercial)`.
- descripcion: atributo que contiene una descripción de la granja.

```ruby
module Farm
  class Datos
    attr_reader :id, :nombre, :tipo, :descripcion
    def initialize(id, nombre, tipo, descripcion)
      @id = id
      @nombre = nombre
      @tipo = tipo
      @descripcion = descripcion
    end
  end
end
```

## Métodos

### to_s
Retorna una cadena con la información de la clase Datos correctamente formateada.

```ruby
def to_s
  return "Identificador de la granja: #{id}\nNombre de la granja: #{nombre}\nTipo de granja: #{tipo}\nDescripción: #{descripcion}"
end
```


# Clase Animal
Clase para representar animales.

## Atributos de instancia
- id: atributo que contiene el identificador del animal.
- edad: atributo para representar la edad del animal en días.
- sexo: atributo para representar el sexo del animal.
- peso: atributo para representar el peso del animal en gramos.

```ruby 
module Farm
  class Animal
    attr_reader :id, :edad, :sexo, :peso
    def initialize(id, edad, sexo, peso)
      @id = id
      @edad = edad
      @sexo = sexo
      @peso = peso
    end
  end
```

## Atributos de clase
- animal_count: atributo creado para contar el número de objetos que se han instanciadon de la clase.

```ruby 
module Farm
  class Animal
    attr_reader :id, :edad, :sexo, :peso

    @@animal_count = 0

    def initialize(id, edad, sexo, peso)
      @id = id
      @edad = edad
      @sexo = sexo
      @peso = peso
      @@animal_count += 1
    end
  end
```

## Métodos de instancia

### to_s
Retorna una cadena con la información de la clase Animal correctamente formateada

```ruby
def to_s
  return "Animal con id: #{id}\nEdad (días): #{edad}\nSexo: #{sexo}\nPeso (gramos): #{peso}"
end
```

### <=>
Método usando el módulo comparable usado para poder comparar a los animales por su peso.

```ruby
def <=>(other)
  return peso <=> other.peso
end
```

## Métodos de clase

### self.animal_count
Como los atributos de clase no son visibles fuera de la clase, se necesita crear un método de clase animal_count que retorne el atributo de clase `@@animal_count`.

```ruby
def self.animal_count
  @@animal_count
end
```

# Ganado
Clase heredada de Animal creada para representar Ganado.

## Atributos
Esta clase contiene todos los atributos del padre (Animal)

Y a continuación contiene los siguientes atributos:
- raza: atributo para representar la raza del animal.
- aprovechamiento: atributo para representar el tipo de aprovechamiento (carne, piel, leche)
- alimentacion: atributo para representar el tipo de alimentación (hervívoro, omnívoro)

```ruby
module Farm
  class Ganado < Animal
    attr_reader :raza, :aprovechamiento, alimentacion
    def initialize(id, edad, sexo, peso, raza, aprovechamiento, alimentacion)
      super(id, edad, sexo, peso)
      @raza = raza
      @aprovechamiento = aprovechamiento
      @alimentacion = alimentacion
    end
  end
end
```

## Métodos

### to_s
Usando `super` desde el método to_s se está llamando al método to_s de la clase padre Animal, 
como este devuelve una string es tan fácil como concatenar esa salida con la nueva de ganado para que salga
toda la información formateada.

```ruby
def to_s 
  super + "\nGanado de raza: #{raza}\nTipo de aprovechamiento: #{aprovechamiento}\nTipo de alimentación #{alimentacion}"
end
```

### <=>
Método usando el módulo comparable usado para poder comparar al ganado por su edad.

```ruby
def <=>(other)
  return edad <=> edad.peso
end
```

# Module Funcion
Módulo para representar las funcionalidades de una granja mediante
un módulo.

```ruby
module Farm
  module Funcion
  end
end
```

## Constantes
```ruby
CONDICIONES_VIDA = ["campo abierto", "establo"]
```
Constante para representar las condiciones de vida (campo abierto, establo)


## Funciones
### cuidados
```ruby
def self.cuidados (estado)
  return estado
end
```

Es un procedimiento para establecer los cuidados de los animales.

Tiene que ser self para que sea propio del módulo.


### reproduccion
```ruby
def self.reproduccion (estado)
  return estado
end
```
Es un procedimiento para establecer la reproducción de los animales.

