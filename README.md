# Proyecto IPXE

#### Fuentes del proyecto ipxe sacadas del github de netboot.xyz (https://github.com/netbootxyz/ipxe.git)

#### Las fuentes originales están en https://github.com/ipxe/ipxe.githttps://git aunque hay muy poca diferencia entre ambas versiones.

#### Se incluye un pequeño instalador, según se necesiten para bios o para EFI, ya que ambos binarios necesitarán configuraciones diferentes e incompatibles.

#### Los comandos a usar para compilar ambas versiones son:

##### Para BIOS:

```bash
make bin/ipxe.pxe
```

##### Para EFI 64:

```bash
make bin-x86_64-efi/ipxe.efi

```

## Otros ejemplos para debug:

Para depurar iPXE y encontrar posibles fallos, puedes habilitar diferentes niveles de **debugging** durante la compilación, especificando qué componentes quieres depurar. iPXE soporta diferentes opciones de debug que puedes activar con la variable `DEBUG` al compilar.

Aquí tienes varias formas de compilar iPXE para **BIOS** y **UEFI 64-bit (x86_64)** con diferentes configuraciones de depuración:

###### 1. **Depuración de todo el sistema (Depuración Global)**

Este método activa la depuración para **todos los componentes** del sistema iPXE.

##### Para BIOS:

```bash
make bin/ipxe.pxe DEBUG=all
```

##### Para UEFI 64-bit:

```bash
make bin-x86_64-efi/ipxe.efi DEBUG=all
```

###### 2. **Depuración de DHCP y PXE**

Si estás tratando de depurar problemas de red o de arranque PXE, puedes habilitar específicamente los módulos de depuración de **DHCP** y **PXE**.

##### Para BIOS:

```bash
make bin/ipxe.pxe DEBUG=dhcp,pxe
```

##### Para UEFI 64-bit:

```bash
make bin-x86_64-efi/ipxe.efi DEBUG=dhcp,pxe
```

###### 3. **Depuración de la pila TCP/IP**

Si tienes problemas relacionados con la pila de red, puedes habilitar la depuración de **TCP** e **IP**.

##### Para BIOS:

```bash
make bin/ipxe.pxe DEBUG=tcp,ip
```

##### Para UEFI 64-bit:

```bash
make bin-x86_64-efi/ipxe.efi DEBUG=tcp,ip
```

###### 4. **Depuración de la carga de imágenes (IMG)**

Si el problema está relacionado con la carga de imágenes (ISO, kernels, etc.), puedes habilitar la depuración de los componentes relacionados con **IMG**.

##### Para BIOS:

```bash
make bin/ipxe.pxe DEBUG=img
```

##### Para UEFI 64-bit:

```bash
make bin-x86_64-efi/ipxe.efi DEBUG=img
```

###### 5. **Depuración del protocolo HTTPS**

Para problemas con conexiones seguras (HTTPS), puedes habilitar la depuración de **HTTPS** y **SSL**.

##### Para BIOS:

```bash
make bin/ipxe.pxe DEBUG=https,ssl
```

##### Para UEFI 64-bit:

```bash
make bin-x86_64-efi/ipxe.efi DEBUG=https,ssl
```

###### 6. **Depuración de todo el proceso de arranque**

Si sospechas que hay problemas con el arranque, puedes habilitar la depuración de los módulos de **arranque PXE** y **configuración**.

##### Para BIOS:

```bash
make bin/ipxe.pxe DEBUG=pxe,settings
```

##### Para UEFI 64-bit:

```bash
make bin-x86_64-efi/ipxe.efi DEBUG=pxe,settings
```

###### 7. **Combinación personalizada de múltiples depuraciones**

Puedes combinar varios tipos de depuración si deseas enfocarte en varios aspectos al mismo tiempo. Por ejemplo, depurar **TCP**, **DHCP** y **HTTP** juntos.

##### Para BIOS:

```bash
make bin/ipxe.pxe DEBUG=tcp,dhcp,http
```

##### Para UEFI 64-bit:

```bash
make bin-x86_64-efi/ipxe.efi DEBUG=tcp,dhcp,http
```

###### 8. **Depuración del hardware (NIC, PCI)**

Si sospechas problemas relacionados con el hardware de red o las interfaces PCI, habilita la depuración de **NIC** y **PCI**.

##### Para BIOS:

```bash
make bin/ipxe.pxe DEBUG=nic,pci
```

##### Para UEFI 64-bit:

```bash
make bin-x86_64-efi/ipxe.efi DEBUG=nic,pci
```

###### 9. **Depuración avanzada con registros detallados (debug general y específico)**

Si buscas un mayor nivel de detalle, puedes activar `all` para depuración global y añadir un componente específico.

##### Para BIOS:

```bash
make bin/ipxe.pxe DEBUG=all,tcp,dhcp,pxe
```

##### Para UEFI 64-bit:

```bash
make bin-x86_64-efi/ipxe.efi DEBUG=all,tcp,dhcp,pxe
```

#### Cómo ver los logs de depuración

Una vez compilado con las opciones de depuración, los mensajes de debug se mostrarán en la consola cuando se inicie iPXE. La salida de depuración puede variar según los módulos seleccionados.

#### Resumen

