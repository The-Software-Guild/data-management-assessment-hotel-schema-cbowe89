-- Courtney Bowe
-- 11/09/2022

-- Use CourtneyBoweHotelDB database
USE CourtneyBoweHotelDB;

-----------------------------------------------------------------------------
-- 1. Write a query that returns a list of reservations that end in
-- July 2023, including the name of the guest, the room number(s),
-- and the reservation dates.
SELECT
	g.FirstName,
    g.LastName,
    r.RoomNum,
    res.StartDate,
    res.EndDate
FROM Reservation res
INNER JOIN Guest g ON res.GuestId = g.GuestId
INNER JOIN Room r ON res.RoomId = r.RoomId
WHERE res.EndDate BETWEEN '2023-07-01' AND '2023-07-31';

-- Results
-- Message: 4 row(s) returned
-- FirstName    LastName    RoomNum StartDate   EndDate
-- Courtney	    Bowe	    205	    2023-06-28	2023-07-02
-- Walter	    Holaway	    204	    2023-07-13	2023-07-14
-- Wilfred	    Vise	    401	    2023-07-18	2023-07-21
-- Bettyann	    Seery	    303	    2023-07-28	2023-07-29

-----------------------------------------------------------------------------
-- 2. Write a query that returns a list of all reservations for rooms
-- with a jacuzzi, displaying the guest's name, the room number, and
-- the dates of the reservation.
SELECT
	g.FirstName,
    g.LastName,
    r.RoomNum,
    res.StartDate,
    res.EndDate
FROM Reservation res
INNER JOIN Room r ON res.RoomId = r.RoomId
INNER JOIN Guest g ON res.GuestId = g.GuestId
WHERE r.AmenitiesType = 3 OR r.AmenitiesType = 4;

-- Results
-- Message: 11 row(s) returned
-- FirstName  LastName  RoomNum  StartDate   EndDate
-- Bettyann	  Seery	    203	     2023-02-05	 2023-02-10
-- Duane	  Cullison	305	     2023-02-22	 2023-02-24
-- Karie	  Yang	    201	     2023-03-06	 2023-03-07
-- Courtney	  Bowe	    307	     2023-03-17	 2023-03-20
-- Walter	  Holaway	301	     2023-04-09	 2023-04-13
-- Wilfred	  Vise	    207	     2023-04-23	 2023-04-24
-- Courtney	  Bowe	    205	     2023-06-28	 2023-07-02
-- Bettyann	  Seery	    303	     2023-07-28	 2023-07-29
-- Bettyann	  Seery	    305	     2023-08-30	 2023-09-01
-- Karie	  Yang	    203	     2023-09-13	 2023-09-15
-- Mack	      Simmer	301	     2022-11-22	 2023-11-25

-----------------------------------------------------------------------------
-- 3. Write a query that returns all the rooms reserved for a specific
-- guest, including the guest's name, the room(s) reserved, the starting
-- date of the reservation, and how many people were included in the
-- reservation. (Choose a guest's name from the existing data.)
SELECT
	g.FirstName,
    g.LastName,
    r.RoomNum,
    res.StartDate,
    res.EndDate,
    (res.AdultGuestNum + res.ChildGuestNum) AS GuestsInReservation
FROM Reservation res
INNER JOIN Room r ON res.RoomId = r.RoomId
INNER JOIN Guest g ON res.GuestId = g.GuestId
WHERE g.GuestId = 2;

-- Results
-- Message: 4 row(s) returned
-- FirstName  LastName  RoomNum  StartDate   EndDate     GuestsInReservation
-- Mack	      Simmer	308	     2023-02-02  2023-02-04  1
-- Mack       Simmer	208	     2023-09-16  2023-09-17	 2
-- Mack	      Simmer	206	     2023-11-22  2023-11-25	 2
-- Mack	      Simmer	301	     2022-11-22	 2023-11-25	 4

-----------------------------------------------------------------------------
-- 4. Write a query that returns a list of rooms, reservation ID, and
-- per-room cost for each reservation. The results should include all
-- rooms, whether or not there is a reservation associated with the room.
SELECT
	r.RoomNum,
    res.ReservationId,
    res.TotalRoomCost
From Room r
LEFT JOIN Reservation res ON r.RoomId = res.RoomId
ORDER BY RoomNum;

-- Results
-- Message: 26 row(s) returned
-- RoomNum  ReservationId  TotalRoomCost
-- 201	    4	           199.99
-- 202	    7	           349.98
-- 203	    2	           999.95
-- 203	    21	           399.98
-- 204	    16	           184.99
-- 205	    15	           699.96
-- 206	    12	           599.96
-- 206	    23	           449.97
-- 207	    10	           174.99
-- 208	    13	           599.96
-- 208	    20	           149.99
-- 301	    9	           799.96
-- 301	    24	           599.97
-- 302	    6	           924.95
-- 302	    25	           699.96
-- 303	    18	           199.99
-- 304	    14	           184.99
-- 305	    3	           349.98
-- 305	    19	           349.98
-- 306		NULL           NULL
-- 307	    5	           524.97
-- 308	    1	           299.98
-- 401	    11	           1199.97
-- 401	    17	           1259.97
-- 401	    22	           1199.97
-- 402		NULL           NULL

-----------------------------------------------------------------------------
-- 5. Write a query that returns all rooms with a capacity of three or
-- more and that are reserved on any date in April 2023.
SELECT
	r.RoomNum,
    r.MaxOccupancy,
    res.StartDate,
    res.EndDate
From Reservation res
INNER JOIN Room r ON res.RoomId = r.RoomId
WHERE r.MaxOccupancy >= 3
AND ((res.StartDate BETWEEN '2023-4-1' AND '2023-4-30')
	OR (res.EndDate BETWEEN '2023-4-1' AND '2023-4-30'));

-- Results
-- Message: 1 row(s) returned
-- RoomNum  MaxOccupancy  StartDate   EndDate
-- 301	    4	          2023-04-09  2023-04-13

-----------------------------------------------------------------------------
-- 6. Write a query that returns a list of all guest names and the number
-- of reservations per guest, sorted starting with the guest with the
-- most reservations and then by the guest's last name.
SELECT
	g.FirstName,
    g.LastName,
    COUNT(res.ReservationId) ReservationCount
FROM Reservation res
LEFT OUTER JOIN Guest g ON res.GuestId = g.GuestId
GROUP BY g.GuestId
ORDER BY ReservationCount DESC, g.LastName ASC;

-- Results
-- Message: 11 row(s) returned
-- FirstName  LastName      ReservationCount
-- Mack	      Simmer	    4
-- Bettyann	  Seery	        3
-- Duane	  Cullison	    2
-- Walter	  Holaway	    2
-- Aurore	  Lipton	    2
-- Maritza	  Tilton	    2
-- Joleen	  Tison	        2
-- Wilfred	  Vise	        2
-- Karie	  Yang	        2
-- Zachery	  Luechtefeld	1

-----------------------------------------------------------------------------
-- 7. Write a query that displays the name, address, and phone number
-- of a guest based on their phone number. (Choose a phone number from
-- the existing data.)
SELECT
	FirstName,
    LastName,
    PhoneNum
FROM guest
WHERE PhoneNum = 3775070974;

-- Results
-- Message: 1 row(s) returned
-- FirstName  LastName  PhoneNum
-- Aurore	  Lipton	3775070974
