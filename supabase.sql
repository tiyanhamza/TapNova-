create extension if not exists pgcrypto;
create table if not exists profiles (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  name text not null, description text default '', logo_url text default '',
  phone text default '', whatsapp text default '', instagram text default '',
  facebook text default '', tiktok text default '', address text default '',
  maps_url text default '', website text default '', hours text default '',
  category text default '', email text default '', cover_url text default '', color text default '#1F5FFF',
  links jsonb default '[]'::jsonb,
  published boolean not null default false, active boolean not null default true,
  created_at timestamptz not null default now()
);
-- RLS activé sans aucune règle : la clé publique (anon) n'a AUCUN accès. Seules les fonctions serveur (clé service) lisent/écrivent.
alter table profiles enable row level security;

-- Si vous aviez déjà exécuté l'ancienne version, exécutez aussi :
alter table profiles add column if not exists category text default '', add column if not exists email text default '', add column if not exists cover_url text default '', add column if not exists color text default '#1F5FFF';
