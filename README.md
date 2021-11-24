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

## Clase Funcion
Es una de las clases de la gema. Esta describirá las funcionalidades de la granja.

### Atributos

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

## Clase Datos
Es una de las clases de la gema. Esta clase tiene como función el representar la granja propiamente dicha.

### Atributos

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