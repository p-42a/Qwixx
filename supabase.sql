-- Qwixx: Spielstand für Mehrspieler-Räume
-- Einmal im Supabase SQL-Editor ausführen (SQL Editor → New query → einfügen → Run).

create table if not exists public.qwixx_rooms (
  code       text primary key,          -- Raumcode
  g          bigint not null default 0, -- Spiel-Nummer (ändert sich bei „Neues Spiel“)
  seq        int    not null default 0, -- Wurf-Nummer
  roller     text   not null default '',-- wer zuletzt gewürfelt hat
  v          int[],                     -- Würfelwerte des letzten Wurfs
  done       int    not null default 0, -- Wurf-Nummer, für die „Fertig“ getippt wurde
  updated_at timestamptz not null default now()
);

alter table public.qwixx_rooms enable row level security;

drop policy if exists "qwixx lesen"   on public.qwixx_rooms;
drop policy if exists "qwixx anlegen" on public.qwixx_rooms;
drop policy if exists "qwixx ändern"  on public.qwixx_rooms;

create policy "qwixx lesen"   on public.qwixx_rooms for select to anon, authenticated using (true);
create policy "qwixx anlegen" on public.qwixx_rooms for insert to anon, authenticated with check (true);
create policy "qwixx ändern"  on public.qwixx_rooms for update to anon, authenticated using (true) with check (true);

-- Live-Änderungen an die App schicken
do $$
begin
  alter publication supabase_realtime add table public.qwixx_rooms;
exception when duplicate_object then null;
end $$;
