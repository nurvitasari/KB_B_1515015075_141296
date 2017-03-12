PREDICATES 
nondeterm target(symbol,symbol)
nondeterm senin(symbol,symbol)
nondeterm kamis(symbol,symbol)
nondeterm minggu(symbol,symbol)
nondeterm seluruhnya(symbol,symbol)
nondeterm melakukan (symbol,symbol)

CLAUSES
target(dinda,anak_sekolah).
target(fika,irt).
target(oliv,mahasiswa).

senin(jlmargasari,sore).
kamis(jljembayan,petang).
minggu(jlbangunsari,tengahmalam).


seluruhnya(Lokasi,Waktu):-
senin(Lokasi,Waktu);
kamis(Lokasi,Waktu);
minggu(Lokasi,Waktu).


melakukan(pembegalan,balokkayu).
melakukan(pembegalan,mandau).
melakukan(pembegalan,pistol).

	
GOAL %goal adalah tempat pernyataan diberikan atau meminta prolog untuk mencapai tujuan yang dikehendaki
seluruhnya(Lokasi,Waktu),
Waktu=sore,
target(Korban,Status),
Status=irt,
melakukan(Kejahatan,Senjata),
Kejahatan=pembegalan.
%pada goal kali ini saya ingin menunjukkan kasus perselingkuhan yang terjadi di hari sabtu dan korban yang berprofesi sebagai guru 