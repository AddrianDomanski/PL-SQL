-- Create a procedure where, given a date, a list showing the hour, activity code, and
-- description of the activities planned in that date is obtained.

create or replace
procedure showActiviByDate (p_date in date) is
CURSOR cur_timetable IS 
SELECT hourTime, code, description
FROM ACTIVITY, TIMETABLE
WHERE activity=code and timeTableDate=p_date
ORDER BY hourTime;
BEGIN
write ('Activities for day ' || p_date);
FOR reg_timetable IN cur_timetable LOOP
  write(reg_timetable.hourTime||' hours '|| reg_timetable.code || ' '||reg_timetable.description);
END LOOP;
END;

-- Create a procedure where, given an adult activity, the id and description of the
-- equivalent activities is shown

create or replace
procedure showSubstAdults (p_activity in char) is
v_activityName activity.description%type;
CURSOR cur_adults IS 
SELECT activ2, description
FROM substAdults, activity
WHERE p_actividad=activ1 and activ2=code
ORDER BY description;
BEGIN
select description into v_activityName 
from activity
where p_activity=code;
write ('Activity replacement for' || v_activityName||' are given below:');
FOR reg_adults IN cur_adults LOOP
  write(reg_adults.activ2||' '|| reg_adults.description);
END LOOP;
END;