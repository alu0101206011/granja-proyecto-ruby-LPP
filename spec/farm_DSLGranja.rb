require 'spec_helper'
require './lib/farm/dslgranja'

granja_1 = Farm::DSLGranja.new(12345678) do
  datos "Pollos muertos",
  :descripcion => "PyME - Pequeña y mediana empresa",
  :tipo => :pollos
  ejemplar "12345678-00000001",
  :edad => 365,
  :peso => 700.2,
  :precio_compra => 4.25,
  :precio_venta => 4.75
  ejemplar "12345678-00000002",
  :edad => 465,
  :peso => 1200.2,
  :precio_compra => 1.25,
  :precio_venta => 2.75
end