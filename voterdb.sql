1. Were there more male or female voters in Greensboro?


select * from cities where name = 'Greensboro';
select count(*) from votes where gender = 'male';
count
--------
398207
select count(*) from votes where gender = 'female';
count
--------
401793

2. What is the average age of voters in Orlando?


select AVG(votes.age) from votes where votes."cityId" = 77;
         avg
---------------------
 51.4562500000000000
(1 row)

3. Which state has the most cities listed?


//each state has many cities
select "stateId" from cities group by "stateId" order by count(*) desc limit 1;
 stateId
---------
       3
(1 row)
select * from states  where id = 3;
 id |    name    |         createdAt          |         updatedAt
----+------------+----------------------------+----------------------------
  3 | California | 2017-08-31 10:53:39.914-04 | 2017-08-31 10:53:39.914-04
(1 row)

4. Which state had the most votes placed?


select states.name, count(votes.id) from states join cities on states.id=cities."stateId" join votes on votes."cityId"=cities.id group by states.name order by count(votes.id) desc;
//could have added limit 1; after desc
         name         | count
----------------------+--------
 California           | 169600

 5. What percentage of cities passed the minimum wage issue (> 50% of votes)?

 //thinking out loud
 //select * from cities limit 5;
 //select * from states limit 5;
 //select * from votes limit 5;
//select count(*) from votes where in_favor  = 'f';
//select count (*) from votes where votes."issueId" = 2 and votes.in_favor ='t' group by votes."cityId";

//ANSWER
voting=# select count (*) from (select count (*) from votes where votes."issueId" = 2 and votes.in_favor ='t' group by votes."cityId" having count (*) > 100
voting(# ) as final;
 count
-------
   461
(1 row


6.  How many of the issues were approved in each of the following cities? An issue is 'approved' if it got more than 50% of the votes.

Dallas
Atlanta
Anaheim
Boston

///UNABLE TO GET NUMBER 6
//voting=# select count (*) from votes where votes.id and  votes.in_favor ='t' group by votes."cityId" having count (*) > 100;
ERROR:  argument of AND must be type boolean, not type integer
LINE 1: select count (*) from votes where votes.id and  votes.in_fav...
