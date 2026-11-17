# Qwixx – PWA mit Online-Modus (Supabase)

## Einrichten
1. Auf supabase.com ein kostenloses Projekt anlegen.
2. Project Settings → API: **Project URL** und **publishable/anon key** kopieren.
3. Beide in `config.js` eintragen (ist bereits ausgefüllt).
4. Den ganzen Ordner auf einen HTTPS-Webserver legen (z. B. GitHub Pages, Netlify, Cloudflare Pages).
5. Auf dem iPhone in Safari öffnen → Teilen → „Zum Home-Bildschirm“.

Es werden keine Tabellen und kein SQL gebraucht. Der Online-Modus nutzt nur
Supabase Realtime (Presence). Der Key ist öffentlich vorgesehen.

## Spielen
- Solo: Würfeln, Felder antippen. Der Spielstand bleibt gespeichert.
- Mehrspieler: Personen-Icon antippen, Namen eingeben. Einer tippt „Neuer Raum“
  und gibt den Code weiter, alle anderen geben denselben Code ein und tippen „Beitreten“.
  Nur wer gewürfelt hat, tippt „Fertig“, dann würfelt der Nächste.
  Wer rausfliegt oder die App neu startet, kommt automatisch wieder in den Raum.
  Jeder sieht nur seine eigenen Würfel, die weiße Summe steht am Namen.
- Einstellungen: Design, Sprachansagen, Regeln prüfen.

## Update
Die Build-Nummer steht in den Einstellungen. Nach jeder Änderung an einer Datei in `sw.js` die Zahl bei `CACHE` erhöhen,
sonst zeigt die PWA die alte Version.
