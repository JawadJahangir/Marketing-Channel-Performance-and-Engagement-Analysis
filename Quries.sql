#Create Database to store data
CREATE DATABASE WEB_DATA;
USE WEB_DATA;

#Total Sessions & Engagement
select * from weebdata;
select sum(Sessions) as total_sessions,
sum(Engaged_sessions) as total_engaged_session,
sum(Engaged_sessions)/sum(Sessions) as engagement_rate
from weebdata;

#Channel_wise performance
select Channel_group,
sum(Engaged_sessions) AS TOTAL_SESSION,
sum(Sessions) AS TOTAL_SESSIONS
from weebdata
group BY Channel_group
order by TOTAL_SESSION desc;

#Engagemtn rate by channel
select Channel_group,sum(Engaement_rate)
as total_engagement
from weebdata
group by Channel_group
order by total_engagement desc;

#Daily Trend (Growth / Drop)
select DATE(Date_hour) AS date,
sum(Sessions ) as total_sessions
from weebdata
group by date
order by date;

#Hour-wise Performance ⏰
SELECT
    Hour,
    SUM(Sessions) AS total_sessions
FROM weebdata
GROUP BY Hour
ORDER BY total_sessions desc;

#High Traffic but Low Engagement 🚨
select Channel_group, sum(Sessions) as total_sessions,
sum(Engaged_sessions) as total_engaged_sessions,
(SUM(Engaged_sessions)/SUM(Sessions)) AS engagement_rate
from weebdata
group by Channel_group
Having engagement_rate<0.3
order by total_sessions desc;

#Best Performing Channels (Quality + Volume)
select Channel_group,
sum(Sessions) as total_sessions,
sum(Engaged_sessions) as total_Session,
sum(Engaged_sessions)/sum(Sessions) as engagement_rate
from weebdata
GROUP BY Channel_group
order by engagement_rate desc;

#Sessions vs Engagement Pattern
select Channel_group,
avg(Sessions) as avg_Sessions,
avg(Engaged_sessions) as avg_engaged_sessions
from weebdata
group by Channel_group
order by Channel_group desc;

#Non-eengaged sessions
select Channel_group,
SUM(Sessions) - SUM(Engaged_sessions) as non_engaged_sessions
from weebdata
group by Channel_group
order by non_engaged_sessions;