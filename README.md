# dis-cover
Disassemble binaries and recover as much info as possible

## How to use

### Run the case studies

To run the case studies, simply `make run-scenarios`. You need to have `docker` installed.

### Command-line

You can install dis-cover by running `pip install dis-cover`.

Here are the CLI options :

```
$ dis-cover --help
usage: dis-cover [-h] [-d OUTPUT_DIRECTORY] [-p] [-o OUTPUT_FILE] [-b | -c] file

Disasemble binaries and recover as much info as possible

positional arguments:
  file                  File to dis-cover

optional arguments:
  -h, --help            show this help message and exit
  -d OUTPUT_DIRECTORY, --output-directory OUTPUT_DIRECTORY
                        Directory where the temporary files are written
  -p, --pickle          Output info in the pickle format (used with --bin)
  -o OUTPUT_FILE, --output-file OUTPUT_FILE
                        File where the output should be written (used with --bin)
  -b, --bin             Extract info from a binary file (default)
  -c, --cpp             Compile C++ file under multiple scenarios and extract info from the given outputs
```

`dis-cover` is in early development, it will probably not work yet on your own binaries.
