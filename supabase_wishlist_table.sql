-- À exécuter dans Supabase : Dashboard → SQL Editor → New query → coller → Run
-- Crée la table "wishlist" utilisée par la fonctionnalité "Mes futurs achats"

create table if not exists public.wishlist (
  id uuid primary key default gen_random_uuid(),
  titre text not null,
  "titreOriginal" text,
  annee text,
  real text,
  synopsis text,
  poster text,
  support text,
  "tmdbId" bigint,
  created_at timestamptz default now()
);

-- Active RLS (comme pour la table films) et autorise l'accès via la clé publique
alter table public.wishlist enable row level security;

create policy "public access wishlist"
  on public.wishlist
  for all
  using (true)
  with check (true);
