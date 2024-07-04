CREATE TABLE Booking (
    id integer  NOT NULL,
    customer_id integer  NOT NULL,
    tour_id integer  NOT NULL,
    booking_date date  NOT NULL,
    total_price integer  NOT NULL,
    number_of_participants integer  NOT NULL,
    agent_id integer  NOT NULL,
    CONSTRAINT Booking_pk PRIMARY KEY (id)
) ;

CREATE TABLE Customer (
    id integer  NOT NULL,
    first_name nvarchar2(50)  NOT NULL,
    last_name nvarchar2(50)  NOT NULL,
    email nvarchar2(50)  NOT NULL,
    phone integer  NOT NULL,
    address nvarchar2(255)  NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY (id)
) ;

CREATE TABLE Employee (
    id integer  NOT NULL,
    first_name nvarchar2(50)  NOT NULL,
    last_name nvarchar2(50)  NOT NULL,
    position nvarchar2(50)  NOT NULL,
    hire_date date  NOT NULL,
    salary integer  NOT NULL,
    manager_id integer,
    CONSTRAINT Employee_pk PRIMARY KEY (id)
) ;

CREATE TABLE Guides (
    id integer  NOT NULL,
    first_name nvarchar2(50)  NOT NULL,
    last_name nvarchar2(50)  NOT NULL,
    phone integer  NOT NULL,
    expirience nvarchar2(255)  NOT NULL,
    rating integer  NOT NULL,
    CONSTRAINT Guides_pk PRIMARY KEY (id)
) ;

CREATE TABLE Tour (
    id integer  NOT NULL,
    name nvarchar2(50)  NOT NULL,
    description nvarchar2(255)  NOT NULL,
    start_date date  NOT NULL,
    end_date date  NOT NULL,
    price_per_person integer  NOT NULL,
    CONSTRAINT Tour_pk PRIMARY KEY (id)
) ;

CREATE TABLE TourGuides (
    tour_guides_id integer  NOT NULL,
    tour_id integer  NOT NULL,
    CONSTRAINT TourGuides_pk PRIMARY KEY (tour_guides_id,tour_id)
) ;

-- foreign keys
ALTER TABLE Booking ADD CONSTRAINT Booking_Customer
    FOREIGN KEY (customer_id)
    REFERENCES Customer (id);

ALTER TABLE Booking ADD CONSTRAINT Booking_Employee
    FOREIGN KEY (agent_id)
    REFERENCES Employee (id);

ALTER TABLE Booking ADD CONSTRAINT Booking_Tour
    FOREIGN KEY (tour_id)
    REFERENCES Tour (id);

ALTER TABLE Employee ADD CONSTRAINT Employee_Employee
    FOREIGN KEY (manager_id)
    REFERENCES Employee (id);

ALTER TABLE TourGuides ADD CONSTRAINT TourGuidesAssignments_Tour
    FOREIGN KEY (tour_id)
    REFERENCES Tour (id);

ALTER TABLE TourGuides ADD CONSTRAINT TourGuidesAssignments_TourGuides
    FOREIGN KEY (tour_guides_id)
    REFERENCES Guides (id);

