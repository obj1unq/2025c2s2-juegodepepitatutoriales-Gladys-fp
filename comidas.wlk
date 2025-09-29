//import wollok.game.*
import pepita.*


object manzana {
	const base= 5
	var madurez = 1

	var property imagen = "manzana.png"
	const property position = game.at(5, 9)
	method image() {return imagen}
	method position() {return position}

	method energiaQueOtorga() {
		return base * madurez	
	}
	method madurar() {
		madurez += 1
	}
//CORRECIONES
	method chocasteCon(objeto) {
		game.removeVisual(self)
		return objeto.comer(self)
	}

}

object alpiste {
	var property imagen = "alpiste.png"
	const property position = game.at(9, 3)
	method image() {return imagen}
	method position() {return position}

	method energiaQueOtorga() {
		return 20
	}
//CORRECIONES
	method chocasteCon(objeto) {
		game.removeVisual(self)
		return objeto.comer(self)
	}
}