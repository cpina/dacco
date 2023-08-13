# DACCO
DACCO stands for "Diccionari Obert Català de Codi Obert". It started around the year 2004 by Linda Oxnard in a mailing list in order to start a Catalan-English/English-Catalan dictionary that was open and collaborative, to help English students of Catalan.

Currently the DACCO project (that generated the files in this Github repository) seems to be unmaintained. There is [https://www.catalandictionary.org/](http://www.catalandictionary.org/) website as a Web frontend.

DACCO provides XML files with the translations, examples, notes of usage, links, etc. and used to also provide a PDF version.

Number of entries in DACCO files:
 * Catalan -> English: 18,161
 * English -> Catalan: 21,443

Each entry consist at least of one translation. Often it also has examples, multiple meanings with multiple translations and other related information.

## Where is DACCO used?

* [qdacco](https://github.com/cpina/qdacco): desktop application packaged for Debian and Ubuntu and easy to compile on other GNU/Linux distributions (and probably FreeBSD, etc.). Provides a a graphical interface to the dictionary (on GNU/Linux).

* [https://www.catalandictionary.org/](http://www.catalandictionary.org/): Web frontend for online DACCO queries and downloadable PDFs.

* [English-Catalan Dictionary iOS app](https://apps.apple.com/us/app/english-catalan-dictionary/id1660927078): for iPhone and iPad. Search thousands of English or Catalan words and phrases, see examples and hear pronuncation from native speakers.

Please contact me (carles@pina.cat), create a PR or an issue, or open a dicussion if you know of any other project using DACCO data.

## Source of this repository
This repository has been generated from the [dacco-cvs](https://github.com/cpina/dacco-cvs) repository.
```sh
export CVSROOT="$HOME/git/dacco-cvs"	# uncompressed, see dacco-cvs README.md
git cvsimport -v Publisher
```

The branch `dacco-imported-from-sourceforge-cvs` has no changes in the files that were imported (only this README.md file)

The branch `main` has further changes: this README, fixes in XML (typos, fix sorting, fix invalid attributes, etc.).

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

Carles Pina i Estany (carles@pina.cat), 2020, 2022
