CREATE TABLE random_city (
  id bigint NOT NULL,
  name varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE app_role (
  id bigint NOT NULL ,
  description varchar(255) DEFAULT NULL,
  role_name varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE app_user (
  id bigint NOT NULL ,
  first_name varchar(255) NOT NULL,
  last_name varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  username varchar(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE user_role (
  user_id bigint NOT NULL,
  role_id bigint NOT NULL,
  CONSTRAINT FK859n2jvi8ivhui0rl0esws6o FOREIGN KEY (user_id) REFERENCES app_user (id),
  CONSTRAINT FKa68196081fvovjhkek5m97n3y FOREIGN KEY (role_id) REFERENCES app_role (id)
);

drop table if exists oauth_client_details;
create table oauth_client_details (
  client_id VARCHAR(256) PRIMARY KEY,
  resource_ids VARCHAR(256),
  client_secret VARCHAR(256),
  scope VARCHAR(256),
  authorized_grant_types VARCHAR(256),
  web_server_redirect_uri VARCHAR(256),
  authorities VARCHAR(256),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additional_information VARCHAR(4096),
  autoapprove VARCHAR(256)
);

drop table if exists oauth_client_token;
create table oauth_client_token (
token_id VARCHAR(255),
token bytea ,
authentication_id VARCHAR(255),
user_name VARCHAR(255),
client_id VARCHAR(255)
);

drop table if exists oauth_access_token;
create table oauth_access_token (
token_id VARCHAR(255),
token bytea,
authentication_id VARCHAR(255),
user_name VARCHAR(255),
client_id VARCHAR(255),
authentication bytea,
refresh_token VARCHAR(255)
);
drop table if exists oauth_refresh_token;
create table oauth_refresh_token (
token_id VARCHAR(255),
token bytea,
authentication bytea
);
drop table if exists oauth_code;
create table oauth_code (
code VARCHAR(255), authentication bytea
);


-- DML
INSERT INTO app_role (id, role_name, description) VALUES (1, 'STANDARD_USER', 'Standard User - Has no admin rights');
INSERT INTO app_role (id, role_name, description) VALUES (2, 'ADMIN_USER', 'Admin User - Has permission to perform admin tasks');

-- USER
-- non-encrypted password: jwtpass
INSERT INTO app_user (id, first_name, last_name, password, username) VALUES (1, 'John', 'Doe', '$2a$10$qtH0F1m488673KwgAfFXEOWxsoZSeHqqlB/8BTt3a6gsI5c2mdlfe', 'john.doe');
INSERT INTO app_user (id, first_name, last_name, password, username) VALUES (2, 'Admin', 'Admin', '$2a$10$qtH0F1m488673KwgAfFXEOWxsoZSeHqqlB/8BTt3a6gsI5c2mdlfe', 'admin.admin');


INSERT INTO user_role(user_id, role_id) VALUES(1,1);
INSERT INTO user_role(user_id, role_id) VALUES(2,1);
INSERT INTO user_role(user_id, role_id) VALUES(2,2);