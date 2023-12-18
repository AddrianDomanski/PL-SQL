-- Create a PL/SQL code block that shows the category of room number 20.
-- Using exceptions, it should be controlled whether such room number exists or
-- not in the database. If exists, the following message should be output: “The
-- category of room N is C”, where N is the room number and C its category. If
-- the room does not exist, the message “Room N was not found in the database.
-- It has been added.” Should be shown and then, this room number with the
-- category individual should be inserted in the database.

DECLARE
auxCategory room.category%type;
BEGIN
	select category into auxCategory from room where roomNumber=20;
	Dbms_output.put_line('Category of room nr 20: '|| auxCategory);
EXCEPTION
	when no_data_found then 
  		Dbms_output.put_line('Room 20 was not found in the database. It has been added.');
  		INSERT INTO room (roomNumber,category) VALUES(20,'I');
END;

-- Create a PL/SQL code block that computes how many rooms of category
-- “suite” are in the database. You should control the following situations through
-- the use of exceptions:
-- a) If there is not any room that belongs to that category, the message to
-- be shown is: “The hotel does not currently have rooms of this type.”
-- b) If the hotel has more than 3 suites, then, the message to be output is:
-- “Advertise suite rooms together with some special prices.”

DECLARE
numSuites number(3):=0;;
noSuites exception;
moreThan3Suites exception;
BEGIN
	select count(*)into numSuites from room where category='S';
	if numSuites=0 then
		raise noSuites;
	else
		if numSuites > 3 then
			raise moreThan3Suites;
        end if;
	END IF;
EXCEPTION
	when noSuites then 
  		Dbms_output.put_line('The hotel does not currently have rooms of this type.');
	when moreThan3Suites then 
  		Dbms_output.put_line('Advertise suite rooms together with some special prices');
END;