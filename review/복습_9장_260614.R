install.packages("sqldf")

library("sqldf")

DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF

Omit <- read.csv("omit.csv", fileEncoding="CP949")
Omit

sqldf("SELECT name, sex, age FROM DF")

sqldf("SELECT * FROM DF")

sqldf("SELECT * FROM DF WHERE age >= 23")

sqldf("select * from DF where age >= 23 and age < 25")

sqldf("select * from DF order by age desc")

sqldf("select * from DF order by age desc, name")

sqldf("select * from DF where age <= 23 order by age desc, name")

sqldf("select * from DF where name like'김%'")

sqldf("select * from DF where name like '%수'")

sqldf("select * from DF where name like '%수%'")

sqldf("select count(*) as '전체학생수' from DF")

sqldf("select grade, count(*) as '반별학생수' from DF group by grade")

sqldf("select grade, count(*) as '반별학생수' from DF group by grade having grade == 1 or grade == 2")

DF <- DF[-1,]
Omit <- Omit[-1,]

DF
Omit

sqldf("select d.name, d.sex, d.age, o.footsize
from DF d
inner join Omit o
on d.name = o.name")

sqldf("select d.name, d.sex, d.age, o.footsize
from DF d
left join Omit o
on d.name = o.name")

sqldf("select d.name, d.sex, d.age, ifnull(o.footsize, 0)
from DF d
left join Omit o
on d.name = o.name")

sqldf("select d.name, d.sex, d.age, o.footsize
from DF d
full outer join Omit o
on d.name = o.name")

sqldf("select d.name, d.sex, d.age, o.footsize
from DF d
right join Omit o
on d.name = o.name")































































