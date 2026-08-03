% !TeX root = main.tex
%%==============================================================================
%%                            WZL LaTex Class
%%                                 V2.0
%%             Dissertations, project reports, bachelor theses, master theses
%%
%%------------------------------------------------------------------------------
%%
%% Class developed by:
%%
%% Amon Göppert (gpp)
%% Laboratory for Machine Tools and Production Engineering WZL | RWTH Aachen
%% Chair of Production Metrology and Quality Management
%% Department Model-based Systems
%% Group Metrology Assisted Assembly
%%
%% Production Engineering Cluster
%% Campus-Boulevard 30, 52074 Aachen | GERMANY
%% Phone: +49 241 80-20599
%% mailto: a.goeppert@wzl.rwth-aachen.de
%%
%%
%%------------------------------------------------------------------------------
%%
%% Aachen, October 2019
%% based on LaTeX `book.cls'
%% This specific file is the class file, which is needs to be specified in the command \documentclass{}
%%
%------------------------------------------------------------------
%%
%%
%% Class edited by:
%%
%% Tobias Hamann (hmt)
%% Group Leader
%% 
%% Laboratory for Machine Tools and Production 
%% Engineering WZL of RWTH Aachen
%% Chair of Production Metrology and Quality Management
%% Department for Organizational Development | Industrial Capabilities
%% Production Engineering Cluster
%% Campus-Boulevard 30
%% 52074 Aachen | GERMANY
%% Phone: +49 151 72921981
%% mailto: t.hamann@wzl-mq.rwth-aachen.de
%%
%%
%%------------------------------------------------------------------------------
%%
%% Aachen, May 2022
%% Changed the file to be working with MiKTeX, TexStudio and Citavi 6 on a local machine rather than on an online plattform. Also cleaned up the code from development artifacts and added comments for understanding.
%%
%%
%------------------------------------------------------------------
%%
%%
%% Class edited by:
%%
%% Mark Sanders (sdr)
%% 
%% Laboratory for Machine Tools and Production 
%% Engineering WZL of RWTH Aachen
%% Chair of Production Metrology and Quality Management
%% Department for Organizational Development | Industrial Capabilities
%% Production Engineering Cluster
%% Campus-Boulevard 30
%% 52074 Aachen | GERMANY
%% Phone: 
%% mailto: 
%%
%%
%%------------------------------------------------------------------------------
%%
%% Aachen, 
%% 
%%

%==============================================================================
%%
%------------------------------------------------------------------
%%
%%
%% Class edited by: Mark Sanders and Tobias Hamann
%%------------------------------------------------------------------------------
%%
%% Aachen, Feburary 2025
%% Complete Rework and merging of previous works to create a common template.
%% What else can we say except you're welcome!
%%

%==============================================================================

%% ====== Class commands ======
\NeedsTeXFormat{LaTeX2e}
% \ProvidesClass{WZLtemplate}[2019/08/15 Example LaTeX class]
\ProvidesClass{format/WZLTemplate}[WZL Thesis]

%%----OPTIONS----

%% 'sans' option
\DeclareOption{sans}{
    \renewcommand{\familydefault}{\sfdefault}
}

%% 'de' option
\DeclareOption{de}{
    \newcommand{\longlang}{ngerman}
    \newcommand{\shortlang}{de}
    \newcommand{\tmpacronymname}{Abkürzungsverzeichnis}
    \newcommand{\tmpreferencename}{Literaturverzeichnis}
    \newcommand{\tmpsymbolname}{Symbolverzeichnis}
    \newcommand{\tmpglossaryname}{Glossar}
    \PassOptionsToPackage{ngerman}{babel}
    \newcommand{\Autoref}[1]{{\autoref{#1}}}
}

%% 'en' option
\DeclareOption{en}{
    \newcommand{\longlang}{english}
    \newcommand{\shortlang}{en}
    \newcommand{\tmpacronymname}{Table of Acronyms}
    \newcommand{\tmpreferencename}{References}
    \newcommand{\tmpsymbolname}{List of Symbols}
    \newcommand{\tmpglossaryname}{Glossary}
    \PassOptionsToPackage{english}{babel}
    \AtBeginDocument{
        \renewcommand{\figureautorefname}{figure} % is otherwise capitalized
        \renewcommand{\subfigureautorefname}{figure}
        % \renewcommand{\subsubsectionautorefname}{section}
    }
    \newcommand{\Autoref}[1]{\capitalisewords{\autoref{#1}}}
}

%%----PROCESSING OPTIONS----

%% Declare, where language specific documents can be found, such as frontmatter etc. The path corresponds to the short name of the language choosen via the language option.
\def\input@path{{format/\shortlang/}}

\def\usefiramath{0}
\DeclareOption{usefiramath}{\def\usefiramath{1}}

\def\papersize{4}
\DeclareOption{a5paper}{\def\papersize{5}}
\DeclareOption{a4paper}{\def\papersize{4}}

%% Pass all unrecognized options to the base class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extreport}}

% Process all given options
\ProcessOptions\relax

%%----SET DOCUMENT PROPERTIES----
\input{format/WZLTemplate_files/SET_DocumentProperties.tex}

%%----IMPORT USEFULL PACKAGES----
\input{format/WZLTemplate_files/SET_UsefulPackages.tex}

%%----SET UP TABLE OF CONTENTS, LIST OF FIGURES & LIST OF TABLES----
\input{format/WZLTemplate_files/SET_TablesOfThings.tex}

%%----SET UP Acronyms----
\input{format/WZLTemplate_files/SET_Acronyms.tex}

%%----SET UP Glossaries----
\input{format/WZLTemplate_files/SET_Glossaries.tex}

%%----SET UP FIGURES AND TABLES
\input{format/WZLTemplate_files/SET_FiguresAndTables.tex}

%%----SET UP TIKZ----
\input{format/WZLTemplate_files/SET_Tikz.tex}

%%----SET UP FOOTNOTES----
\input{format/WZLTemplate_files/SET_Footnotes.tex}

%%----SET UP HYPERLINKS----
\input{format/WZLTemplate_files/SET_Hyperlinks.tex}

%%----SET UP Abstracts, Definitions and Theorems----
\input{format/WZLTemplate_files/SET_SpecialBoxes.tex}

%%----SET UP BIBLIOGRAPHY----
\input{format/WZLTemplate_files/SET_Bibliography.tex}

%%----SET UP APPENDIX----
\input{format/WZLTemplate_files/SET_Appendix.tex}

%%----MISCELLANEOUS----
\input{format/WZLTemplate_files/SET_Miscellaneous.tex}



%% ----SET UP Unused packages----
% \input{format/WZLTemplate_files/Unused.tex}    

% TODO \RequirePackage{ulem} Probleme ohne [normalem]

\endinput
%%----END OF FILE----