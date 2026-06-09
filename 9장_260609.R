install.packages("sqldf")

library("sqldf")

DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")
DF

Omit <- read.csv("omit.csv", fileEncoding = "CP949")
Omit

sqldf("SELECT name, sex, age FROM DF")

sqldf("SELECT * FROM DF")

sqldf("SELECT * FROM DF WHERE age >= 23")

sqldf("SELECT * FROM DF WHERE age >= 23 AND age < 25")

sqldf("SELECT * FROM DF ORDER BY age DESC")

sqldf("SELECT * FROM DF ORDER BY age DESC, name")

sqldf("SELECT * FROM DF WHERE age <= 23 ORDER BY age DESC, name")

sqldf("SELECT * FROM DF WHERE name LIKE '김%'")

sqldf("SELECT * FROM DF WHERE name LIKE '%수'")

sqldf("SELECT * FROM DF WHERE name LIKE '%수%'")

sqldf("SELECT count(*) as 전체학생수 FROM DF")

sqldf("SELECT grade, count(grade) as 반별학생수 FROM DF
GROUP BY grade")

sqldf("SELECT grade, count(grade) as 반별학생수 FROM DF
GROUP BY grade HAVING grade = 1 or grade = 2")

DF

DF <- DF[-1,]
DF

Omit

Omit <- Omit[-1,]
Omit

sqldf("SELECT A.name, A.sex, A.age, B.footsize
FROM DF A INNER JOIN Omit B
ON A.name = B.name")

sqldf("SELECT A.name, A.sex, A.age, B.footsize
FROM DF A LEFT JOIN Omit B
ON A.name = B.name")

sqldf("SELECT A.name, A.sex, A.age, IFNULL(B.footsize, 0)
FROM DF A LEFT JOIN Omit B
ON A.name = B.name")

sqldf("SELECT A.name, A.sex, A.age, B.footsize
FROM DF A FULL OUTER JOIN Omit B
ON A.name = B.name")

sqldf("SELECT A.name, A.sex, A.age, B.footsize
FROM DF A RIGHT OUTER JOIN Omit B
ON A.name = B.name")

























