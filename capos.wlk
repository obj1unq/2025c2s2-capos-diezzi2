object rolando {
    var property mochila                          = #{}
    var hogar                                     = castilloDePiedra
    var capacidadMaximaMochila                    = 2
    var property historialDeArtefactosEncontrados = []
    var property poderBase                        = 5
    var enemigos                                  = #{caterina, archibaldo, astra}

    // 1.1 y 1.4

    method recolectar(artefacto) {
        historialDeArtefactosEncontrados.add(artefacto)
        if (capacidadMaximaMochila > mochila.size()) {
            mochila.add(artefacto)
            }
    }

    // 1.2

    method llegarAlCastillo() {
        hogar.dejarArtefactos(mochila)
        mochila.clear()
    }

    // 1.3

    method posee(artefacto) = self.posesiones().contains(artefacto)

    method posesiones() = mochila.union(hogar.artefactos())

    // 2.1

    method poderDePelea() = poderBase + mochila.sum({artefacto => artefacto.poderDePelea(self)})

    method batallar() {
        mochila.forEach({artefacto => artefacto.usar()})
        poderBase += 1
    }

    // 2.2

    method artefactoMasPoderosoGuardado(portador) = hogar.artefactoMasPoderoso(portador)

    // 2.3

    method enemigosQuePuedeVencer() {
        return enemigos.filter({enemigo => enemigo.poderBase() < self.poderDePelea()})
    }
    
    method hogaresQuePuedeConquistar() {
        return self.enemigosQuePuedeVencer().map({enemigo => enemigo.hogar()})
    }

    // 2.4

    method esPoderoso() = enemigos == self.enemigosQuePuedeVencer()

    // 2.5

    method poseeUnArtefactoFatal() {
      
    }

    method artefactoFatal() {
      
    }

    // setter

    method capacidadMaximaMochila(nuevaCapacidad) {
      capacidadMaximaMochila = nuevaCapacidad
    }

    method hogar(_hogar) {
        hogar = _hogar
    }
}

// ENEMIGOS

object caterina {
    var hogar     = fortalezaDeAcero
    var poderBase = 28

    // getter

    method hogar() = hogar

    method poderBase() = poderBase
}

object archibaldo {
    var hogar     = palacioDeMarmol
    var poderBase = 16


    // getter

    method hogar() = hogar

    method poderBase() = poderBase 
}

object astra {
    var hogar     = torreDeMarfil
    var poderBase = 14


    // getter

    method hogar() = hogar

    method poderBase() = poderBase
}

// CASAS

object castilloDePiedra {
    var property artefactos = #{}

    method dejarArtefactos(listaDeArtefactos) {
        artefactos.addAll(listaDeArtefactos)
    }

    method artefactoMasPoderoso(portador) {
        return artefactos.max({artefacto => artefacto.poderDePelea(portador)})
    }
}

object fortalezaDeAcero {
  
}

object palacioDeMarmol {
  
}

object torreDeMarfil {
  
}

// ARTEFACTOS

object espadaDelDestino {
    var cantidadDeUsos = 0

    method poderDePelea(portador) { 
        return if (cantidadDeUsos > 0) {
            portador.poderBase() * 0.5
        }
        else portador.poderBase()
    }

    method usar() {
        cantidadDeUsos += 1
    }
}

object libroDeHechizos {
    var cantidadDeUsos = 0
    var hechizos = []

    method poderDePelea(portador) {
        return if (not(hechizos.isEmpty())) {
            hechizos.first().poderDePelea(portador)
        }
        else 0
    }

    method usar() {
        cantidadDeUsos += 1
        if (not(hechizos.isEmpty())) {
            hechizos.remove(hechizos.first())
        }
    }

    // setter

    method hechizos(_hechizos) {
        hechizos = _hechizos
    }
}

object collarDivino {
    var cantidadDeUsos = 0
    var poderBase      = 3

    method poderDePelea(portador) { 
        return if (portador.poderBase() > 6) {
            poderBase + 1 * cantidadDeUsos
        }
        else poderBase
    }

    method usar() {
        cantidadDeUsos += 1
    }
}

object armaduraDeAceroValyrio {
    var cantidadDeUsos = 0
    var poderBase      = 6

    method poderDePelea(portador) = poderBase

    method usar() {
        cantidadDeUsos += 1
    }
}

// HECHIZOS

object bendicion {
    var poderBase = 4

    method poderDePelea(portador) = poderBase
}

object invisivilidad {
    method poderDePelea(portador) = portador.poderBase()
}

object invocacion {
    method poderDePelea(portador) = portador.artefactoMasPoderosoGuardado(portador).poderDePelea(portador) 
}