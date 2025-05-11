object knightRider {
    method peso() = 500
    method nivelDePeligrosidad() = 10
    method bulto() = 1
    method cambiar(){}
    
}

object bumblebee {
    var estaComoAuto = true
    method estacomoAuto() = estaComoAuto
    method transformarseEnRobot() {estaComoAuto = false}
    method transformarseEnAuto() {estaComoAuto = true}
    method peso()= 800
    method nivelDePeligrosidad() = if(estaComoAuto) 15 else 30
    method bulto() = 2
    method cambiar() {self.transformarseEnRobot()}
}

object paqueteLadrillos{
    var cantidadDeLadrillos = 0
    method cantidadDeLadrillos(unaCantidad) {cantidadDeLadrillos = unaCantidad} 
    method peso() = cantidadDeLadrillos * 2
    method nivelDePeligrosidad() = 2
    method bulto() = if(cantidadDeLadrillos <= 100) 1
                    else if (cantidadDeLadrillos.between(101, 300)) 2
                    else 3
    method cambiar(){cantidadDeLadrillos += 12}
}

object arena{
    var property peso = 0 // implementando el property puedo omitir escribir los metodos getter y setter que son obligatorios
    //method peso(unPeso) {peso = unPeso}
    //method peso() = peso
    method nivelDePeligrosidad() = 1
    method bulto() = 1
    method cambiar() {peso = (peso-10).max (0)}   
    

}

object bateria {
    var estaConLosMisiles = true
    method cargarMisiles() {estaConLosMisiles = true} 
    method descargarMisiles() {estaConLosMisiles = false} 
    method peso() = if(estaConLosMisiles) 300 else 200
    method nivelDePeligrosidad() = if(estaConLosMisiles) 100 else 0 
    method bulto() = if(estaConLosMisiles) 2 else 1
    method cambiar() {self.cargarMisiles()}
}

object residuosRadiactivos {
    var property peso = 0
    method nivelDePeligrosidad() = 200
    method bulto() = 1
    method cambiar() {peso += 15}

}

object contenedorPortuario{
    const cosas = []
    method agregarAlContenedor(unaCosa){cosas.add(unaCosa)}
    method quitarAlContenedor(unaCosa){cosas.remove(unaCosa)}
    method peso() = 100 + cosas.sum({c => c.peso()})
    method nivelDePeligrosidad() = if(cosas.isEmpty()) 0 else cosas.max({c => c.nivelDePeligrosidad()}).nivelDePeligrosidad()
    method bultos() = 1 + cosas.sum({c=>c.bulto()})
    method cambiar() {cosas.forEach({c=>c.cambiar()})}
}

object embalaje {
    var property cosaEnvuelta = arena
    method peso() = cosaEnvuelta.peso()
    method nivelDePeligrosidad() = cosaEnvuelta.nivelDePeligrosidad()/2
    method bulto() = 2
    method cambiar() {}
}