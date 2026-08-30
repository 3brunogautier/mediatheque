-- À exécuter dans Supabase : Dashboard → SQL Editor → New query → coller → Run
-- Crée la table "vinted_favoris" utilisée par le nouvel onglet Vinted

create table if not exists public.vinted_favoris (
  id uuid primary key default gen_random_uuid(),
  titre text,
  url text not null,
  prix text,
  photo text,
  created_at timestamptz default now()
);

alter table public.vinted_favoris enable row level security;

drop policy if exists "public access vinted_favoris" on public.vinted_favoris;
create policy "public access vinted_favoris"
  on public.vinted_favoris
  for all
  using (true)
  with check (true);

notify pgrst, 'reload schema';
