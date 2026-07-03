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
\DeclareBoolOption[true]{logoinkopfzeile}
\DeclareBoolOption[false]{duplex}

\newbool{isthesis}
\DeclareOption{bericht}{\boolfalse{isthesis}}
\DeclareOption{arbeit}{\booltrue{isthesis}}

\ProcessKeyvalOptions*
\ProcessOptions\relax

% Basis-Klasse laden
\ifRP@duplex
    \LoadClass[11pt,titlepage,twoside,numbers=noenddot,a4paper,DIV=12]{scrreprt}
\else
    \LoadClass[11pt,titlepage,oneside,numbers=noenddot,a4paper,DIV=12]{scrreprt}
\fi

% Pakete
% -------------------------------------------------------------------
\RequirePackage[export]{adjustbox} % Erweitert \includegraphics
\RequirePackage{amsmath}           % Mathematische Formeln und Umgebungen
\RequirePackage{array}             % Erweiterte Funktionen für Tabellenspalten
\RequirePackage[ngerman]{babel}    % Deutsche Sprachanpassung
\RequirePackage[backend=biber]{biblatex} % Modernes Literaturverzeichnis
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

\definecolor{ohmRed}{HTML}{C72426}

\typeout{
	Hinweis: Es sind schon einige optionale Pakete geladen, z.B. hyperref für klickbare Links oder pdfpages um pdf Seiten einfach einzufügen \MessageBreak
	Bsp. hyperref: \string\usepackage[hidelinks]\string{hyperref\string} \MessageBreak
	Bsp. pdfpages: \string\includepdf[pages=-]\string{Datei.pdf\string}
}

% Layout
% -------------------------------------------------------------------
\setkomafont{chapter}{\normalfont\huge\bfseries}
\setkomafont{section}{\normalfont\Large\bfseries}
\setkomafont{subsection}{\normalfont\large\bfseries}

% Namen der Überschriften ändern
\renewcaptionname{ngerman}{\contentsname}{Inhalt}
\renewcaptionname{ngerman}{\listfigurename}{Abbildungen}
\renewcaptionname{ngerman}{\listtablename}{Tabellen}
\renewcommand*{\lstlistlistingname}{Quellcodes}
\renewcaptionname{ngerman}{\bibname}{Literatur}
\renewcaptionname{ngerman}{\figurename}{Abb.}
\renewcaptionname{ngerman}{\tablename}{Tab.}
\renewcommand*{\lstlistingname}{Code}

\KOMAoptions{
    captions=tableheading,  % Tabellenüberschrift
    captions=figureheading  % Abbildungsunterschrift
}

% Kein Einzug im neuen Absatz
\setlength{\parindent}{0pt}

\renewcommand*{\chapterheadstartvskip}{\vspace*{0.5cm}}

% Parameter
% -------------------------------------------------------------------
% bools
\newbool{logoinheader}

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

% Dateien
\newcommand{\@abstractfile}{}
\newcommand{\@coverimagefile}{}
\newcommand{\@companylogofile}{}
\newcommand{\@acknowledgementsfile}{}
\newcommand{\@blockingnotefile}{}
\newcommand{\@ohmlogofile}{Bilder/OhmLogo.png}

% Andere

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

% Dateien
\newcommand{\TitelbildDatei}[1]{\renewcommand{\@coverimagefile}{#1}}

% Kopfzeile
% -------------------------------------------------------------------
\ifRP@kopfzeile
    \automark{chapter}
    \ifbool{isthesis}{%
        % Mach ich später
    }{%
        \pagestyle{scrheadings}
        \clearpairofpagestyles
        
        \ihead{\@headertopline \\ \headmark}
        \chead{}
        \ohead{%
            \ifboolexpr{bool {RP@logoinkopfzeile} and not test {\ifblank{\@ohmlogofile}}}{%
                \raisebox{-0.05\height}{\includegraphics[height=2.5em]{\@ohmlogofile}}%
                \hspace{0.5em}}{%
            }
        \pagemark
        }
        
        \KOMAoptions{headsepline=0.4pt}
    }%
\else
    \pagestyle{plain}
\fi

% Intro
% -------------------------------------------------------------------
\newcommand{\RPintro}{%
    \ifbool{isthesis}{%
        % mache ich später
    }{%
        % Titelseite
        \thispagestyle{empty}
        \ifx\@coverimagefile\@empty
            \renewcommand{\@coverimagefile}{\@ohmlogofile}
        \fi
        \begin{center}
            \huge \textbf \@title \\
            \vspace{0.8cm}
            \includegraphics[width=0.8\textwidth]{\@coverimagefile} \\
            \vspace{0.8cm}
            \Large \textbf \@subtitle \\
            \vspace{0.2cm}
            \normalsize \textbf \@date
        \end{center}

        \vfill

        \begin{tabularx}{\textwidth}{@{} r X @{}}
            \ifx\@group\@empty
                \@authorpref : & \@author \\
            \else
                Gruppe: & \@group \\ 
                \ifx\@otherauthors\@empty % stehen wohl alle in author
                    \@authorpref : & \@author \\
                \else
                    \ifdefempty{\@author}{}{% ifx hat hier gebuggt, keine Ahnung warum
                        \@responsiblepref : & \@author \\
                    }%
                    \@otherauthorspref : & \@otherauthors \\
                \fi
            \fi
            \ifx\@studentnumber\@empty\else 
                Matrikelnummer: & \@studentnumber \\ 
            \fi
            \ifx\@email\@empty\else 
                E-Mail: & \@email \\ 
            \fi
            \@supervisorpref : & \@supervisor \\
        \end{tabularx}

        \vspace{1cm}

        \begin{tabularx}{\textwidth}{@{} X X r @{}}
            Ort, Datum: \dotfill	& Unterschrift: \dotfill \\
            \ifx\@group\@empty\else 
             & \hfill (\@responsiblepref) \hfill
            \fi
        \end{tabularx}
    }%
    \newpage
}%