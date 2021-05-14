# Linux
## Cheatsheet

### ls

```sh
ls -R dir 	# Listar recursivamente los directorios de dir
ls -Sl 		# Ordena por tamaño de archivo y agrupa las carpetas en un solo 'espacio'
ls -d */	# Lista solo los directorios 
```
* Número de archivos en un directorio

  ```shell
  ls -1 | wc -l
  ```

### du

  ```shell
  du -h --max-depth=1 | sort -hr
  du -h dir1 dir2 # Se puede saber el espacio de más de un dir a la vez
  du -csh dir1 dir2 # flag -c obtiene la suma del tamaño de los dirs
  du --max-depth=1 -h
  ```

### Crear archivos en cada directorio 

```shell
for i in $( ls -d */ ); do touch $i/README.md; done
```

### Ver espacio en disco

```sh
fdisk -l
```

## Programas útiles

### Manipulación de PDFs

* **Unir PDFs**: `pdfunite` (console)

* **Cortar PDFs**: `briss` (gui)

* **Cortart PDFs página a página**: `pdfarranger` (gui)

* Convertir imágenes a PDF (console)

  ```shell
  convert <img1.png,[img2.png,img3.png,...]> output.pdf
  ```



