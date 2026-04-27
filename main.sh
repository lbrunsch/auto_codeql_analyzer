#!/usr/bin/bash

DL_THREADS=100
CQL_THREADS=10

# PARTIE 1
./src/initialization.sh

nb_repos=$(jq 'length' java_repo.json)
echo "$nb_repos repos détéctés"

# PARTIE 2
./src/get_repos.sh "java_repo.json" $nb_repos $DL_THREADS

# PARTIE 3
./src/launch_codeql_analyze.sh $nb_repos $CQL_THREADS

# PARTIE 4
./src/create_sqlite_bd.sh $nb_repos

# PARTIE 5
./src/fill_db_with_json_infos.sh $nb_repos

# PARTIE 6
./src/fill_db_with_csv_infos.sh $nb_repos

