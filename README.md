# better-extract

**A better way to extract compressed files directly from terminal using just one command.**


Compressing and extracting files is a common task for many users, and there are numerous file formats that can be used for this purpose, such as .zip, .7z, .rar, .tar.gz, and so on. Extracting the contents of compressed files often requires using different commands, depending on the file format, which can be inconvenient and time-consuming.

This is where better-extract comes in. It is a simple but powerful tool that can save you time and effort by allowing you to extract compressed files of various formats using just one command. No need to remember the syntax for different commands or to spend time searching online for the right one. Simply use the extract command, specify the file name and better-extract will handle the rest.



## Contents
- [Supported formats](#supported-formats)
- [Installation](#installation)
- [Usage](#usage)
- [Uninstall](#uninstall)
- [Contributing](#contributing)



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
- .pax



## Installation
**1. Clone this repo:**
```
git clone https://github.com/StellarSand/better-extract.git
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
```
extract <file1> <file2> <file3>
```

Extracting to a specific directory can be done by using the `-d` or `--directory` option
```
extract <file> -d <directory>
```

**Examples:**
```
extract backup.rar
```

```
extract backup1.rar backup2.rar backup3.rar
```

```
extract backup.rar -d /home/user/Desktop
```

**NOTE:** Since extracting multiple files is done in parallel, it might use a lot of system resources if too many files are processed.





## Uninstall
If better-extract has been installed, you can remove it by:

**1. Clone this repo (if not done already):**
```
git clone https://github.com/StellarSand/better-extract.git
```

**2. Move into the project directory:**
```
cd better-extract
```

**3. Give executable permissions to the uninstall script:**
```
chmod +x uninstall.sh
```

**4. Run the uninstall script:**
```
./uninstall.sh
```



## Contributing
Pull requests can be submitted [here](https://github.com/StellarSand/better-extract/pulls). Any contribution to the project will be highly appreciated.