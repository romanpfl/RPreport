# RPreport: LaTeX-Vorlage für Praktikumsberichte und Abschlussarbeiten

## Voraussetzungen & Installation

Um diese Vorlage zu nutzen, benötigst du eine aktuelle LaTeX-Distribution (z. B. TeX Live, MiKTeX oder MacTeX) sowie einen Editor deiner Wahl (z. B. Texstudio, VS Code) oder einen Online-Editor wie Overleaf.

1. Klicke oben rechts auf **Code** -> **Download ZIP** (oder klone das Repo via Git).
2. Entpacke den Ordner auf deinem Computer.
3. Öffne main.tex und kompiliere es. Es sollte ein pdf erzeugt werden.

Die offizielle Seite für das Ohm Logo ist: [Ohm Logo rot](https://d.th-nuernberg.de/ohm-logo-rot/)
In diesem Dokument muss es allerdings den Namen `OhmLogo` haben und im Ordner `Bilder` liegen!

> [!NOTE]
> Ich habe neben dem Ohm-Logo auch noch das VT-spezifische Logo in `Bilder` liegen.
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
Alle weiteren Parameter sind Wahr/Falsch Werte, um bestimmte Eigenschaften zu steuern.

> [!IMPORTANT]
> Die Vorlage für die Abschlussarbeit ist noch nicht fertig.

### Infos zum Kompilieren

Die Vorlage nutzt BibLaTeX mit dem Backend **biber** für ein modernes und fehlerfreies Literaturverzeichnis. 

* **Standard-Compiler:** Nutze `pdflatex` (oder `lualatex`) in Kombination mit `biber`. Ich habe `TeX Live` installiert, wo das alles schon enthalten ist. `MikTeX` sollte auch funktionieren.
* **VS Code Benutzer:** Die Erweiterung *LaTeX Workshop* erkennt die Struktur meist automatisch. Falls das Literaturverzeichnis nicht angezeigt wird, wechsle in der linken Leiste auf das LaTeX-Symbol und führe das Rezept `pdflatex -> biber -> pdflatex (x2)` oder `latexmk` aus.
* **Fehlermeldungen nach dem Verschieben von Bildern?** Falls der Compiler alte Bildpfade cached, hilft es, die temporären Hilfsdateien zu löschen.
* **Aktualisierungsfehler:** Die Hilfsdateien zu löschen ist generell eine gute Idee sobald man irgendwelche Probleme hat.

---

## FAQ

#### Warum wird die Kopfzeile nicht auf der Seite der Kapitelüberschrift angezeigt?
Das ist ein bewusster typografischer Standard in LaTeX (Klasse `scrreprt`). Große Überschriften stehen für sich. Wer das zwingend ändern möchte, muss den Seitenstil der Kapitelstarts in der `.cls`-Datei anpassen.

#### Meine Änderungen an Bildern oder Verzeichnissen werden nicht übernommen?
LaTeX speichert Zwischenstände in `.aux`- und `.log`-Dateien. Lösche diese einfach einmalig aus deinem Projektordner und kompiliere das Dokument komplett neu.

---

> [!TIP]
> Es gibt auch eine LaTeX Vorlage im [repo](https://github.com/th-nuernberg/thesis-template/) der Hochschule.
> Mir hat sie nicht gefallen, deswegen habe ich meine eigene geschrieben.
