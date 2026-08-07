\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{RPdoc}[2026/07/03 Template for different documents]

% Setup
% -------------------------------------------------------------------
\RequirePackage{etoolbox}
\RequirePackage{kvoptions}

\SetupKeyvalOptions{
    family=RP,
    prefix=RP@
}

% Optionen
% -------------------------------------------------------------------
\DeclareBoolOption[true]{kopfzeile}
\DeclareBoolOption[false]{logoinkopfzeile}
\DeclareBoolOption[false]{duplex}

\newbool{isthesis}
\DeclareOption{bericht}{\boolfalse{isthesis}}
\DeclareOption{arbeit}{\booltrue{isthesis}}

\ProcessKeyvalOptions*
\ProcessOptions\relax

% Basis-Klasse laden
\ifRP@duplex
    \LoadClass[12pt,titlepage,twoside,numbers=noenddot,a4paper,DIV=12]{scrreprt}
\else
    \ifbool{isthesis}{%
        \LoadClass[12pt,titlepage,oneside,numbers=noenddot,a4paper,DIV=12]{scrreprt}}{% soll zu twoside passen
        \LoadClass[12pt,titlepage,oneside,numbers=noenddot,a4paper,DIV=14]{scrreprt}}
\fi

% Pakete
% -------------------------------------------------------------------
\RequirePackage[export]{adjustbox} % Erweitert \includegraphics
\RequirePackage{amsmath}           % Mathematische Formeln und Umgebungen
\RequirePackage{array}             % Erweiterte Funktionen für Tabellenspalten
\RequirePackage[english,ngerman]{babel} % Sprachanpassung
\RequirePackage[backend=biber,style=ieee]{biblatex} % Modernes Literaturverzeichnis
\RequirePackage{booktabs}          % Wissenschaftliche Tabellenlinien
\RequirePackage{caption}           % Anpassung von Bild- und Tabellenunterschriften
\RequirePackage[autostyle=true,german=quotes]{csquotes} % Kontextsensitive Anführungszeichen
\RequirePackage{enumitem}          % Feinjustierung von Listen (itemize, enumerate)
\RequirePackage{fix-cm}            % Verhindert Skalierungswarnungen bei Computer Modern Schriften
\RequirePackage[T1]{fontenc}       % Richtige Codierung für europäische Schriftzeichen
\RequirePackage[acronym, nonumberlist, nopostdot]{glossaries} % Glossar- und Abkürzungsverzeichnis
\RequirePackage{graphicx}          % Einbinden von Bildern
\RequirePackage[hidelinks]{hyperref} % Hyperlinks im PDF
\RequirePackage{listings}          % Für Quellcode
\RequirePackage{lmodern}           % Skalierbare "Latin Modern" Vektorschrift
\RequirePackage{makecell}          % Erlaubt Zeilenumbrüche innerhalb von Tabellenzellen
\RequirePackage{multirow}          % Verbinden von Zeilen in Tabellen
\RequirePackage{pdfpages}          % Einfügen von externen PDF-Seiten
\RequirePackage{rotating}          % Drehen von Tabellen oder Bildern im Querformat
\RequirePackage{setspace}          % Zeilenabstand anpassen
\RequirePackage[autooneside=false]{scrlayer-scrpage} % KOMA-Script Paket für Kopf- und Fußzeilen
\RequirePackage{supertabular}      % Tabellen, die über mehrere Seiten brechen können
\RequirePackage{tabularx}          % Tabellen mit dynamischer Spaltenbreite
\RequirePackage{xcolor}            % Aktiviert Farb-Support inklusive farbiger Tabellen
\RequirePackage{xurl}              % Zerteilen von Links erlauben

\definecolor{ohmRed}{HTML}{C72426}

\typeout{
	Hinweis: Es sind schon einige optionale Pakete geladen, z.B. hyperref für klickbare Links oder pdfpages um pdf Seiten einfach einzufügen \MessageBreak
	Bsp. hyperref: \string\usepackage[hidelinks]\string{hyperref\string} \MessageBreak
	Bsp. pdfpages: \string\includepdf[pages=-]\string{Datei.pdf\string}
}

% Parameter
% -------------------------------------------------------------------
% strings
\newcommand{\@headertopline}{}
\newcommand{\@supervisor}{}
\newcommand{\@otherauthors}{}
\newcommand{\@studentnumber}{}
\newcommand{\@email}{}
\newcommand{\@group}{}
\newcommand{\@authorpref}{Bearbeiter}
\newcommand{\@supervisorpref}{Betreuer}
\newcommand{\@otherauthorspref}{Bearbeiter}
\newcommand{\@responsiblepref}{Verantwortlicher}
\newtoks\@additionallines

