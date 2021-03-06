
CREATE TABLE IF NOT EXISTS dm_user
(
    id SERIAL PRIMARY KEY,
    email character varying(255),
    password character varying(255),
    username character varying(255),
	CONSTRAINT dm_user_email UNIQUE(email)	
);

CREATE TABLE IF NOT EXISTS dm_role
(
    id SERIAL PRIMARY KEY,
    name character varying(255)
);

CREATE TABLE IF NOT EXISTS dm_user_roles
(
    user_id SERIAL NOT NULL,
    roles_id SERIAL NOT NULL,
    CONSTRAINT dm_user_roles_pkey PRIMARY KEY (user_id, roles_id),
    CONSTRAINT fk9jv29t3wke5nmrss2t1ekk2bl FOREIGN KEY (roles_id)
        REFERENCES public.dm_role (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fkale7hnu5j7ws8mx23tst4ir7u FOREIGN KEY (user_id)
        REFERENCES public.dm_user (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS note
(
    id SERIAL PRIMARY KEY,
    name character varying(255),
    notes character varying(255),
    owner_id bigint,
    CONSTRAINT fksxf1rxjbf9v0mssuuler0irc FOREIGN KEY (owner_id)
        REFERENCES public.dm_user (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS table_game
(
    id SERIAL PRIMARY KEY,
    complectation character varying(255),
    created_by_user boolean,
    name character varying(255),
    players_amount character varying(255),
    rools character varying(255),
    short_discriprion character varying(255)
);


INSERT INTO dm_role(id, name)
  VALUES (1, 'ROLE_USER'),
  		 (2, 'ROLE_ADMIN') ON CONFLICT (id) DO UPDATE SET name = excluded.name; 
  		 
INSERT INTO dm_user (email, password, username) 
VALUES (
	'olegthander@yandex.ru',
 	'$2y$12$2d0R1wuxnT5wLhVXDIOilei49fsQKv89bJSnksA/aMYL7jMlso7tq',
 	'ADMIN') ON CONFLICT (id) DO UPDATE SET 
 	
 	password = excluded.password,
 	username = excluded.username ;
 	
INSERT INTO dm_user_roles (user_id, roles_id) 
VALUES (1, (SELECT id from dm_user WHERE username = 'ADMIN'));