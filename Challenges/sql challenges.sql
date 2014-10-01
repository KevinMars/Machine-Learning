CREATE DATABASE tennis;

create table us_men_2013 (player1 VARCHAR(100), player2 VARCHAR(100), round CHAR(5), 
	result CHAR(5), fnl1 CHAR(5), fnl2 CHAR(5), fsp_1 CHAR(5), fsw_1 CHAR(5), ssp_1 CHAR(5), 
	ssw_1 CHAR(5), ace_1 CHAR(5), dbf_1 CHAR(5), wnr_1 CHAR(5), ufe_1 CHAR(5), bpc_1 CHAR(5), 
	bpw_1 CHAR(5), npa_1 CHAR(5), npw_1 CHAR(5), tpw_1 CHAR(5), st1_1 CHAR(5), st2_1 CHAR(5), 
	st3_1 CHAR(5), st4_1 CHAR(5), st5_1 CHAR(5), fsp_2 CHAR(5), fsw_2 CHAR(5), ssp_2 CHAR(5), 
	ssw_2 CHAR(5), ace_2 CHAR(5), dbf_2 CHAR(5), wnr_2 CHAR(5), ufe_2 CHAR(5), bpc_2 CHAR(5), 
	bpw_2 CHAR(5), npa_2 CHAR(5), npw_2 CHAR(5), tpw_2 CHAR(5), st1_2 CHAR(5), st2_2 CHAR(5), 
	st3_2 CHAR(5), st4_2 CHAR(5), st5_2 CHAR(5));
	
create table aus_men_2013 like us_men_2013;
create table fre_men_2013 like us_men_2013;


load data local infile 'USOpen-men-2013.csv' into table us_men_2013 
	fields terminated by "," ignore 1 lines;

load data local infile 'FrenchOpen-men-2013.csv' into table french_men_2013 
	fields terminated by "," ignore 1 lines;

load data local infile 'AusOpen-men-2013.csv' into table aus_men_2013 
	fields terminated by "," ignore 1 lines;
	
/* CHALLENGE 1	
/*this group of code creates a table with sum of results for player1 and player2, 
adds them, and puts them all together  */
create table player1_fr (select player1 as player, SUM(result) as win from 
	french_men_2013 GROUP BY player1);
	
create table player2_fr (select player2 as player, SUM(result) as win from 
	french_men_2013 GROUP BY player2);

create table playerall_fr(SELECT * from player1_fr) UNION ALL (SELECT * from player2_fr);
create table mens_fr(select player, SUM(win) as wins from playerall_fr GROUP BY player);
/* do the same thing for aus_men_2013 and us_men_2013 */

/* joins all tables and gives you top players with most matches */
create table join_fr_aus(SELECT * from mens_fr) UNION ALL (SELECT * from mens_aus);
create table join_mens_all(SELECT * from join_fr_aus) UNION ALL (SELECT * from mens_us);
create table final_mens_all(select player, SUM(wins) as wins from join_mens_all GROUP BY player);


/* CHALLENGE 2 */
/* this set of lines find the max fsp for each tournament and both player1 and player2 */
SELECT player2 AS name, fsp_2 AS maxfirstserve FROM us_men_2013 WHERE 
	fsp_2=(SELECT MAX(fsp_2) FROM aus_men_2013);
SELECT player1 AS name, fsp_1 AS maxfirstserve FROM us_men_2013 WHERE 
	fsp_1=(SELECT MAX(fsp_1) FROM aus_men_2013);
SELECT player1 AS name, fsp_1 AS maxfirstserve FROM aus_men_2013 WHERE 
	fsp_1=(SELECT MAX(fsp_1) FROM aus_men_2013);
SELECT player2 AS name, fsp_2 AS maxfirstserve FROM aus_men_2013 WHERE 
	fsp_2=(SELECT MAX(fsp_2) FROM aus_men_2013);
SELECT player2 AS name, fsp_2 AS maxfirstserve FROM french_men_2013 WHERE 
	fsp_2=(SELECT MAX(fsp_2) FROM french_men_2013);
SELECT player1 AS name, fsp_1 AS maxfirstserve FROM french_men_2013 WHERE 
	fsp_1=(SELECT MAX(fsp_1) FROM french_men_2013);
	
	
/* for  CHALLENGE 3 we run the same commands as challenge 1 but rather than COUNT we use SUM to 
add all the results where the player actually won and choose the top 3 players.

For 1st player, Rafael Nadal. */
create table nadal_aus_1 (SELECT player1 as player, SUM(tpw_2) as points, SUM(ufe_1) 
	as error FROM aus_men_2013 WHERE player1 ="Rafael Nadal" GROUP BY player1);
create table nadal_aus_2 (SELECT player2 as player, SUM(tpw_1) as points, SUM(ufe_2) 
	as error FROM aus_men_2013 WHERE player2 ="Rafael Nadal" GROUP BY player2);
	
/* do above commands for fre_open_2013 and UNION ALL them, then: SUM(error) / SUM(tpw_2)
	to find the percentage
Also do this for the other two players. */

















