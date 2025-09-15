object rolando {
    const mochila        = #{}
    var capacidadMochila = 2

    method agrandarMochila(nuevaCapacidad) {
        capacidadMochila = nuevaCapacidad
    }

    method recolectar(artefacto) {
    if (capacidadMochila > mochila.size()) {
        mochila.add(artefacto)
        }
    }

    method llegarAlCastillo() {
        castillo.dejarArtefactos(mochila)
        mochila.clear()
    }

    method posee(artefacto) = self.posesiones().contains(artefacto) 

    method posesiones() {
        return mochila.union(castillo.artefactos())
    }

    // getter

    method mochila() = mochila 
}

object castillo {
    const property artefactos = #{}

    method dejarArtefactos(listaDeArtefactos) {
        artefactos.addAll(listaDeArtefactos)
    }

    // setter

    method artefactos(listaDeArtefactos) {
     // artefactos = listaDeArtefactos
    }

    // getter

    method artefactos() = artefactos 
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