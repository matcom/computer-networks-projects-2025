# Captive-Portal. 2do Proyecto de la Asignatura Redes de Computadoras, Curso 2025.

## Descripción:

Tal como describe su nombre, el objetivo del proyecto es la implementación de un portal cautivo. Un portal cautivo es una solución informática que permite el control de acceso a una red corporativa. Al incorporarse un dispositivo nuevo al a red, el ordenador que funge como portal bloquea cualquier tipo de comunicación fuera de la red local hasta que el usuario haya iniciado sesión o cumplido alguna prerrogativa de acceso a la red. Tras cumplir los requisitos de acceso, el usuario obtiene acceso fuera de su red local. 
Es importante destacar que el ordenador que implementa la funcionalidad de portal es también el gateway de la red sobre la cual opera.

Para la solución el proyecto, como es costumbre, no se puede emplear ningún tipo de biblioteca externa a la biblioteca estándar del lenguaje de programación empleado como solución. Se permite el empleo del cli del sistema operativo para la interacción con la red y control de acceso aprendidos en el curso. En particular los de trabajo con firewall.

## Requisitos Mínimos:

1. Endpoint http de inicio de sesión en la red 
2. Bloqueo de cualquier tipo de enrutamiento hasta no haber iniciado sesión en la red
3. Mecanismo de definición de cuentas de usuario
4. Empleo de hilos y/o procesos para el manejo de varios usuarios concurrentes
 

## Extras:

1. Detección automática del enlace http del portal cautivo en la red 1 pto
2. Capa de seguridad https válida, sobre la url del portal 0.5 puntos
3. Control de la suplantación de ips de usuarios que hayan iniciado sesión en la red. 0.5 puntos
4. Servicio de enmascaramiento ip sobre la red donde opera el portal cautivo. 0.25 puntos
5. Experiencia de usuario y diseño de la página web del portal. 0.25 puntos
6. Creatividad.
