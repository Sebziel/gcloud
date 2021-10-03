# gcloud
Repository for purpose of google cloud platform training

Further projects ToDo's related with Gcloud:


1.	GCP – Sprwadzić czy lokalnie zapisane pliki na VM usuwają się przy usunięciu VM, i czy przy włączonej opcji zachowywania dysku pliki pozostaną po usunięciu maszyny
2.	GCP – Postawić monitoring z alertami na część resourców, w tym memory utilization, i jakieś inne fancy wymagające agenta
3.	GCP – Postawić aplikacje w App enginie, która wrzucałaby dane do bazy SQL. 
a.	Najpierw mogą być te same mockowe dane, wrzucane przy pomocy scheduler’a
b.	Ściągać curlem dane z Kibany i wrzucać je do bazy 
i.	Najpierw napisać pythona, który regularnie by ściągał dane i zapisywał je lokalnie
4.	GCP sprawdzić jak rsync’em do GCS dodawać nowe pliki (Tylko dodwać, nie tak żeby synchronizować dane), potenacjalnie z jakimś versioningiem. 
5.	GCP – Feedować stare wersje plików z GCS w innym bukcecie z timestampem, tak żeby były bardziej przejrzyste
6.	GCP – Regularne wrzucanie logów systemowych do storeg’u. (cron + script/ zbadać opcje agenta) [ https://googlepluralsight.qwiklabs.com/focuses/13711038?parent=lti_session – fajnie opisane w qwiki labs’ach z minecraftem, w pluralsighcie jest to szkolenie „Essential Cloud Infrastructure: Foundation” w labie working with virtual machines]
7.	GCP - Startup script, który zmapuje istniejący dysk
8.	GCP – Startup script, który wrzuci klucz publiczny do maszyny, tak żęby z automatu można było połączyć się po SSH z danego prywatnego klucza. (Opcjonalnie wrzucić liste publicznych kluczy do Storeg’u)


