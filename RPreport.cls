% RPreport.cls: Praktikumsbericht-Klasse
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{RPreport}[2025/05/22 Klasse für Praktikumsberichte]
\typeout{Report class for lab reports. Created 22.05.2025, last modified 23.05.2025 by Roman Pfleger}

% Basisklasse laden – z. B. article
\LoadClass[12pt,a4paper,numbers=noenddot]{scrreprt}

% Standardpakete
\RequirePackage{fix-cm}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{lmodern}
\RequirePackage[ngerman]{babel}
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage[autostyle=true,german=quotes]{csquotes}
\RequirePackage[backend=biber]{biblatex}
\RequirePackage{float}
\RequirePackage{enumitem}

% Andere wichtige Pakete
\RequirePackage{scrbase}
\RequirePackage[autooneside=false]{scrlayer-scrpage}
\RequirePackage{ifthen}
\RequirePackage{tabularx}

% Pakete für Tabellen
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{supertabular}
\RequirePackage{multirow}
\RequirePackage{makecell}
\RequirePackage{colortbl} % Farbtabellen

% Optionale Pakete
\RequirePackage{pdfpages}				% um Seiten aus pdf Dokumenten einzufügen
\RequirePackage{rotating}				% für gedrehte Seiten
\RequirePackage{xcolor}				% für farbige Texte
\RequirePackage[hidelinks]{hyperref}		% hidelinks, damit die Links im Bericht nicht blau und unterstrichen sind

\typeout{
	Hinweis: Es sind schon einige optionale Pakete geladen, z.B. hyperref für klickbare Links oder pdfpages um pdf Seiten einfach einzufügen \MessageBreak
	Bsp. hyperref: \string\usepackage[hidelinks]\string{hyperref\string} \MessageBreak
	Bsp. pdfpages: \string\includepdf[pages=-]\string{Datei.pdf\string}
	}

% KOMA Einstellungen
\KOMAoptions{
  headsepline,
  DIV=12,
  listof=totoc
}

\setkomafont{chapter}{\normalfont\LARGE\bfseries}
\setkomafont{section}{\normalfont\Large\bfseries}
\setkomafont{subsection}{\normalfont\large\bfseries}

% Namen der Überschriften ändern
\renewcaptionname{ngerman}{\contentsname}{Inhalt}
\renewcaptionname{ngerman}{\listfigurename}{Abbildungen}
\renewcaptionname{ngerman}{\listtablename}{Tabellen}
\renewcaptionname{ngerman}{\bibname}{Literatur}
\renewcaptionname{ngerman}{\figurename}{Abb.}
\renewcaptionname{ngerman}{\tablename}{Tab.}

% Tabellen haben Überschrift, Abbildungen Unterschrift
\floatstyle{plaintop} \restylefloat{table}
\floatstyle{plain} \restylefloat{figure}

% Kein Einzug im neuen Absatz
\setlength{\parindent}{0pt}

% Weniger leerer Platz vor Chapterüberschrift
\RedeclareSectionCommand[beforeskip=0pt]{chapter}

\KOMAoptions{headinclude=false} % Kopfzeilenplatz nicht mit einrechnen

% Variablen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Werte
\def\kopfzeile{} % Kopfzeile leer wenn nichts eingestellt ist
\def\thema{Thema fehlt}
\def\art{Art fehlt}
\def\datum{Datum fehlt}
%
\def\bearbeiterPräf{Bearbeiter: }
\def\verantwortlicherPräf{Verantwortlicher} % = Bearbeiter, aber für Unterschrift auf Deckblatt
\def\betreuerPräf{Betreuer: }
%
\def\gruppe{}
%
\def\matrikelnummer{}
\def\strasse{}
\def\ort{}
\def\email{}
\def\firmenname{}
%
\def\autorenverzeichnis{} % wird eine Tabelle

% Dateien
\def\titelbild{}
\def\firmenlogo{}
%
\def\abstract{}
\def\symbole{}
\def\danksagung{}
\def\sperrvermerk{}

% Booleans
\def\loc{j}
\def\lof{j}
\def\lot{j}
\def\lol{n} % list of listings für Quellcode
\def\esl{n}
\def\zsl{n}
\def\deckblatt{j}
\def\arbeit{n}
\def\autorenverzeichnisAnzeigen{n}

% Commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\Kopfzeile}[1]{\def\kopfzeile{#1}}
\newcommand{\Thema}[1]{\def\thema{#1}}
\newcommand{\Art}[1]{\def\art{#1}}
\newcommand{\Datum}[1]{\def\datum{#1}}
\newcommand{\Arbeit}[1]{\def\arbeit{#1}}
%
\newcommand{\Bearbeiter}[2]{\def\bearbeitername{#2}
	\ifthenelse{\equal{#1}{w}}
		{\def\bearbeiterPräf{Bearbeiterin: } \def\verantwortlicherPräf{Verantwortliche}}
		{\def\bearbeiterPräf{Bearbeiter: } \def\verantwortlicherPräf{Verantwortlicher}
		\typeout{[Bearbeiter] Hinweis: Ungültiger Eintrag '#1', verwende default 'm'} } }
\newcommand{\Betreuer}[2]{\def\betreuername{#2}
	\ifthenelse{\equal{#1}{w}}
		{\def\betreuerPräf{Betreuerin: }}
		{\def\betreuerPräf{Betreuer: }
		\typeout{[Betreuer] Hinweis: Ungültiger Eintrag '#1', verwende default 'm'} } }
%
\newcommand{\Gruppe}[1]{\def\gruppe{#1}}
%
\newcommand{\autoreintrag}[3]{%
	\par\noindent
	\textbf{#1}\\
	#2\\
	\texttt{#3}\par\vspace{0.8em}}
\newcommand{\Autor}[3]{%
	\g@addto@macro\autorenverzeichnis{\autoreintrag{#1}{#2}{#3}}}
\newcommand{\Autorenverzeichnis}{%
	\section*{Autorenverzeichnis}
	\autorenverzeichnis}
%
\newcommand{\Matrikelnummer}[1]{\def\matrikelnummer{#1}}
\newcommand{\Strasse}[1]{\def\strasse{#1}}
\newcommand{\Ort}[1]{\def\ort{#1}}
\newcommand{\EMail}[1]{\def\email{#1}}
\newcommand{\Firmenname}[1]{\def\firmenname{#1}}
%
\newcommand{\Inhaltsverzeichnis}[1]{\def\loc{#1}}
\newcommand{\Abbildungsverzeichnis}[1]{\def\lof{#1}}
\newcommand{\Tabellenverzeichnis}[1]{\def\lot{#1}}
\newcommand{\Quellcodeverzeichnis}[1]{\def\lol{#1}}
\newcommand{\ErsteSeiteLeer}[1]{\def\esl{#1}}
\newcommand{\ZwischenSeiteLeer}[1]{\def\zsl{#1}}
\newcommand{\Deckblatt}[1]{\def\deckblatt{#1}}
\newcommand{\Autorenverzichnis}[1]{\def\autorenverzeichnisAnzeigen{#1}}
%
\newcommand{\Titelbilddatei}[1]{\def\titelbild{#1}}
\newcommand{\Abstractdatei}[1]{\def\abstract{#1}}
\newcommand{\Symbolverzeichnisdatei}[1]{\def\symbole{#1}}
\newcommand{\Danksagungdatei}[1]{\def\danksagung{#1}}
\newcommand{\Sperrvermerkdatei}[1]{\def\sperrvermerk{#1}}
\newcommand{\Firmenlogodatei}[1]{\def\firmenlogo{#1}}

% Kopfzeile
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{
 	\clearpairofpagestyles
 	\automark[section]{chapter} % automark beibehalten
 	\ihead{\kopfzeile\\\headmark}
 	\ohead{
		\includegraphics[height=30pt]{Ohm Logo.png}%
	\hspace{5pt} \pagemark
   	 }
 	\pagestyle{scrheadings}
}

% Seitenstil
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\defpagestyle{ABstyle}{
	{}{}{\hfill \pagemark}(0pt,0pt)
}
{
	{}{}{}
}
\renewcommand{\chapterpagestyle}{ABstyle}

% Intro
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\RPintro{

\ifthenelse{\equal{\arbeit}{n}} { % Wenn keine Arbeit, dann normales Intro

\ifthenelse{\equal{\esl}{j}} {
\thispagestyle{empty}
\null
\newpage}{
}% Ende ifthenelse ESL

\thispagestyle{empty}

\ifthenelse{\equal{\deckblatt}{j}} {
\ifthenelse{\equal{\titelbild}{}} {
\begin{center}
	\includegraphics[height=2cm]{VT Ohm Logo.png} \newline \newline
	\huge \textbf \thema \\
\vspace{0.5cm}
	\Large \textbf \art \\
\vspace{0.2cm}
	\normalsize \textbf \datum
\end{center}
}{
\begin{center}
	\huge \textbf \thema \newline \newline
	\includegraphics[height=10cm]{\titelbild} \newline \newline
	\Large \textbf \art \\
\vspace{0.2cm}
	\normalsize \textbf \datum
\end{center}
}% Ende ifthenelse Titelbild

\vfill

\ifthenelse{\equal{\gruppe}{}} {
\begin{tabularx}{\textwidth}{@{} r X @{}}
  \bearbeiterPräf & \bearbeitername \\
  \betreuerPräf   & \betreuername \\
\end{tabularx}
}{
\begin{tabularx}{\textwidth}{@{} r X @{}}
  Gruppe:     & \gruppe \\
  \bearbeiterPräf & \bearbeitername \\
  \betreuerPräf   & \betreuername \\
\end{tabularx}
}% Ende ifthenelse Gruppe

\vspace{1cm}

\begin{tabularx}{\textwidth}{@{} X X r @{}}
	Ort, Datum: \dotfill	& Unterschrift: \dotfill \\
					& \hfill (\verantwortlicherPräf) \hfill
\end{tabularx}

\pagebreak
}{}% Ende ifthenelse Deckblatt

\ifthenelse{\equal{\zsl}{j}} {
\thispagestyle{empty}
\newpage
\null}{
}% Ende ifthenelse ZSL

\pagestyle{ABstyle}

\ifthenelse{\equal{\abstract}{}} {
}{
\addchap*{Kurzfassung} \input{\abstract} \clearpage
}% Ende ifthenelse Abstract

\ifthenelse{\equal{\loc}{j}} {
\tableofcontents \null
}{  }% Ende ifthenelse LOC

\ifthenelse{\equal{\lof}{j}} {
\listoffigures \null
}{  }% Ende ifthenelse LOF

\ifthenelse{\equal{\lot}{j}} {
\listoftables \null
}{  }% Ende ifthenelse LOT

\ifthenelse{\equal{\symbole}{}} {
}{
\addchap*{Symbole} \input{\symbole} \clearpage
}% Ende ifthenelse Abstract

\pagestyle{scrheadings}

}% Ende für nicht Arbeit
{
Tja, den Teil hab ich noch nicht geschrieben.
}% Ende ifthenelse Arbeit

}% Ende RPintro


% Outro
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\RPoutro{

\Autorenverzeichnis

}% Ende RPoutro