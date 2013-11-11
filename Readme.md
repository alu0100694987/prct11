Cristo González Rodríguez
Juvenal Santiso Hernández

Grupo 07 - Turno de mañana

====> Práctica 9 <====

 -> Repositorio Inicial

  - Fichero "Rake", con las tareas de ayuda de Bundler, preparado para poder trabajar con la herramienta de integración continua "Travis".
  - Fichero ".travis.yml" con las versiones/implementaciones de Ruby en las que se va a testear.
  - Fichero "Gemfile" que controla las dependencias de las gemas utilizadas (gestionadas a través del fichero con extension ".gemspec").
  - Fichero "Guardfile" para trabajar con la herramienta de comprobación continua "Guard".
  - Fichero "matrices.gemspec", plantilla para la creación de nuestra gema, con la información requerida, y las dependencias de gemas para "Gemfile".

  - Se incluyen los ficheros "lib/fraccion.rb", "lib/mcd.rb", "lib/matrices.rb" (anterior clase Matriz), que contienen las implementaciones de las anteriores prácticas.
  - Se incluyen los ficheros de definición de espectativas "spec/fraccion_spec.rb" (para "fraccion.rb"), y "spec/matrices_spec.rb" (para "matrices.rb"), con las espectativas para la antigua clase Matriz.
  - Se incluye el fichero "tc_matrices.rb" vacío, para la posterior definición de pruebas unitarias.
  
 -> Definición de espectativas "spec/fraccion_spec.rb"
 
  - Se definen las espectativas para la creación de matrices dispersas y densas, y la realización de operaciones con las mismas
