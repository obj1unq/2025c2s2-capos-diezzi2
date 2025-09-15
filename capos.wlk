object rolando {
    var property mochila                          = #{}
    var hogar                                     = castillo
    var capacidadMaximaMochila                    = 2
    var property historialDeArtefactosEncontrados = []
    var property poderBase                        = 5

    method recolectar(artefacto) {
        historialDeArtefactosEncontrados.add(artefacto)
        if (capacidadMaximaMochila > mochila.size()) {
            mochila.add(artefacto)
            }
    }

    method llegarAlCastillo() {
        hogar.dejarArtefactos(mochila)
        mochila.clear()
    }

    method posee(artefacto) = self.posesiones().contains(artefacto)

    method posesiones() = mochila.union(hogar.artefactos())

    method poderDePelea() = poderBase + mochila.sum({artefacto => artefacto.poderDePelea(self)})

    method batallar() {
        mochila.forEach({artefacto => artefacto.usar()})
        poderBase += 1
    }

    // setter

    method capacidadMaximaMochila(nuevaCapacidad) {
      capacidadMaximaMochila = nuevaCapacidad
    }

    method hogar(_hogar) {
        hogar = _hogar
    }
}

object castillo {
    var property artefactos = #{}

    method dejarArtefactos(listaDeArtefactos) {
        artefactos.addAll(listaDeArtefactos)
    }
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