# Qwixx – PWA mit Online-Modus (Supabase)

## Einrichten
1. Auf supabase.com ein kostenloses Projekt anlegen.
2. Project Settings → API: **Project URL** und **anon public key** kopieren.
3. Beide in `config.js` eintragen.
4. Ordner auf einen HTTPS-Webserver legen (z. B. GitHub Pages, Netlify, Cloudflare Pages).
5. Auf dem iPhone in Safari öffnen → Teilen → „Zum Home-Bildschirm“.

Es werden keine Tabellen und kein SQL gebraucht. Der Online-Modus nutzt nur
Supabase Realtime (Presence). Der anon-Key ist öffentlich vorgesehen.

## Spielen
Personen-Icon unten antippen, Namen eingeben, einer erstellt einen Raum und
gibt den Code weiter, die anderen treten mit demselben Code bei.

Hinweis: Nach einer Änderung an `config.js` oder anderen Dateien in `sw.js`
die Zahl bei `CACHE` erhöhen, sonst zeigt die PWA die alte Version.
