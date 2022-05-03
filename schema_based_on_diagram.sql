CREATE TABLE patients(
	id integer GENERATED ALWAYS AS IDENTITY,
	name varchar(50),
	date_of_birth date,
	PRIMARY KEY(id)
);


CREATE TABLE medical_histories (
	id integer GENERATED ALWAYS AS IDENTITY,
	admitted_at timestamp,
	patient_id  integer,
	FOREIGN KEY (patient_id) REFERENCES patients(id),
	status	varchar,
	PRIMARY KEY(id)
);


CREATE TABLE treatments (
  id INT,
  type VARCHAR,
  name VARCHAR(50),
  PRIMARY KEY (id)
);


CREATE TABLE invoices (
	id integer GENERATED ALWAYS AS IDENTITY,
	total_amount decimal,
	generated_at timestamp,
	payed_at  timestamp,
	medical_history_id  integer,
	FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
	PRIMARY KEY(id)
);



CREATE TABLE invoice_items (
	id integer GENERATED ALWAYS AS IDENTITY,
	unit_price decimal,
	quantity integer,
	total_price decimal,
	invoice_id integer,
	FOREIGN KEY (invoice_id) REFERENCES invoices(id),
	treatment_id integer,
	FOREIGN KEY (treatment_id) REFERENCES treatments(id),
	PRIMARY KEY(id)
);