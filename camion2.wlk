object camion {
const cosasDelCamion = []

method cargar(unaCosa){cosasDelCamion.add(unaCosa).cambiar()}
method descargar(unaCosa) {cosasDelCamion.remove(unaCosa)}
method pesoTotal() = 1000 + cosasDelCamion.sum({c => c.peso()})
method pesosDeCosasEsPar() = cosasDelCamion.all({c => c.peso().even()}) // el even es para saber si es par. Si quiero saber si es impar utilizo .odd()
method hayUnaCosaConPeso(unPeso) = cosasDelCamion.any({c => c.peso() == unPeso})
method cosaConPeligrosidad(unNivel) = cosasDelCamion.find({c => c.nivelDePeligrosidad() == unNivel})
method cosasConPeligrosidad(unNivel) = cosasDelCamion.filter({c => c.nivelDePeligrosidad() > unNivel})
method cosasConMasPeligrosidadQue(unaCosa) = cosasDelCamion.filter({c=>c.nivelDePeligrosidad() > unaCosa.nivelDePeligrosidad()})
// otra forma muy buena para resolver como el metodo de arriba method cosasConMasPeligrosidadQueBis(unaCosa) = self.cosasConPeligrosidad(unaCosa.nivelDePeligrosidad())
method estaExcedidoDePeso() = self.pesoTotal() > 2500
method puedeCircular(unNivel) {
    return
        not self.estaExcedidoDePeso() and
            self.cosasConPeligrosidad(unNivel).isEmpty()
} 
method cosaMasPesada() = cosasDelCamion.max({c=>c.peso()})
method tieneCosaConPesoEntre(unPeso,otroPeso) = cosasDelCamion.any({c=>c.peso().between(unPeso, otroPeso)})
method cantidadDeBultosCargados() = cosasDelCamion.sum({c=>c.bulto()})

}