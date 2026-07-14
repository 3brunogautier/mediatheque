# Ma Médiathèque

Application de référencement de DVD, Blu-ray, 4K UHD et éditions collector.

## Stack

- HTML/CSS/JS vanilla (aucun build, aucune dépendance à installer)
- [Supabase](https://supabase.com) comme base de données (REST API)
- [TMDB](https://www.themoviedb.org/) pour la recherche de films, affiches, synopsis

## Déploiement sur GitHub Pages

1. Crée un nouveau dépôt GitHub (public ou privé) et pousse ce dossier dedans :

   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/TON_USER/TON_REPO.git
   git push -u origin main
   ```

2. Dans le dépôt sur GitHub : **Settings → Pages**
   - Source : `Deploy from a branch`
   - Branch : `main` / dossier `/ (root)`
   - Sauvegarder.

3. Après 1-2 minutes, ton site est disponible à :
   `https://TON_USER.github.io/TON_REPO/`

Aucune fonction serveur n'est nécessaire : tout le code (recherche TMDB, lecture/écriture Supabase) s'exécute directement dans le navigateur.

## Notes

- Les clés Supabase et TMDB utilisées sont des clés publiques côté client (anon key / clé publique TMDB), c'est normal qu'elles soient visibles dans le code source.
- Pense à configurer les règles RLS (Row Level Security) sur ta table `films` dans Supabase si ce n'est pas déjà fait, pour contrôler qui peut lire/écrire.

## ⚠️ Étape requise : créer la table wishlist

La fonctionnalité "Mes futurs achats" a besoin d'une table `wishlist` dans Supabase qui n'existait pas encore.

1. Va sur https://supabase.com/dashboard → ton projet → **SQL Editor** → **New query**
2. Colle le contenu du fichier `supabase_wishlist_table.sql` fourni avec ce projet
3. Clique **Run**

Sans cette étape, le bouton "+ Ajouter" de la section souhaits affichera une erreur.

## Correctifs apportés (juillet 2026)

Le fichier `index.html` récupéré depuis Netlify était tronqué (export incomplet) : plusieurs fonctions manquaient (`esc`, `showToast`, les logos de support, toute la logique "wishlist"), et le chargement initial des films (`loadFilms()`) n'était jamais déclenché — d'où l'app qui semblait vide et les boutons qui ne répondaient pas. Tout a été reconstruit à l'identique de la structure HTML/CSS existante. Tes données dans Supabase n'ont jamais été affectées.
