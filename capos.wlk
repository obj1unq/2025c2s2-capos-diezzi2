object rolando {
    const mochila              = #{}
    var hogar                  = castillo
    var capacidadMaximaMochila = 2

    method agrandarMochila(nuevaCapacidad) {
        capacidadMaximaMochila = nuevaCapacidad
    }

    method recolectar(artefacto) {
    if (capacidadMaximaMochila > mochila.size()) {
        mochila.add(artefacto)
        }
    }

    method llegarAlCastillo() {
        hogar.dejarArtefactos(mochila)
        mochila.clear()
    }

    method posee(artefacto) = self.posesiones().contains(artefacto)

    method posesiones() {
        return mochila.union(hogar.artefactos())
    }

    // getter

    method mochila() = mochila 
}

object castillo {
    var property artefactos = #{}

    method dejarArtefactos(listaDeArtefactos) {
        artefactos.addAll(listaDeArtefactos)
    }
}

// ARTEFACTOS

object espadaDelDestino {
  
}

object libroDeHechizos {
  
}

object collarDivino {
  
}

object armaduraDeAceroValyrio {
  
}