object galvan {
	var sueldo = 15000
	var dinero = 0
	var deuda = 0
	var tieneDeuda = false
	var tieneDinero = false
	
	method sueldo() { return sueldo }
	method sueldo(nuevoValor) { sueldo = nuevoValor }
	
	method cobrarSueldo(){
		var parcial = 0
		if(deuda>0){
		parcial = self.sueldo() - deuda
		if(parcial>0){
			deuda = 0
			tieneDeuda = false
		}
		else{
			deuda -= self.sueldo()
			dinero -= parcial
		}
		dinero += parcial
		if(dinero>0){
			tieneDinero = true
		}
		else{
			tieneDinero = false
		}
		}
		else{
		dinero += self.sueldo()
		}
	}
	
	method gastar(cuanto){
		var parcial
		dinero -= cuanto
		if(dinero<0){
			tieneDinero = false
			parcial = dinero
			deuda -= parcial
			dinero -= parcial
			tieneDeuda = true
		}
		else{
			tieneDinero = true
			tieneDeuda = false
		}
	}
	method totalDinero(){return dinero}
	
	method totalDeuda(){
		if(deuda >0){
			return deuda
		}
		else{
			return 'No hay deuda.'
		}
	}
	
	method tieneDeuda(){
		if(deuda>0){
			tieneDeuda = true
			return tieneDeuda
		}
		tieneDeuda = false
		return tieneDeuda
	}
	
	method tieneDinero(){
		if(dinero>0){
			tieneDinero = true
			return tieneDinero
		}
		tieneDinero = false
		return tieneDinero
	}
	
}


object baigorria {
	var cantidadEmpanadasVendidas = 100
	var montoPorEmpanada = 15
	var cobrado = 0
	
	method venderEmpanada() {cantidadEmpanadasVendidas += 1}
 	
	method sueldo() = cantidadEmpanadasVendidas * montoPorEmpanada
	
	method cobrarSueldo(){cobrado += self.sueldo()}
	method totalCobrado(){return cobrado}
}

object gimenez {
	var dinero = 300000
	method dinero() { return dinero }
	method pagarA( empleado ) {
		dinero -= empleado.sueldo()
		empleado.cobrarSueldo()
	}
}
