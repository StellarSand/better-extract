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
There are a lot of compression standards and file formats such as .zip, .7z, .rar, .tar.gz, etc and extracting the contents of compressed files requires different commands, if done via terminal.

**better-extract** will save you a lot of time, especially if you have to deal with compressed files of many different formats. Using this you only need just one command to extract compressed file of different formats.



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