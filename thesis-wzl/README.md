
# WZL Latex 
*Template, requirements, tools & tricks*  
*Contact:* [Mark Sanders (sdr)](mailto:mark.sanders@wzl-iqs.rwth-aachen.de) or [Tobias Hamann (hmt)](mailto:tobias.hamann@wzl-iqs.rwth-aachen.de)

[Main Document Template](https://git-ce.rwth-aachen.de/wzl-mq-public/templates/wzl-latex/-/jobs/artifacts/master/raw/main.pdf?job=Build)

[Topic Description Template](https://git-ce.rwth-aachen.de/wzl-mq-public/templates/wzl-latex/-/jobs/artifacts/master/raw/topic_description.pdf?job=Build)

**Info**  
This is an examplary LaTeX project with .tex and .bib files as a template for writing final reports, theses or dissertations in WZL style.
The formatting rules and parameters are located in the  `format/WZLtemplate.cls` file.

NOTES: 
- Use LuaLaTeX or XeLaTeX as compiler
- Use biber as bibliography program
- Export bibliography from Citavi as BibLatex Export.

## Getting started

<details><summary>With Overleaf</summary>
by Mark

## Overleaf (ShareLaTeX)

**Online TeX-System & IDE**  
For a fully integrated web-based TeX and IDE system check-out the RWTH/TU Darmstadt Overleaf instance: [Overleaf](https://sharelatex.tu-darmstadt.de)  
The master branch of this repository is pushed to this public Overleaf project: [wzl-latex project](https://sharelatex.tu-darmstadt.de/read/mxnwwkynxdyn#7b9fb2)  (state: 2025-03-04)

Disadvantages of overleaf are the necessary figure and literature uploads.  
Advantages are the out-of-the-box usage without aforementioned software installations.
</details>

<details><summary>With VS Code and Latex Workshop</summary>
by Mark

## Editing locally
### Requirements

**TeX system**  
For compiling .tex-files locally, a TeX-System is required. I recommend [TinyTeX](https://yihui.org/tinytex/).


**IDE**  
For proper .tex-files editing an IDE is needed. I recommend [VSCode](https://code.visualstudio.com/) with [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) installed.


### First steps

When working with a local TeX System and IDE, download or clone this repository to your empty project directory:  
Clone with tls/https (requires your Gitlab login):  
`git clone https://git-ce.rwth-aachen.de/wzl-mq-public/templates/wzl-latex.git --recurse-submodules`  

### Install all necessary packages

```  tlmgr install `cat texlive_packages.txt`  ```


Compile the main.tex-file with your IDE and consider the resulting PDF for further explanations.

The Deckblattundformularlogoverwendung PDF might not be included properly. Please print the PDF after filling your data as a PDF with a common PDF printer. Afterwards include this new PDF.


</details>

<details><summary>With Texstudio</summary>
by Tobias

## Editing locally
### Requirements

**TeX system**  
For compiling .tex-files locally, a TeX-System is required. I recommend [MikTeX](https://miktex.org/).


## Setup 

- Clone this repo
- Follow the **Installation** below
- Search for MikTex Updates
- Citavi 6 installieren

## Installation

In your Command line, run the following:

    winget install -e --id Microsoft.VisualStudioCode
    winget install -e --id TeXstudio.TeXstudio
    winget install -e --id MiKTeX.MiKTeX
    winget install -e --id StrawberryPerl.StrawberryPerl

## Setup Texstudio

#### Darkmode

- Optionen --> TexStudio konfigurieren --> Allgemein
- Stil: Adwaita Dark (txs) auswählen
- Farbschema: Modern - dunkel

#### Line Numbers

- Optionen --> TexStudio konfigurieren 
- "Erweiterte Optionen" anhaken (ganz unten)
- --> Editor 
- Zeilennummern anzeigen: Alle Zeilennummern

</details>


## Fonts

The Fira Sans font files are zipped in the format folder.

CMU Serif can be installed and used e.g. for creating figures in ppt with a font that is very similar to the standard Tex font, if the serif font is used.
https://fontlibrary.org/en/font/cmu-serif


## Backups

### Backup Citavi

Private backup:
- In Citavi use Datei --> Dieses Projekt --> Archivkopie lokal speichern


## Troubleshooting:


### Latex

NOTE: If you have trouble getting this document to compile, try renaming or deleting pdflatex.fmt, main.bbl and main.aux



####  ERROR - BibTeX subsystem line 834, syntax error: found "23", expected ",":
The line equals the line in the bibliography file. 

Fix: Bibtex Key MUST NOT contain spaces! 


#### --> pdflatex.exe (file ...): PDF inclusion: found PDF version <1.7>, but at most version <1.5> allowed<...

See: https://tex.stackexchange.com/questions/52317/pdftex-warning-version-allowed 

Fix:
'''
% Fix a bug with PDF Images included
\pdfminorversion=7
'''

#### --> pdfTeX warning (ext4): destination with the same identifier (nam e{page.1}) has been already used, duplicate ignored

See: https://tex.stackexchange.com/questions/18924/pdftex-warning-ext4-destination-with-the-same-identifier-nam-epage-1-has

Fix:

Include `\include{titlepage}` and `	\include{frontmatter}` into anoter `\hypersetup` as shown below:

    % To avoid bugs with page numbering
	\hypersetup{pageanchor=false}
	
	\include{titlepage}	
	
	% -- FRONTMATTER -- 
	\include{frontmatter}	
	
	% To avoid bugs with page numbering
	\hypersetup{pageanchor=true}

#### TexStudio: This is BibTeX, Version 0.99d (MiKTeX 24.3) I found no \citation commands---while reading file main.aux .... (There were 3 error messages)

Fix: Change standard compiler to Biber.

#### TexStudio: Synchronisation zwischen Text und Cursor Position ist defekt

In der Datei vor der Datei in der es nicht mehr funktioniert ist irgendwo, vermutlich in einem Bild, ein Problem.


Dies kann sein:
- Nicht genug Text nach einem Bild: Bild, neue Section, Ende der Datei bevor neue Seite anfängt
  

Mögliche Fixes:  
- `\clearpage` direkt nach der Abbildung einfügen --> Blöd wenn noch Text kommt
- Mehr Text nach Abbildung einfügen, sodass das Kapitel noch bis auf die nächste Seite geht. WTF am i even writing here. Das is so dumm, wieso ist das so? \afterpage{\clearpage} funktioniert deshalb auch nicht, weil es keine afterapge gibt, wenn nicht genug text vorhanden ist. WTF!

#### Linebreaks in Literaturverzeichnis klappen nicht

Problem: Journaltitel etc. ragen über die Ränder hinaus und generell sieht das Literaturverzeichnis einfahc beschissen aus.

Fix:
- \usepackage[normalem]{ulem} nutzen statt \usepackage{ulem}

Quelle: https://tex.stackexchange.com/questions/17557/biblatex-removing-underlining-of-journal-title-and-enabling-line-break-of-it 

### Schriftarten müssen eingebettet sein

Problem: Unibib will eingebettete Schriftarten. Ist ggf. in PDF exporten aus PPT nicht der fall.

Fix:
- Ale Schriftarten, die nicht eingebettet sind, ersetzen durch Schriftarten erstetzen in PPT.
- Bilder neu in PDF exportieren.
- Done.

-------------------------------------




### Acronyms 

WZLtemplate.cls, Zeile 197 "nolist" auskommentiert, wenn Liste weg soll, auskommentieren

% NOTE: Use LuaLatex as compiler
% NOTE: Use biber as Standardbibliographieprogramm
% NOTE: If you have trouble getting this document to compile, try renaming or deleting pdflatex.fmt, main.bbl and main.aux

% Error/Bug Fixing

% NOTE: 
% For the ERROR - BibTeX subsystem line 834, syntax error: found "23", expected ",":
% The line equals the line in the bibliography file. 

% NOTE: Bibtex Key MUST NOT contain spaces! 

% NOTE: LaTex Workshop in VSCode might interfere with compilation. Disable LaTex Workshop in VSCode is you have problems with your view disappearing.