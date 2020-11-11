# DACCO
DACCO stands for "Diccionari Obert Català de Codi Obert". It started around the year 2004 by Linda Oxnard in a mailing list in order to start a Catalan-English/English-Catalan dictionary that was open and collaborative, to help English students of Catalan.

Currently the DACCO project (that generated the files in this Github repository) seems to be unmaintained. There is [https://www.catalandictionary.org/](http://www.catalandictionary.org/) website as a Web frontend.

[qdacco](https://github.com/cpina/qdacco), a maintained application, provides an interface to the dictionary (on GNU/Linux).

DACCO provides XML files with the translations, examples, links, etc. and used to also provide a PDF version.

qdacco provides a small frontend for the XML dictionaries.

## Source of this repository
This repository has been generated from the [dacco-cvs](https://github.com/cpina/dacco-cvs) repository.
```sh
export CVSROOT="$HOME/git/dacco-cvs"	# uncompressed, see dacco-cvs README.md
git cvsimport -v Publisher
```

The branch `dacco-imported-from-sourceforge-cvs` has no changes in the files that were imported (only this README.md file)

The branch `main` has further changes.

## Credits
Copy paste from [https://www.catalandictionary.org/en/credits/](http://www.catalandictionary.org/en/credits/): authors or contributors of the XML files found here:

### Editor
 * Dr Linda Oxnard

### Contributing Editors
 * Prof Max Wheeler
 * Lou Hevly
 * Carles Pina i Estany
 * Prof Jonathan Kaye
 * Gill Martin
 * Josep M. Lopez Besora
 * Margarita Castañón

---

Carles Pina i Estany (carles@pina.cat), 2020
