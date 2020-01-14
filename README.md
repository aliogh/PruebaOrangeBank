# PruebaOrangeBank


Arquitectura: MVVM 
Se ha segui un patron Clean donde la app esta dividida en 3 capas (Data, Domain, Vista)
Las capas de data y dominio se han implementado como frameworks independiendtes debido a que de esta forma a parte de que obliga y ayuda al desarrollador a tener las distintas logicas correctamente ordenadas.

Se ha utilizado RxSwift debido a la comodidad para la gestion de hilos, aunque debido a la experiencia en proyectos anteriores no se utiliza para los componentes de la vista.

TODO:
No se han implementado ni dialogos, ni spinners de carga, ni tampoco se hace un correcto control de los errores.
