# RPreport: LaTeX-Vorlage für Praktikumsberichte und Abschlussarbeiten der Fak VT

## 🚀 Features
* **Modularer Aufbau:** Einfache Anpassung über die Hauptdatei und separate `.tex`-Dateien.
* **Vorkonfiguriert:** Inklusive gängiger Pakete für Zitate (BibLaTeX), Abbildungen und Quellcode-Formatierung.

---

## 📋 Voraussetzungen & Installation

Um diese Vorlage zu nutzen, benötigst du eine aktuelle LaTeX-Distribution (z. B. TeX Live, MiKTeX oder MacTeX) sowie einen Editor deiner Wahl (z. B. Texstudio, VS Code) oder einen Online-Editor wie Overleaf.

1. Klicke oben rechts auf **Code** -> **Download ZIP** (oder klone das Repo via Git).
2. Entpacke den Ordner auf deinem Computer.
3. **Wichtig bezüglich des Logos:** Aus rechtlichen Gründen ist das offizielle Logo der Hochschule nicht im Repository enthalten. 
   * Lade das offizielle Logo im PNG-Format von der Website der Hochschule herunter: https://d.th-nuernberg.de/ohm-logo-rot/
   * Benenne die Datei in "Ohm Logo.png" um und speichere sie im Ordner.
   * Auf dem Titelblatt wird auch das Ohm-Logo mit "Fakultät Verfahrenstechnik" daneben verwendet. Wenn es das nicht mehr gibt, kopiere einfach das Ohm-Logo und benenne es noch in "VT Ohm Logo.png" um.
   In Zukunft werde ich es umstellen, dass das optional sein wird.

---

## 🛠️ Benutzung & Struktur

Die Struktur des Projekts ist wie folgt aufgebaut:

* `Bericht.tex` - Die Hauptdatei. Hier wird alles eingestellt. Von hier aus wird auch kompiliert.
* `RPreport.cls` - Die Dokumentenklasse, die das gesamte Layout (Ränder, Schriftarten, Kopfzeilen) regelt. **(Hier nur Änderungen vornehmen, wenn du weißt, was du tust!)**
* `Literatur.bib` - Deine Literaturdatenbank für Zitate.
* Andere .tex Dateien werden über \include in Bericht.tex eingebunden.

## Download

Du brauchst nur die folgenden Dateien, um den Bericht, so wie er gerade ist, erfolgreich zu erstellen:
* `Abstract.tex`
* `Anhang.tex`
* `Bericht.tex`
* `Einleitung.tex`
* `Kapitel 1.tex`
* `Literatur.bib`
* `Ohm Logo.png`
* `RPreport.cls`
* `Symbole.tex`
* `VT Ohm Logo.png`
* `Zusammenfassung.tex`

**Du kannst dir aber auch die Extra-Kapitel wie Abstract, Symbole, ... sparen, dann musst du sie nur in der Präambel von Bericht.tex rausnehmen.**
Die ganz abgespeckte Version ist:
* `Bericht.tex`
* `Ohm Logo.png`
* `RPreport.cls`
* `VT Ohm Logo.png`

### Kompilieren
Nutze **biber** (für das Literaturverzeichnis) um das Dokument zu erstellen.

---

## 📄 Lizenz
Hab mir noch keine Gedanken dazu gemacht.
