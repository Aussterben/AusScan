# AusScan.sh

Herramienta de escaneo de red y fuzzing en Bash — *By Aussterben*

## Descripción

AusScan.sh es un script en Bash que combina utilidades básicas de
reconocimiento de red (escaneo de puertos, descubrimiento de IPs) con
un módulo de fuzzing web sobre parámetros de URL.

## Instalación

```bash
chmod +x AusScan.sh
```

## Uso

### Redes

| Opción     | Descripción                                           |
|------------|--------------------------------------------------------|
| `-ap`      | Escanea todos los puertos de una IP indicada           |
| `-p`       | Escanea un único puerto de una IP indicada              |
| `-ips`     | Escanea IPs activas en el rango `192.168.0.x`           |
| `-ip`      | Comprueba si una IP concreta está activa                |
| `--aips`   | Escanea IPs activas en todo el rango `192.168.x.x`      |

### Fuzzing

| Opción            | Descripción                                                                 |
|-------------------|-------------------------------------------------------------------------------|
| `-w <wordlist>`   | Ruta al archivo de wordlist a usar                                            |
| `-u <url>`        | URL objetivo. Debe contener la palabra `FUZZ` como marcador de sustitución    |
| `-c <códigos>`    | *(Opcional)* Filtra resultados por código(s) HTTP separados por comas         |

Si no se indica `-c`, se muestra todo excepto los `404`.

### Ejemplos

```bash
./AusScan.sh -ap
./AusScan.sh -w wordlist.txt -u "http://ejemplo.com/FUZZ"
./AusScan.sh -u "http://ejemplo.com/FUZZ" -w wordlist.txt -c 200,301
```

Los parámetros de fuzzing (`-w`, `-u`, `-c`) pueden indicarse en
cualquier orden. El script valida que cada uno tenga un valor no
vacío y con formato correcto antes de ejecutar nada.

## ⚠️ Aviso legal

Este software se proporciona **únicamente con fines educativos y de
investigación** en materia de seguridad informática.

El uso de esta herramienta para escanear puertos, descubrir hosts o
realizar fuzzing contra redes, sistemas, dominios o URLs sobre los
que el usuario **no tenga autorización expresa y por escrito** del
propietario está estrictamente prohibido y puede constituir un
delito según la legislación vigente en tu país o jurisdicción (por
ejemplo, en España, los artículos 197 y 264 del Código Penal
relativos al acceso no autorizado a sistemas informáticos y a los
daños informáticos).

El autor de este script (**Aussterben**) y quien lo distribuya o
modifique **no se hacen responsables** del mal uso que terceros
puedan hacer de esta herramienta, ni de los daños directos o
indirectos, pérdidas de datos, sanciones administrativas o
consecuencias legales que pudieran derivarse de su uso indebido.

Al ejecutar este script, el usuario declara que:

1. Cuenta con autorización explícita para probar los sistemas, redes
   o aplicaciones web objetivo (por ejemplo: su propio laboratorio,
   un entorno de pruebas propio, o un programa de Bug Bounty / pentest
   con alcance autorizado por escrito).
2. Asume toda la responsabilidad legal derivada del uso de esta
   herramienta.
3. Utilizará este script exclusivamente con fines de aprendizaje,
   auditoría de seguridad autorizada o investigación legítima.

**Si no cumples con las condiciones anteriores, no debes utilizar
este script.**

> Uso bajo tu propia responsabilidad.

## Licencia

Este script se distribuye "tal cual" (*as is*), sin garantía de
ningún tipo, expresa o implícita, incluyendo pero no limitado a
garantías de idoneidad para un propósito particular.
