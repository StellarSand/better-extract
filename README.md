# better-extract

A better way to extract compressed files directly from terminal.



## Contents
- [Why?](#why)
- [Supported formats](#supported-formats)
- [Installation](#installation)
- [Usage](#usage)
- [Uninstall](#uninstall)
- [Contributing](#contributing)



## Why?
Compressing and extracting files is a common task for many users, and there are numerous file formats that can be used for this purpose, such as .zip, .7z, .rar, .tar.gz, and so on. Extracting the contents of compressed files often requires using different commands, depending on the file format, which can be inconvenient and time-consuming.

This is where better-extract comes in. It is a tool that allows you to extract compressed files of various formats using just one command. No need to remember the syntax for different commands or to spend time searching online for the right one. Simply use the extract command, specify the file name and better-extract will handle the rest.

In addition, better-extract also allows you to extract the contents of a compressed file to a specific directory, rather than the current one. This can be particularly useful if you want to extract the contents to a specific location or if you don't want to clutter the current directory with extracted files.

Overall, better-extract is a simple but powerful tool that can save you time and effort when dealing with extracting compressed files.



## Supported formats
- .zip
- .rar
- .7z
- .iso
- .tar
- .tar.bz2
- .tbz2
- .tar.gz
- .tgz
- .tar.xz
- .txz
- .xz
- .bz2
- .gz
- .Z
- .dmg
- .pax



## Installation
**1. Clone this repo:**
```
git clone https://github.com/the-weird-aquarian/better-extract.git
```

**2. Move into the project directory:**
```
cd better-extract
```

**3. Give executable permissions to the install script:**
```
chmod +x install.sh
```

**4. Run the install script:**
```
./install.sh
```



## Usage
Using better-extract is pretty simple, once installed.
```
extract <file>
```

Extracting to a specific directory can be done by using the -d or --dir option
```
extract <file> -d <directory>
```
OR
```
extract <file> --dir <directory>
```

**Example:**
```
extract backup.rar
```

```
extract backup.rar -d /home/user/directory
```

```
extract backup.rar --dir /home/user/directory
```



## Uninstall
If better-extract has been installed, you can remove it by:

**1. Move into the project directory:**
```
cd better-extract
```

**2. Give executable permissions to the uninstall script:**
```
chmod +x uninstall.sh
```

**3. Run the uninstall script:**
```
./uninstall.sh
```



## Contributing
Pull requests can be submitted [here](https://github.com/the-weird-aquarian/better-extract/pulls). Any contribution to the project will be highly appreciated.