- Para cada compilación de iPXE, usa la variable `DEBUG` con las categorías de depuración que quieras.
- Las categorías más comunes incluyen: `all`, `tcp`, `dhcp`, `pxe`, `img`, `https`, `ssl`, `nic`, `pci`.
- Los binarios finales serán:
  - `bin/ipxe.pxe` para BIOS
  - `bin-x86_64-efi/ipxe.efi` para UEFI

## Algunos datos interesantes sobre la compilación y uso de diferentes binarios:

Cuando compilas **iPXE**, puedes generar varios tipos de binarios (archivos) que están diseñados para diferentes tipos de entornos de arranque (BIOS o UEFI) y medios (red, disco, CD-ROM, etc.). La diferencia entre estos archivos se basa en cómo se cargan y ejecutan en el hardware, así como en qué tipo de soporte utilizan.

A continuación, te explico las extensiones y nombres más comunes que puedes encontrar al compilar iPXE:

###### 1. **Formatos de BIOS (Legacy BIOS)**

- **`undionly.kpxe` / `undionly.pxe`**:

  - Estos binarios están diseñados para sistemas **BIOS heredados** (Legacy BIOS).
  - **`undionly`** usa el controlador UNDI proporcionado por el firmware PXE del BIOS, lo que le permite interactuar con la red sin necesidad de controladores de red específicos.
  - La extensión `.kpxe` es compatible con las tarjetas de red que pueden descargar un archivo más grande que `.pxe`, que suele tener limitaciones de tamaño.
  - **Uso**: Estos binarios se cargan en la memoria del sistema a través de PXE (Preboot Execution Environment) para realizar tareas como el arranque desde la red.

- **`ipxe.pxe`**:

  - Este binario es similar a `undionly.kpxe`, pero incluye controladores para una variedad de tarjetas de red (a diferencia de `undionly`, que depende de UNDI).
  - Está diseñado para sistemas BIOS que pueden cargar desde PXE.
  - **Uso**: Generalmente utilizado cuando no se desea depender de UNDI y se necesita compatibilidad con varios dispositivos de red.

- **`ipxe.iso`**:

  - Es una imagen de CD o ISO que puedes grabar en un CD-ROM o un dispositivo similar.
  - **Uso**: Ideal para arrancar sistemas que no soportan PXE o cuando se quiere usar un CD/DVD para arrancar iPXE en modo BIOS.

- **`ipxe.usb`**:
  - Este es un binario que se puede grabar en una unidad USB de arranque.
  - **Uso**: Utilizado para arrancar iPXE desde una memoria USB en sistemas con BIOS.

###### 2. **Formatos de UEFI (Unified Extensible Firmware Interface)**

- **`ipxe.efi`**:
  - Este binario está diseñado específicamente para sistemas **UEFI**. Está disponible en dos variantes principales:
    - **`ipxe-x86_64.efi`**: Para UEFI de 64 bits.
    - **`ipxe-i386.efi`**: Para UEFI de 32 bits.
  - **Uso**: Compatible con sistemas modernos que usan UEFI en lugar de BIOS heredado. Se utiliza para arrancar sistemas a través de la red o discos desde entornos UEFI.

###### 3. **Otros formatos importantes**

- **`ipxe.lkrn`**:

  - Este es un **kernel de Linux** que puedes cargar desde un gestor de arranque como **GRUB**.
  - **Uso**: Ideal para sistemas donde iPXE necesita ser cargado como un kernel de Linux. Es útil en sistemas que ya están configurados con GRUB.

- **`ipxe.dsk`**:
  - Un binario en formato de disquete, ya que algunas placas base antiguas solo podían arrancar desde disquetes.
  - **Uso**: Aunque está en desuso, este formato puede ser útil para sistemas muy antiguos con BIOS que todavía requieren disquetes para arrancar.

###### ¿Cuándo usar cada uno?

- **`undionly.kpxe`**: Es el más común en entornos de BIOS heredados donde PXE ya está configurado. Usa el controlador de red proporcionado por el firmware PXE.
- **`ipxe.efi`**: Para entornos UEFI modernos, especialmente en hardware más reciente.
- **`ipxe.iso` y `ipxe.usb`**: Para arrancar sistemas que no pueden arrancar desde la red, pero donde necesitas cargar iPXE desde un medio físico.
- **`ipxe.lkrn`**: Si estás usando Linux y GRUB para arrancar iPXE como un kernel.

###### Ejemplo de compilación

Si deseas compilar iPXE para varios tipos de entornos, aquí te doy algunos ejemplos de comandos `make`:

1. **Compilación para BIOS (Legacy BIOS)**:

   ```bash
   make bin/undionly.kpxe
   make bin/ipxe.pxe
   ```

2. **Compilación para UEFI**:

   - Para UEFI de 64 bits:
     ```bash
     make bin-x86_64-efi/ipxe.efi
     ```
   - Para UEFI de 32 bits:
     ```bash
     make bin-i386-efi/ipxe.efi
     ```

3. **Compilación para USB**:

   ```bash
   make bin/ipxe.usb
   ```

4. **Compilación para ISO**:

   ```bash
   make bin/ipxe.iso
   ```

5. **Compilación como kernel Linux**:
   ```bash
   make bin/ipxe.lkrn
   ```

Cada tipo de binario tiene su aplicación según el entorno donde desees usar iPXE (BIOS vs. UEFI, red vs. medio físico). Por lo tanto, la selección del formato adecuado depende de las capacidades del hardware y de la infraestructura en la que trabajas.
