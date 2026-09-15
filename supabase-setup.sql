-- Rode este script no Supabase: Painel do projeto > SQL Editor > New query > Run

create table if not exists products (
  id text primary key,
  name text not null,
  category text not null,
  price text not null,
  description text,
  image text,
  created_at timestamp with time zone default now()
);

alter table products enable row level security;

-- Permite que o site (chave anon/pública) leia os produtos
create policy "Public read access" on products
  for select using (true);

-- Permite que o site insira, edite e apague produtos
-- (a proteção de quem pode editar é feita pela senha da "área da confeiteira" no próprio site,
-- não pelo Supabase — veja o aviso de segurança no README)
create policy "Public insert access" on products
  for insert with check (true);

create policy "Public update access" on products
  for update using (true);

create policy "Public delete access" on products
  for delete using (true);
