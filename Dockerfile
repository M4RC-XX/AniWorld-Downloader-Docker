# Zeile 1: Das Fundament. Wir starten mit einem minimalen Linux (Debian Bookworm)
# das bereits Python 3.11 installiert hat. Dieses Image ist "multi-arch" und
# funktioniert daher auch auf deinem Raspberry Pi 5 (ARM64).
FROM python:3.11-slim-bookworm

# Zeile 2: Setzt zwei Umgebungsvariablen, damit Python im Container sauber läuft
# und keine unnötigen Dateien anlegt.
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Zeile 3: Installiert zusätzliche Software, die das Programm braucht.
# 'apt-get' ist der Paketmanager von Debian. Wir installieren hier 'ffmpeg',
# ein Tool, das zum Verarbeiten von Videodateien (also den Downloads) benötigt wird.
RUN apt-get update && apt-get install -y --no-install-recommends ffmpeg && rm -rf /var/lib/apt/lists/*

# Zeile 4: Legt ein Arbeitsverzeichnis im Inneren des Containers an.
# Alle folgenden Befehle werden von diesem Ordner aus ausgeführt.
WORKDIR /app

# Zeile 5: Kopiert die Projektdateien von deinem Computer in das
# Arbeitsverzeichnis des Containers. Wir kopieren nur das Nötigste.
COPY pyproject.toml .
COPY src ./src
COPY README.md .

# Zeile 6: Installiert die Python-Anwendung selbst. Der Befehl 'pip install .'
# liest die 'pyproject.toml'-Datei und installiert alle Abhängigkeiten,
# die im Projekt definiert sind (wie z.B. yt-dlp).
RUN pip install --no-cache-dir .

# Zeile 7: Erstellt einen Ordner für die heruntergeladenen Anime-Folgen
# und deklariert ihn als "Volume". Das ist wichtig! Ein Volume ist wie ein
# gemeinsamer Ordner zwischen deinem Raspberry Pi und dem Container.
# So bleiben deine Downloads erhalten, auch wenn der Container neu gestartet wird.
RUN mkdir /app/downloads
VOLUME /app/downloads

# Zeile 8 & 9: Das ist der Standardbefehl, der ausgeführt wird, wenn der Container startet.
# 'ENTRYPOINT' ist der Befehl selbst ("aniworld").
# 'CMD' sind die Standard-Argumente dafür. Hier starten wir das interaktive Menü
# und sagen dem Programm, es soll alles im Volume-Ordner speichern.
ENTRYPOINT ["aniworld"]
CMD ["--output-dir", "/app/downloads"]
