import wollok.game.*
import comidas.*
import extras.*


// -------------------- PEPITA -----------------------
object pepita {
	var energia = 500
	var property position = game.origin()
	var imagen =  "pepita.png" 
	var capturada = false
	const property obstaculos = [muro1, muro2, muro3] 
	method energia() {return energia}
	method position() {return position}
	method image() {return imagen}


	method comer(comida) { 
		energia = energia + comida.energiaQueOtorga()
	}
	method volar(kms) {
		energia = energia - 8 - kms 
	}
	method puedeVolar(){
		return energia >= 9
	}
	method derecha() {
		if (position.x() < game.width() - 2){
			self.intentarVolar( position.right(1) , "pepita-derecha.png")
		}
	}
	method izquierda() {
		if (position.x() > 0){ 
			self.intentarVolar( position.left(1) , "pepita-izquierda.png")
		}
	}
	method subir() {
		if (position.y() < game.height() - 2){ 
			self.intentarVolar(position.up(1), imagen)
		}
	}
	method bajar() {
		if (position.y() > 0){
			self.intentarVolar(position.down(1), imagen)
		}
	}

	method hayMuroEn(posicion) {
    	return obstaculos.any { unMuro => unMuro.position() == posicion }
	}

	method intentarVolar(direccion, imagenVolando) {
		if (self.puedeVolar() && not self.hayMuroEn(direccion)) {
			self.volar(1)
			imagen = imagenVolando
			position = direccion
		} else if (self.hayMuroEn(direccion)) {
			game.say(self, "¡Hay un muro!")
		} else {
			game.say(self, "Me quedé sin energía")
			imagen = "pepita-gris.png"
			game.stop()
		}

	}
	method bajarPorGravedad() {
		if (not capturada && position.y() > 0 && not self.hayMuroEn(position.down(1))) {
			position = position.down(1)
			self.image()
		}
	}
	method capturada(objeto) {
		if (self.position() == objeto.position()) {
			capturada = true
			imagen = "pepita-gris.png"
		}
	}


	method llegarAlNido(meta) {
		return self.position() == meta.position()
	}
}


//------------------------ SILVESTRE -------------------------------

object silvestre {
	var property position = game.at(3, 0)
	var property imagen = "silvestre.png"
	var property objetivo = pepita
		
	method image() {return imagen }
	method position() {return position}
	
	method  derecha() {
		position = position.right(1)
	}
	method izquierda() {
		position = position.left(1)
	}

	method seguir() {
		if (objetivo.position().x() > position.x() && position.x() < game.width() - 1) {
			position = position.right(1)
		} else if (objetivo.position().x() < position.x() && position.x() > 3) {
			position = position.left(1)
		}
	}
}


