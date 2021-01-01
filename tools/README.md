# validate.py

Use `validate.py` to validate individual files or directories against the DTD schema. E.g.:
 * `python3 validate.py ../dictionaries/dic.dtd ../dictionaries/cateng/`
 * `python3 validate.py ../dictionaries/dic.dtd ../dictionaries/cateng/a.dic`

The utility `xmllint` needs to be found in the PATH. It is available in the Debian package `libxml2-utils`.

