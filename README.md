# PruebaOrangeBank

Se ha seguido un patron de diseño MVVM respetando Clean Architecture dónde la app está dividida en las capas (Data, Domain, Vista)

Las capas de data y dominio se han implementado como frameworks independiendtes debido a que de esta forma ya que obliga y ayuda al desarrollador a tener las distintas lógicas correctamente situadas.

Se ha utilizado RxSwift debido a la comodidad para la gestión de hilos, aunque debido a la experiencia en proyectos anteriores no se utiliza para los componentes de la vista.

TODO:
No se han implementado ni dialogos, ni spinners de carga, ni tampoco se hace un control de los errores.
En cuanto a diseño no ha sido la principal prioridad a la hora de crear esta pequeña app, lo cual es bastante mejorable.
