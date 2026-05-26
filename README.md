# Stack-musique
Self host de ma musique avec accès distant
Installation hautement basée sur l'installation de u/KnifinLTD2 [Lien](https://www.reddit.com/r/selfhosted/comments/1tjalq8/my_spotify_replacement_setup_navidrome_lidarr/)

## Prè-requis
- Avoir créer un compte sur `https://listenbrainz.org/` et avoir connecté le compte MusicBrainz a ListenBrainz.
- Avoir installé l'app windows Soulseek via `https://www.slsknet.org/news/node/1` et avoir créer un compte. Soulseek peut etre diretement désinstallé.

## Installation
Apres avoir cloner le repo et avoir rempli le fichier .env avec les données adéquates, il est nécessaire de créer le dossier incomplete et de donner les droits d'écriture sur le sous dossier:

```
mkdir srv/data/slskd/incomplete
```
et 
```
chown -R 1000:1000 ./srv/data/
```
Puis faire un docker compose up -d, les containers devraient tous démarrer et sont accesibles aux ports suivants:
- slskd: http://<ip serveur>:5030
- lidarr: http://<ip serveur>:8686
- Navidrome http://<ip serveur>:4533
- Music-grabber http://<ip serveur>:38274 (en local, sinon 8080)

### Configuration lidarr
Installer dans `System -> Plugins` le plugin Tubifarry via `https://github.com/TypNull/Tubifarry`

Configurer un indexer dans `Settings -> Indexers` et selectionner slskd puis configurer:
- URL avec `http://slskd:5030`
- API Key avec la clé api générée plutot pour le .env
Tester puis sauvegarder.

Configurer un indexer dans `Settings -> Download Clients` et selectionner slskd puis configurer:
- URL avec `http://slskd:5030`
- API Key avec la clé api générée plutot pour le .env
Tester puis sauvegarder.

Aller dans `Settings -> Media management` cliquer sur `Root folder` et créer un fichier avec comme racine `/data/media/music`

### Configuration Aurral

### Configuration Navidrome

Récupérer le token utilisateur sur [ListenBrainz](https://listenbrainz.org/settings/).  
Aller dans `Profil -> personal` et activer `Scrobble to ListenBrainz` pour avoir les recommendations via l'algo Listenbrainz.  
Coller le token récupérer précedamment dans la pop-up.  

### Configuration Music-grabber

## Exposition