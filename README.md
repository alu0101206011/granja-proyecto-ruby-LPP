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

# Módulo Funcion
Módulo para representar las funcionalidades de una granja mediante un módulo.

## Constantes
- JAULA = :jaula Es un símbolo para representar el sistema de gestión en jaula
- CAMPO_ABIERTO = :campo_abierto Es un símbolo para representar el sistema de gestión en campo abierto

## Procedimientos
- self.cuidados

Recorremos al grupo de animales sumandoles el valor y devolviendo una copia.

Podemos hacer esto gracias a la sobrecarga del operador suma que se encuentra en Ganado.

```ruby
def self.cuidados (cantidad_antibiotico, grupo)
  return grupo.map {|ganado| ganado + cantidad_antibiotico }
end
```

- self.reproduccion

```ruby
def self.reproduccion (dias, grupo)
  return grupo.select { |ganado| ganado.edad >= dias }
end
```
Es un procedimiento para establecer la reproducción de los animales.

En este procedimiento se comparan los días con la edad del ganado.

```ruby
module Farm
  module Funcion
    CONDICIONES_VIDA = ["campo abierto", "establo"]
    JAULA = :jaula
    CAMPO_ABIERTO = :campo_abierto
    def self.cuidados (cantidad_antibiotico, grupo)
      return grupo.map {|ganado| ganado + cantidad_antibiotico }
    end
    def self.reproduccion (dias, grupo)
      return grupo.select { |ganado| ganado.edad >= dias }
    end
  end
end
```

- self.bienestar

Procedimiento creado para calcular el indice de bienestar animal.

Se realiza con el siguiente planteamiento:
  1) Calcular todos los ratios de peso/edad de los animales de una granja y dividirlo por el número de animales de la misma. 
  2) Calcular el máximo de los ratios de peso/edad de los animales de una granja.
  3) Utilizar el máximo para calcular el índice de bienestar animal haciendo una proporción a 100 si es campo abierto y a 50 en caso contrario.

```ruby
def self.bienestar (ganado, condicion)
  array_ratios = ganado.censo.collect { |animal| animal.peso / animal.edad }
  mediaRatios = (array_ratios.reduce (:+)) / ganado.numero_animales
  maxRatio = array_ratios.max_by { |ratio| ratio }
  mediaRatios * (condicion == :campo_abierto ? 100 : 50) / maxRatio # Si el maximo de los ratios es (100 | 50), la media de ellos es x
end
```

- self.beneficio

Procedimiento creado para calcular el indice de beneficio neto animal.

Se realiza con el siguiente planteamiento:
  * Calcular todos los ratios en función del precio de venta, donde si los animales tienen como destino el sacrificio, el índice se calculará además
  en función de la media del peso, en otro caso, se usará el de edad y precio de venta.
   de los animales de una granja y dividirlo por el número de animales de la misma. 


```ruby
def self.beneficio (ganado)
  arrayPeso = ganado.censo.collect do |i| 
    (ganado.destino == "sacrificio" ? i.peso : i.edad) / ganado.precio_venta
  end
  mediaPeso = (arrayPeso.reduce (:+)) /ganado.numero_animales
  mediaPeso * 100 / arrayPeso.max
end
```


- self.productividad

Es un procedimiento para calcular el índice de productividad, para ello se realiza lo siguiente:
  * Para calcular el indice de productividad basandonos en los niveles de bienestar se ha realizado un operador ternario donde:
    * Si el indice de bienestar es >= que 80 el indice de productividad es 3.
    * Si el indice de bienestar está entre 20 y 80 el índice de productividad es 2.
    * Si el indice de bienestar no coincide con lo anterior, el índice de productividad es 1.

  * Para calcular el indice de productividad basandonos en los niveles de beneficio se ha realizado un operador ternario donde:
    * Si el indice de beneficio es > que 50 el indice de productividad es 3.
    * Si el indice de beneficio está entre, ambos inclusive, 10 y 50 el índice de productividad es 2.
    * Si el indice de beneficio no coincide con lo anterior, el índice de productividad es 1.

Luego hacemos la media entre los dos y truncamos el resultado para que sea un índice sin decimales y sin redondeo.
    

```ruby
def self.productividad(ganado, condicion)
  indice_bienestar = bienestar(ganado, condicion) >= 80 ? 3 : bienestar(ganado, condicion) > 20 && bienestar(ganado, condicion) < 80 ? 2 : 1
  indice_beneficio = beneficio(ganado) > 50 ? 3 : beneficio(ganado) >= 10 && beneficio(ganado) <= 50 ? 2 : 1
  ((indice_bienestar + indice_beneficio) / 2).truncate(0)
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

# Clase Ganadera
Clase heredada de datos para representar los datos de una granja ganadera.

## Atributos de instancia 
- tipo_ganado: Contiene el tipo de ganado que se encuentra en la granja (bovino, ovino, caprino o porcino).
- destino: Contiene el destino del animal (leche, sacrificio).
- numero_animales: Contiene el numero de animales de la granja
- precio_unitario: Contiene el precio unitario de los animales.
- precio_venta: Contiene el precio de venta de los animales
- censo: Contiene los animales de la granja. Es un array de tipo Ganado.

```ruby
module Farm
  class Ganadera < Datos
    attr_reader :tipo_ganado, :destino, :numero_animales, :precio_unitario, :precio_venta, :censo

    def initialize(id, nombre, tipo, descripcion, tipo_ganado, destino, numero_animales, precio_unitario, precio_venta, censo) 
      super(id, nombre, tipo, descripcion)
      @tipo_ganado = tipo_ganado
      @destino = destino
      @numero_animales = numero_animales
      @precio_unitario = precio_unitario
      @precio_venta = precio_venta
      @censo = censo
    end
  end
end
```

## Métodos de instancia

### Método to_s
Método para obtener una cadena con la información de la granja ganadera correctamente formateada.

```ruby
def to_s 
  s = super + "\nTipo de ganado: #{@tipo_ganado}\nDestino: #{@destino}\nNúmero de animales: #{@numero_animales}\nPrecio unitario: #{@precio_unitario}\nPrecio de venta: #{@precio_venta}\nCenso: [animal id: #{censo[0].id}"
  copycenso = @censo
  copycenso.drop(1).each { |element| s += ", animal id: #{element.id}" }
  s += "]"
end
```
En este método lo más destacable es el censo, donde se muestra el id de los animales que son introducidos en la granja.

## Módulo enumerable
La clase Ganadera para que sea enumerable se necesitan los siguientes pasos:

- Incluirlo
```ruby
include Enumerable
``` 

- Método each
```ruby
def each
  yield @numero_animales
  yield @precio_unitario
  yield @precio_venta
end
```

## Módulo Comparable
La clase Ganadera para que sea enumerable se necesitan los siguientes pasos:

- Incluirlo
```ruby
include Comparable
``` 

- Método <=>
```ruby
def <=>(other)
  return @edad <=> other.edad
end

def +(valor)
  return Ganado.new(@id, @edad + valor, @sexo, @peso, @raza, @aprovechamiento, @alimentacion)
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
  return @edad <=> edad.peso
end
```

### +
Sobrecarga del operador + de objeto más un valor en la que se devuleve una copia de un objeto Ganado.

```ruby
def +(valor)
  return Ganado.new(@id, @edad + valor, @sexo, @peso, @raza, @aprovechamiento, @alimentacion)
end
```





