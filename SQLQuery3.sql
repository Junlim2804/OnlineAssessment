select p.setid,mode,duration,p.subjectID,subjectName,[type]
from studentsetlist ss,paperset p,subject s
where stuid='junlim2804' and p.setId=ss.setID and p.subjectID=s.subjectID and mark is NULL;