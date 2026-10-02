create database footballTicket;

DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
    user_id int primary key,
    full_name varchar(50),
    email varchar(50) unique,
    role varchar(15),
    phone_number varchar(15),
    constraint check_role check (role in ('Football Fan','Ticket Manager'))
);

CREATE TABLE Matches (
    match_id int primary key,
    fixture varchar(50),
    tournament_category varchar(30),
    base_ticket_price decimal(10,2),
    match_status varchar(15),
    constraint check_ticket_prices check (base_ticket_price>=0),
    constraint check_match_status check (match_status in ('Available','Selling Fast','Sold Out'))
);

CREATE TABLE Bookings (
    booking_id int primary key,
    user_id int,
    match_id int,
    seat_number varchar(10),
    payment_status varchar(10),
    total_cost decimal(10,2),
    foreign key (user_id) references Users (user_id),
    foreign key (match_id) references Matches (match_id),
    constraint check_total_cost check (total_cost >=0),
    constraint check_payment_status check (payment_status in ('Confirmed','Pending'))
);

INSERT INTO Users (user_id, full_name, email, role, phone_number) VALUES
(1, 'Tanvir Rahman', 'tanvir@mail.com', 'Football Fan', '+8801711111111'),
(2, 'Asif Haque', 'asif@mail.com', 'Football Fan', '+8801722222222'),
(3, 'Sajjad Rahman', 'sajjad@mail.com', 'Ticket Manager', '+8801733333333'),
(4, 'Jannat Ara', 'jannat@mail.com', 'Football Fan', NULL);

INSERT INTO Matches (match_id, fixture, tournament_category, base_ticket_price, match_status) VALUES
(101, 'Real Madrid vs Barcelona', 'Champions League', 150.00, 'Available'),
(102, 'Man City vs Liverpool', 'Premier League', 120.00, 'Selling Fast'),
(103, 'Bayern Munich vs PSG', 'Champions League', 130.00, 'Available'),
(104, 'AC Milan vs Inter Milan', 'Serie A', 90.00, 'Sold Out'),
(105, 'Juventus vs Roma', 'Serie A', 80.00, 'Available');

INSERT INTO Bookings (booking_id, user_id, match_id, seat_number, payment_status, total_cost) VALUES
(501, 1, 101, 'A-12', 'Confirmed', 150.00),
(502, 1, 102, 'B-04', 'Confirmed', 120.00),
(503, 2, 101, 'A-13', 'Confirmed', 150.00),
(504, 2, 101, NULL, NULL, 150.00),
(505, 3, 102, 'C-20', 'Pending', 120.00);


-- Query 1: Retrieve all upcoming football matches belonging to the 'Champions League' where the match status is 'Available'.

select match_id, fixture, base_ticket_price from matches
where tournament_category='Champions League' and match_status='Available';

-- Query 2: Search for all users whose full names start with 'Tanvir' or contain the phrase 'Haque' (case-insensitive).

select user_id, full_name, email from users
where full_name like 'Tanvir%' or full_name Ilike '%Haque%';

-- Query 3: Retrieve all booking records where the payment status is missing (NULL), replacing the empty result with 'Action Required'.

select booking_id, user_id, match_id, coalesce(payment_status,'Action Required') as systematic_status from bookings
where payment_status is null; 