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

- vida: Atributo que representa las condiciones de vida de los animales.