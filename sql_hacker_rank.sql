

Report columns - Name, Grade, Mark

report null instead names for students whose grades is < 8

order by grade desc

case grade > 8 - for same grade case order by name asc

case grade < 8 - for same grade case order by marks asc

select case when g.grade >= 8 then s.name
            when g.grade < 8 then NULL
       end as name, grade, marks
from 
students s
,grades g
where s.marks between g.min_mark and g.max_mark
order by g.grade desc,
case when g.grade >= 8 then s.name
     when g.grade < 8 then to_char(s.marks)
end;


select case when g.grade >= 8 then s.name
            when g.grade < 8 then NULL
       end as name, grade, marks
from 
students s
,grades g
where s.marks >= g.min_mark and s.marks <= g.max_mark
order by g.grade desc,
case when g.grade >= 8 then s.name
     when g.grade < 8 then to_char(s.marks)
end;


--------------------------------------------------------------------------------------

report columns - hacker_id, hacker name

who achieved full scores more than one challange

order by sum(challanges) desc

if same sum of challanges then order by hacker_id asc

select hacker_id,name
from
(select s.hacker_id,h.name,count(c.challenge_id) cnt
from
submissions s join challenges c on s.challenge_id = c.challenge_id
join difficulty d on d.difficulty_level = c.difficulty_level
join hackers h on h.hacker_id = s.hacker_id
where s.score = d.score
group by s.hacker_id,h.name
having count(c.challenge_id) > 1
order by cnt desc,s.hacker_id);


--------------------------------------------------------------------------------------






















	 