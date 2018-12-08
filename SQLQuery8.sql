Select ql.questionID,questionDesc,sampleAns,studAns
from question q,questionList ql
where stuId='junlim2804' and q.setID=10 and ql.questionID=q.questionID