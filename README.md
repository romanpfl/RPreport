# RPreport: LaTeX-Vorlage für Praktikumsberichte und Abschlussarbeiten der Fak VT

## Voraussetzungen & Installation

Um diese Vorlage zu nutzen, benötigst du eine aktuelle LaTeX-Distribution (z. B. TeX Live, MiKTeX oder MacTeX) sowie einen Editor deiner Wahl (z. B. Texstudio, VS Code) oder einen Online-Editor wie Overleaf.

1. Klicke oben rechts auf **Code** -> **Download ZIP** (oder klone das Repo via Git).
2. Entpacke den Ordner auf deinem Computer.
3. Öffne main.tex und kompiliere es. Es sollte ein pdf erzeugt werden.

**Wichtig bezüglich des Ohm-Logos:** Aus rechtlichen Gründen ist das offizielle Logo der Hochschule nicht im Repository enthalten. 
   * Lade das offizielle Logo im PNG-Format von der Website der Hochschule herunter: [Ohm Logo rot](https://d.th-nuernberg.de/ohm-logo-rot/)
   * Benenne die Datei in `OhmLogo.png` um und speichere sie im Ordner `Bilder` ab.
   * Auf dem Titelblatt wird standardmäßig das Ohm-Logo mit "Fakultät Verfahrenstechnik" daneben gesucht. Das muss unter dem Namen `VTOhmLogo.png` in den Bilder-Ordner. Dafür konnte ich aber keinen Link finden. Keine Sorge: Wenn du das Bild nicht hast, wird automatisch auf das Ohm Logo zurückgegriffen.

---

## Benutzung & Struktur

Die Struktur des Projekts ist wie folgt aufgebaut:

* `main.tex` - Die Hauptdatei. Hier wird alles eingestellt. Von hier aus wird auch kompiliert.
* `RPreport.cls` - Die Dokumentenklasse, die das gesamte Layout (Ränder, Schriftarten, Kopfzeile, Titelblatt) regelt. **(Hier nur Änderungen vornehmen, wenn du weißt, was du tust!)**
* `Literatur.bib` - Deine Literaturdatenbank für Quellen.
* `Bilder` - Zur Übersichtlichkeit habe ich dafür einen extra Ordner gemacht. Bei \includegraphics muss dann aber Bilder/Name.xyz geschrieben werden. Man kann die Bilder auch im      Überordner mit ablegen
* Andere .tex Dateien werden über \include in main.tex eingebunden.

## Minimaler Download

**Du kannst dir die Extra-Kapitel wie Abstract, Symbole, etc. sparen, dann musst du sie nur in der Präambel von main.tex rausnehmen.**
Die ganz abgespeckte Version ist:
* `main.tex`
* `RPreport.cls`
* `OhmLogo.png` (oder ein anderes Bild für Kopfzeile und )

---

### Infos zum Kompilieren

Die Vorlage nutzt BibLaTeX mit dem Backend **biber** für ein modernes und fehlerfreies Literaturverzeichnis. 

* **Standard-Compiler:** Nutze `pdflatex` (oder `lualatex`) in Kombination mit `biber`.
* **VS Code Benutzer:** Die Erweiterung *LaTeX Workshop* erkennt die Struktur meist automatisch. Falls das Literaturverzeichnis nicht angezeigt wird, wechsle in der linken Leiste auf das LaTeX-Symbol und führe das Rezept `pdflatex -> biber -> pdflatex (x2)` oder `latexmk` aus.
* **Fehlermeldungen nach dem Verschieben von Bildern?** Falls der Compiler alte Bildpfade cached, hilft es, die temporären Hilfsdateien zu löschen (`Clean up auxiliary files` im Editor) und neu zu bauen.
* **Aktualisierungsfehler:** Die Hilfsdateien zu löschen ist generell eine gute Idee sobald man irgendwelche Probleme hat. Die dann einfach neu erstellen lassen.

---

## FAQ

#### Warum wird die Kopfzeile nicht auf der Seite der Kapitelüberschrift angezeigt?
Das ist ein bewusster typografischer Standard in LaTeX (Klasse `scrreprt`). Große Überschriften stehen für sich. Wer das zwingend ändern möchte, muss den Seitenstil der Kapitelstarts in der `.cls`-Datei anpassen.

#### Meine Änderungen an Bildern oder Verzeichnissen werden nicht übernommen?
LaTeX speichert Zwischenstände in `.aux`- und `.log`-Dateien. Lösche diese einfach einmalig aus deinem Projektordner und kompiliere das Dokument komplett neu.

---

## 📄 Lizenz (MIT License)

Dieses Projekt ist unter der **MIT-Lizenz** lizenziert. Das bedeutet für dich: Du darfst die Vorlage absolut kostenlos nutzen, für deine Arbeit anpassen, teilen und verändern.

```text
Copyright (c) 2026 Roman Pfleger

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.