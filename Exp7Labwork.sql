CREATE TABLE Sailors(sid INT PRIMARY KEY, sname VARCHAR(50), rating INT, age INT);
CREATE TABLE Boats(bid INT PRIMARY KEY, bname VARCHAR(50), color VARCHAR(20));
CREATE TABLE Reserves(sid INT, bid INT, day DATE, PRIMARY KEY(sid,bid,day), FOREIGN KEY(sid) REFERENCES Sailors(sid), FOREIGN KEY(bid) REFERENCES Boats(bid));
-- 1. Find all information of sailors who have reserved boat number 101
SELECT S.*
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid
WHERE R.bid = 101;

-- 2. Find the name of boat reserved by Bob
SELECT B.bname
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid
JOIN Boats B ON R.bid = B.bid
WHERE S.sname = 'Bob';

-- 3. Find the names of sailors who have reserved a red boat, ordered by age
SELECT DISTINCT S.sname
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid
JOIN Boats B ON R.bid = B.bid
WHERE B.color = 'red'
ORDER BY S.age;

-- 4. Find the names of sailors who have reserved at least one boat
SELECT DISTINCT S.sname
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid;

-- 5. Find the ids and names of sailors who have reserved two different boats on the same day
SELECT S.sid, S.sname
FROM Sailors S
JOIN Reserves R1 ON S.sid = R1.sid
JOIN Reserves R2 ON S.sid = R2.sid AND R1.day = R2.day AND R1.bid <> R2.bid
GROUP BY S.sid, S.sname;

-- 6. Find the ids of sailors who have reserved a red boat or a green boat
SELECT DISTINCT S.sid
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid
JOIN Boats B ON R.bid = B.bid
WHERE B.color IN ('red','green');

-- 7. Find the name and the age of the youngest sailor
SELECT sname, age
FROM Sailors
WHERE age = (SELECT MIN(age) FROM Sailors);

-- 8. Count the number of different sailor names
SELECT COUNT(DISTINCT sname) AS total_sailors
FROM Sailors;

-- 9. Find the average age of sailors for each rating level
SELECT rating, AVG(age) AS avg_age
FROM Sailors
GROUP BY rating;

-- 10. Find the average age of sailors for each rating level that has at least two sailors
SELECT rating, AVG(age) AS avg_age
FROM Sailors
GROUP BY rating
HAVING COUNT(sid) >= 2;
