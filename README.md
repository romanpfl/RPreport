<div align="center">

  <!-- Logo -->
  <img src="Bilder/RPdoc.png" alt="RPdoc Logo" height="110">

  # RPdoc – LaTeX Document Class

  <p>
    <b>Eine moderne, flexible KOMA-Script Vorlage für wissenschaftliche Arbeiten, Berichte und Projekte.</b>
  </p>

  <!-- Badges -->
  <p>
    <a href="https://github.com/romanpfl/RPreport/blob/main/LICENSE">
      <img src="https://img.shields.io/github/license/romanpfl/RPreport?style=flat-square&color=1e293b" alt="License">
    </a>
    <img src="https://img.shields.io/badge/LaTeX-KOMA--Script-008080?style=flat-square" alt="LaTeX KOMA-Script">
    <img src="https://img.shields.io/badge/Engine-LuaLaTeX%20%2F%20pdfLaTeX-blue?style=flat-square" alt="Engine">
  </p>

  ---

</div>

## Voraussetzungen & Installation

Um diese Vorlage zu nutzen, benötigst du eine aktuelle LaTeX-Distribution (z. B. TeX Live, MiKTeX oder MacTeX) sowie einen Editor deiner Wahl (z. B. TexStudio, VS Code) oder einen Online-Editor wie Overleaf.

1. Klicke oben rechts auf **Code** -> **Download ZIP** (oder klone das Repo via Git).
2. Entpacke den Ordner auf deinem Computer.
3. Öffne main.tex und kompiliere es. Es sollte ein pdf erzeugt werden.

> [!CAUTION]
> An manchen Stellen wird das Ohm Logo erwartet, z.B. wenn man einstellt, dass das Logo in der Kopfzeile erscheinen soll.
> Ich darf das Ohm-Logo hier nicht veröffentlichen, das muss aber im Order `Bilder` als `OhmLogo.png` liegen!
> Bitte lade dir das Logo von der [offiziellen Seite](https://d.th-nuernberg.de/ohm-logo-rot/) der TH runter und lege es umbenannt dort ab!
> Als Platzhalter ist das RPdoc Logo hinterlegt. Solange das existiert sollte sich das Dokument ohne Fehler erstellen lassen!

> [!NOTE]
> Ich habe neben dem Ohm Logo auch noch das VT-spezifische Ohm Logo in `Bilder` liegen.
> Das verwende ich einfach als Titelfoto. Es ist aber nicht notwendig.

---

## Struktur

Die Struktur des Projekts ist wie folgt aufgebaut:

* `Bericht.tex`: Die Vorlage für Laborberichte
* `Arbeit.tex`: Die Vorlage für Abschlussarbeiten
* `RPdoc.cls`: Die Klasse, die die Formatierung und Titelseite übernimmt
* `Bilder/OhmLogo.png`: Das Ohm Logo ist notwendig

Die anderen Dateien sind nur als Beispiel/Vorlage schon eingebaut, aber nicht notwenig.

## Benutzung

Die `documentclass` ist immer `RPdoc`. Für weitere Details werden Parameter `[]` übergeben.
`bericht` / `arbeit`: Unterscheidet zwischen Formatierung für Bericht oder Abschlussarbeit
Alle weiteren Parameter steuern bestimmte Eigenschaften.
Es gibt aber auch weiter unten noch Befehle, mit denen Anpassungen gemacht werden können.

> [!IMPORTANT]
> Bei Fehlern zeigt der Texteditor schon oft das Problem an.
> Wenn das aber unverständlich ist, kann man noch einen Blick ins Compiler-Log werfen.
> Um nachzuvollziehen, was die Klasse macht, kann man im Dokument nach "RPdocDEBUG" suchen.

### Infos zum Kompilieren

Die Vorlage nutzt BibLaTeX mit dem Backend **biber** für ein modernes und fehlerfreies Literaturverzeichnis. 

* **Standard-Compiler:** Nutze `pdflatex` (oder `lualatex`) in Kombination mit `biber`. Ich habe `TeX Live` installiert, wo das alles schon enthalten ist. `MikTeX` sollte auch funktionieren.
* **VS Code Benutzer:** Die Erweiterung *LaTeX Workshop* erkennt die Struktur meist automatisch. Falls das Literaturverzeichnis nicht angezeigt wird, wechsle in der linken Leiste auf das LaTeX-Symbol und führe `pdflatex -> biber -> pdflatex (x2)` oder `latexmk` aus.
* **Unerklärliche Fehlermeldungen:** Falls der Compiler alte Pfade cached, hilft es, die temporären Hilfsdateien zu löschen.

---

> [!TIP]
> Es gibt auch eine LaTeX Vorlage im [repo](https://github.com/th-nuernberg/thesis-template/) der Hochschule.
> Mir hat sie nicht gefallen, deswegen habe ich meine eigene geschrieben.

## Quick Start Guide

> [!TIP]
> Wenn du keine Option findest mit der du zufrieden bist, kannst du auch jederzeit die Einstellungen in der Präambel (vor `\begin{document}`) mit Commands wie `\renewcommand` überschreiben.
> Also Schriftgröße, Schriftart, Seiten- oder Zeilenabstände etc.

> #### Hinweis
> Es gibt optionale Befehle wie `\TitelGr{}` die in den Vorlagen nicht verwendet werden, aber eingefügt werden können.
> Mit `\TitelGr{\LARGE}` kann man die Titelgröße anpassen.
> Entsprechend `\UntertitelGr{\large}`,`\ChapterGr{\LARGE}`, `\SectionGr{\Large}` und `\SubsectionGr{\large}`
> Verfügbare Größen: `\normalsize` `\large` `\Large` `\LARGE` `\huge` `\Huge`. Das Feld darf nicht leer sein.