# Catálogo — Graciele Cunha Confeitaria

Site de catálogo (uma página só, `index.html`) com pedidos via WhatsApp. Os produtos (nome, preço, foto, descrição) ficam salvos em um banco de dados Supabase, então qualquer pessoa que abrir o site vê as atualizações feitas pela confeiteira.

## Passo 1 — Criar o banco no Supabase (grátis)

1. Crie uma conta em [supabase.com](https://supabase.com) e clique em **New project**.
2. Espere o projeto ser criado (leva cerca de 1 minuto).
3. No menu lateral, vá em **SQL Editor** → **New query**, cole o conteúdo do arquivo `supabase-setup.sql` (que está nesta pasta) e clique em **Run**. Isso cria a tabela `products` já com os produtos de exemplo.
4. Vá em **Project Settings → API**. Copie:
   - **Project URL**
   - **anon public key**
5. Abra o arquivo `index.html` desta pasta em um editor de texto, procure por estas duas linhas (bem no início do `<script>`, é só usar Ctrl+F):
   ```js
   const SUPABASE_URL = "SUBSTITUA_PELA_SUA_SUPABASE_URL";
   const SUPABASE_ANON_KEY = "SUBSTITUA_PELA_SUA_SUPABASE_ANON_KEY";
   ```
   Substitua pelos valores copiados do painel do Supabase e salve o arquivo.

⚠️ **Aviso de segurança**: a "anon public key" do Supabase fica visível no código do site (isso é normal e esperado para esse tipo de projeto). As regras que criamos no banco (`supabase-setup.sql`) permitem que qualquer pessoa com essa chave leia e também escreva na tabela `products` — a única proteção contra edições indevidas é a senha da "área da confeiteira" **dentro do site**, não uma proteção no banco em si. Para um catálogo de confeitaria isso é um risco baixo, mas se você quiser reforçar depois (por exemplo, exigir autenticação real para escrever), me avise que ajusto.

## Passo 2 — Colocar no GitHub

1. Crie um repositório novo no GitHub (público ou privado).
2. Envie os arquivos desta pasta (`index.html`, `render.yaml`, `supabase-setup.sql`, este `README.md`) para o repositório — pelo GitHub em **Add file → Upload files**, ou via linha de comando:
   ```
   git init
   git add .
   git commit -m "Primeira versão do catálogo"
   git branch -M main
   git remote add origin URL_DO_SEU_REPOSITORIO
   git push -u origin main
   ```

## Passo 3 — Hospedar no Render.com

1. Entre em [render.com](https://render.com) (dá pra usar login do GitHub).
2. Clique em **New +** → **Static Site**.
3. Selecione o repositório criado.
4. Configure:
   - **Build Command**: deixe em branco
   - **Publish directory**: `.`
5. Clique em **Create Static Site**. Em cerca de 1 minuto o Render gera um link tipo `https://catalogo-graciele-cunha.onrender.com` — esse é o link para compartilhar com os clientes.

Se preferir, o `render.yaml` já incluso permite usar **New + → Blueprint** no Render, que lê essa configuração automaticamente.

## Área da confeiteira

No rodapé do site tem o link "área da confeiteira" — a senha para editar produtos (nome, preço, descrição e foto) é a combinação definida com o Gustavo. Guarde essa senha com cuidado.

## Observações

- O número de WhatsApp usado nos botões está fixo no código (`WHATSAPP_NUMBER`, logo abaixo das configurações do Supabase em `index.html`). Para trocar, edite esse valor.
- As fotos dos produtos são comprimidas automaticamente antes de salvar, então não é necessário se preocupar com o tamanho das imagens tiradas pelo celular.