\newcommand{\@thesistype}{}
\newcommand{\@course}{}

% Schriftgrößen
\newcommand{\@titlesize}{\LARGE}
\newcommand{\@subtitlesize}{\large}
\newcommand{\@chaptersize}{\LARGE}
\newcommand{\@sectionsize}{\Large}
\newcommand{\@subsectionsize}{\large}

% Dateien
\newcommand{\@abstractfile}{}
\newcommand{\@coverimagefile}{}
\newcommand{\@secondcoverlogofile}{}
\newcommand{\@companylogofile}{}
\newcommand{\@acknowledgementsfile}{}
\newcommand{\@blockingnotefile}{}
\newcommand{\@ohmlogofile}{Bilder/OhmLogo.png}

% Commands
% -------------------------------------------------------------------
% Allgemein
\newcommand{\Autor}[2]{%
    \ifstrequal{#1}{w}{\renewcommand{\@authorpref}{Bearbeiterin}}{}%
    \ifstrequal{#1}{w}{\renewcommand{\@responsiblepref}{Verantwortliche}}{}%
    \author{#2}%
}
\newcommand{\Betreuer}[2]{%
    \ifstrequal{#1}{w}{\renewcommand{\@supervisorpref}{Betreuerin}}{}%
    \renewcommand{\@supervisor}{#2}%
}
\newcommand{\WeitereAutoren}[2]{%
    \ifstrequal{#1}{w}{\renewcommand{\@otherauthorspref}{Bearbeiterin}}{}%
    \renewcommand{\@otherauthors}{#2}%
}

% Optionale Angaben
\newcommand{\Matrikelnummer}[1]{\renewcommand{\@studentnumber}{#1}}
\newcommand{\Email}[1]{\renewcommand{\@email}{#1}}
\newcommand{\Gruppe}[1]{\renewcommand{\@group}{#1}}
\newcommand{\ObereKopfZeile}[1]{\renewcommand{\@headertopline}{#1}}
\newcommand{\ZusaetzlicheTitelListenZeilen}[1]{\@additionallines={#1}}

\newcommand{\Arbeitstyp}[1]{\renewcommand{\@thesistype}{#1}}
\newcommand{\Studiengang}[1]{\renewcommand{\@course}{#1}}

% Optional: Schriftgrößen
\newcommand{\TitelGr}[1]{\renewcommand{\@titlesize}{#1}}
\newcommand{\UntertitelGr}[1]{\renewcommand{\@subtitlesize}{#1}}
\newcommand{\ChapterGr}[1]{\renewcommand{\@chaptersize}{#1}}
\newcommand{\SectionGr}[1]{\renewcommand{\@sectionsize}{#1}}
\newcommand{\SubsectionGr}[1]{\renewcommand{\@subsectionsize}{#1}}

% Dateien
\newcommand{\TitelbildDatei}[1]{\renewcommand{\@coverimagefile}{#1}}
\newcommand{\ZweitesTitelLogo}[1]{\renewcommand{\@secondcoverlogofile}{#1}}

% Layout
% -------------------------------------------------------------------
\setkomafont{chapter}{\normalfont\@chaptersize\bfseries}
\setkomafont{section}{\normalfont\@sectionsize\bfseries}
\setkomafont{subsection}{\normalfont\@subsectionsize\bfseries}

% Namen der Überschriften ändern
\renewcaptionname{ngerman}{\contentsname}{Inhalt}
\renewcaptionname{ngerman}{\listfigurename}{Abbildungen}
\renewcaptionname{ngerman}{\listtablename}{Tabellen}
\renewcommand*{\lstlistlistingname}{Quellcodes}
\renewcaptionname{ngerman}{\bibname}{Literatur}
\renewcaptionname{ngerman}{\figurename}{Abb.}
\renewcaptionname{ngerman}{\tablename}{Tab.}
\renewcommand*{\lstlistingname}{Code}

\ifRP@kopfzeile
    \KOMAoptions{headinclude=true,headsepline=0.4pt}
\else
    \KOMAoptions{headinclude=false}
\fi

\KOMAoptions{
    captions=tableheading,  % Tabellenüberschrift
    captions=figureheading,  % Abbildungsunterschrift
    footinclude=false
}
\recalctypearea

% Kein Einzug im neuen Absatz
\setlength{\parindent}{0pt}

\renewcommand*{\chapterheadstartvskip}{\vspace*{0.5cm}}

% Kopfzeile
% -------------------------------------------------------------------
\newcommand{\simpleheader}{%
    \automark{chapter}    

    \ihead{\@headertopline \\ \headmark}
    \chead{}
    \ohead{%
        \ifboolexpr{bool {RP@logoinkopfzeile} and not test {\ifblank{\@ohmlogofile}}}{%
            \raisebox{-0.05\height}{\includegraphics[height=2.5em]{\@ohmlogofile}}%
            \hspace{0.5em}}{%
        }
    \pagemark
    }%
}%

\ifRP@kopfzeile
    \pagestyle{scrheadings}
    \clearpairofpagestyles
    
    \ifbool{isthesis}{%
        \ifRP@duplex 
            \automark[section]{chapter}
            \ihead[]{\@headertopline \\ \headmark}
            \chead{}
            \ohead[]{%
                \ifboolexpr{bool {RP@logoinkopfzeile} and not test {\ifblank{\@ohmlogofile}}}{%
                    \raisebox{-0.05\height}{\includegraphics[height=2.5em]{\@ohmlogofile}}%
                    \hspace{0.5em}%
                }{}%
                \pagemark
            }%
        \else % wenn nicht duplex
            \simpleheader
        \fi
    }{\simpleheader} % wenn nicht Arbeit
\else
    \pagestyle{plain} % wenn keine Kopfzeile
\fi

% Intro
% -------------------------------------------------------------------
\newcommand{\RPintro}{%
    % Arbeit
    % ---------------------------------------------------------------
    \ifbool{isthesis}{%
        % Titelseite
        \thispagestyle{empty}
        \ifdefempty{\@coverimagefile}{\renewcommand{\@coverimagefile}{\@ohmlogofile}}{}%
        \begin{center}
            \ifdefempty{\@secondcoverlogofile}{%
                \includegraphics[height=2cm]{\@coverimagefile} \\
            }{%
                \adjustbox{width=0.45\textwidth, height=0.2\textheight, keepaspectratio, valign=c}{\includegraphics{\@secondcoverlogofile}}%
                \hfill
                \adjustbox{width=0.45\textwidth, height=0.2\textheight, keepaspectratio, valign=c}{\includegraphics{\@coverimagefile}}
            }%
            \par
            \vspace{1cm}
            \large Technische Hochschule Nürnberg Georg Simon Ohm \\
            Fakultät Verfahrenstechnik \\
            \ifdefempty{\@course}{}{Studiengang \@course \\}
            \vspace{0.5cm}
            \@thesistype \\
            \vspace{1cm}
            \@titlesize \textbf \@title \\
            \vspace{1cm}
            \@subtitlesize \textbf \@subtitle
        \end{center}
        \vfill
    
    % Bericht
    % ---------------------------------------------------------------
    }{%
        % Titelseite
        \thispagestyle{empty}
        \enlargethispage{5cm}
        \ifdefempty{\@coverimagefile}{\renewcommand{\@coverimagefile}{\@ohmlogofile}}{}%
        \begin{center}
            \ifdefempty{\@secondcoverlogofile}{%
                \includegraphics[width=0.8\textwidth]{\@coverimagefile} \\
            }{%
                \adjustbox{width=0.45\textwidth, height=0.2\textheight, keepaspectratio, valign=c}{\includegraphics{\@secondcoverlogofile}}%
                \hfill
                \adjustbox{width=0.45\textwidth, height=0.2\textheight, keepaspectratio, valign=c}{\includegraphics{\@coverimagefile}}
            }%
            \par
            \vspace{1cm}
            \@titlesize \textbf \@title \\
            \vspace{0.8cm}
            \@subtitlesize \textbf \@subtitle \\
        \end{center}

        \vfill

        \begin{tabularx}{\textwidth}{@{} r X @{}}
            \ifdefempty{\@group}{%
                \@authorpref : & \@author \\
            }{%
                Gruppe: & \@group \\
                \ifdefempty{\@otherauthors}{% stehen wohl alle in author
                    \@authorpref : & \@author \\
                }{%
                    \ifdefempty{\@author}{}{%
                        \@responsiblepref : & \@author \\
                    }%
                    \@otherauthorspref : & \@otherauthors \\
                }%
            }%
            \ifdefempty{\@studentnumber}{}{Matrikelnummer: & \@studentnumber \\}
            \ifdefempty{\@email}{}{E-Mail: & \@email \\}
            \ifdefempty{\@supervisor}{}{\@supervisorpref : & \@supervisor \\}

            \the\@additionallines
        \end{tabularx}

        \vspace{1cm}

        \begin{tabularx}{\textwidth}{@{} X X r @{}}
            Ort, Datum: \dotfill	& Unterschrift: \dotfill \\
            \ifdefempty{\@group}{}{ & \hfill (\@responsiblepref) \hfill}
        \end{tabularx}

        \vspace{3cm} % sonst macht das vfill Faxen

        \newpage
    }%
}%