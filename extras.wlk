import wollok.game.*
import comidas.*
import pepita.*

object muro1 {
    var property imagen = "muro.png"
    method image() = imagen
    method position() = game.at(2, 0)
}
object muro2 {
    var property imagen = "muro.png"
    method image() = imagen
    method position() = game.at(2, 1)
}
object muro3 {
    var property imagen = "muro.png"
    method image() = imagen
    method position() = game.at(2, 2)
}

object nido {
  var property imagen = "nido.png"
  method image() = imagen
  method position() = game.at(10,8)

}