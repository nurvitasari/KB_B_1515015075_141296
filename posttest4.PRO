/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Project:  
 FileName: CH04E12.PRO
 Purpose: 
 Written by: PDC
 Modifyed by: Eugene Akimov
 Comments: 
******************************************************************************/

trace
domains								%Domains digunkana untuk memberikan nama pada parameter
  name,sex,occupation,object,vice,substance = symbol		%Pada baris ini tipe data yang digunakan adalah symbol
  age=integer							%Dan pada age menggunakan tipe data integer

predicates							%Predicates digunakan untuk mendklarasikan relasi  
 nondeterm person(name,age,sex,occupation)			%Relasi dari persom yaitu name,age,sex, dan occupatonnya
 nondeterm had_affair(name,name) 				%relasi dari had_affair yaitu name dan name	
  	killed_with(name,object) 				%relasi dari killed_with yaitu name dengan object
  	killed(name) 						%relasi dari killed yaitu name 
 nondeterm killer(name)						%relasi dari predikat killed yaitu parameter name
 	motive(vice)						%relasi dari predikat motive adalah parameter vice
  	smeared_in(name,substance)				%relasi dari predikat smeared_in yaitu dengan parameter name dan substance
 	owns(name,object)					%relasi dari predikat owns yaitu parameter name dan object
 nondeterm operates_identically(object,object)			%relasi dari predikat operates_identically yaitu parameter object dan object  
 nondeterm owns_probably(name,object)				%relasi dari predikat owns_probably yaitu parameter name dan object
 nondeterm suspect(name)					%relasi dari predikat suspectyaitu parameter name

/* * * Facts about the murder * * */
clauses								%clauses berisi fakta
  person(bert,55,m,carpenter).					%bert seorang carpenter yang berumur 55 dengan bejender m  
  person(allan,25,m,football_player).				%aldi seorang football_player yang berumur 55 dengan bejender m  
  person(allan,25,m,butcher).					%budi seorang butcher berumur 55 dengan bejender m  					
  person(john,25,m,pickpocket).					%budi seorang pickpocket yang berumur 55 dengan bejender m  	

  had_affair(barbara,john).					%barbara had_affair dengan jhon
  had_affair(barbara,bert).					%barbara  had_affair dengan bert
  had_affair(susan,john).					%susan had_affair dengan jhon

  killed_with(susan,club).					%susan killed_withc club
  killed(susan).						%susan killed dengan susan

  motive(money).						%motive dari pembunuhan tersebut yaitu money
  motive(jealousy).						%motive dari pembunuhan tersebut yaitu jealousy
  motive(righteousness).					%motive dari pembunuhan tersebut yaiyu righteousness

  smeared_in(bert,blood).					%bert smeared_in blood
  smeared_in(susan,blood).					%susan smeared_in blood 
  smeared_in(allan,mud).					%allan smeared_in mud
  smeared_in(john,chocolate).					%john smeared_in chocolate
  smeared_in(barbara,chocolate).				%barbara smeared_in chocolate

  owns(bert,wooden_leg).					%bert owns wooden_leg
  owns(john,pistol).						%jhon owns pistol

/* * * Background knowledge * * */

  operates_identically(wooden_leg, club).			%operates_identically wooden_leg mirip dengan club 
  operates_identically(bar, club).				%operates_identically bar mirip dengan club
  operates_identically(pair_of_scissors, knife).		%operates_identically pair_of_scissors mirip dengan knife
  operates_identically(football_boot, club).			%operates_identically football_boot mirip dengan club

  owns_probably(X,football_boot):-				%owns_probably football_boot milik X jika maka 
	person(X,_,_,football_player).				%X dan person lainnya football_player
  owns_probably(X,pair_of_scissors):-				%owns_probably pair_of_scissors milik X jika maka
	person(X,_,_,hairdresser).				%X dan person lainnya adalah hairdresser
  owns_probably(X,Object):-					%owns_probably object milik X jika maka
	owns(X,Object).						%X owns object itu

/* * * * * * * * * * * * * * * * * * * * * * *
 * Suspect all those who own a weapon with   *
 * which Susan could have been killed.       *
 * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-							%X  suspect jika maka
	killed_with(susan,Weapon) ,				%susan killed_with weapon dan
	operates_identically(Object,Weapon) ,			%operates_identically object tersebut mirip dengan weapon dan		
	owns_probably(X,Object).				%owns_probably X memiliki object
 

/* * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect men who have had an affair with Susan.  *
 * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-							%X suspect jika maka
	motive(jealousy),					%jealousy adalah motive dan
	person(X,_,m,_),					%X adalah person tersebut yang berjender m dan
	had_affair(susan,X).					%susan had_affair dengan X

/* * * * * * * * * * * * * * * * * * * * *
 * Suspect females who have had an       *
 * affair with someone that Susan knew.  *
 * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-							%X suspect jika maka							
	motive(jealousy),					%jealousy adalah motive dan
	person(X,_,f,_),					%X adalah person tersebut yang berjender f dan
	had_affair(X,Man),					%Man tersebut had_affair dengan X dan
	had_affair(susan,Man).					%susan had_affair dengan man

/* * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect pickpockets whose motive could be money.  *
 * * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-							%X suspect jika maka   
	motive(money),						%motive adalah money dan 
	person(X,_,_,pickpocket).				%X adalah person pickpocket

  killer(Killer):-						%killer tersebut dikatakan killer jika maka
	person(Killer,_,_,_),					%person  tersebut adalah killer dan person lainnya dan
	killed(Killed),						%jika person tersebut killed dan
	Killed <> Killer, /* It is not a suicide */		%relasi dari killer adalah killer dan
	suspect(Killer),					%killer tersebut suspect dan 
	smeared_in(Killer,Goo),					%killer smeared_ini oleh Goo dan
	smeared_in(Killed,Goo).					%yang killed smeared_in oleh Goo

goal								%Goal adalah jawaban yang berisi pernyataan dan pertanyaan
  killer(X).							%Jawaban dari killer tersebut adalah bert
 								%karena killer yang suspect Goo adalah bert. 
 								%Yang terdapat di rule ada dua yaitu susan dan bert yang suspect dengan Goo yaitu blood
 								%karena di goal yang ditanyakan adalah killer maka jawabannya bert
 								%sebab susan adalah person yang killed  

