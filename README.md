# NameStyle Plus

Addon für die Fabric-Mod **NameStyle** (Minecraft 26.2, nur Client).

## Was es macht
- **Tags** können einzeln **fett / kursiv / unterstrichen** sein (Tab TAGS, Buttons B / I / U).
- Neue **schwarz-weiße Oberfläche** statt Minecraft-Optik (öffnet sich wie gewohnt mit `/namestyle`).
- Eigener Tab **SÄTTIGUNG** mit Regler (0 % = schwarz-weiß, 100 % = Original, 200 % = maximal satt). Gilt für Name und Tags, auch in Tab-Liste und Chat.

## Jar bauen (GitHub)
1. Alle Dateien dieses Ordners in ein GitHub-Repo hochladen (inkl. `.github` und `libs`).
2. Im Repo auf **Actions** gehen. Der Build startet automatisch (oder **Run workflow**).
3. Wenn er grün ist: auf den Lauf klicken und unten unter **Artifacts** `NameStylePlus-jar` herunterladen.
4. Die Jar zusammen mit `namestyle-1.0.0.jar` und Fabric API in den `mods`-Ordner legen.

Ist der Build rot, den Fehlertext im Log kopieren und mir schicken.

## Config
`config/namestyle-plus.json` (Tag-Stile und Sättigung). Die Einstellungen der Originalmod bleiben in `namestyle.json`.
