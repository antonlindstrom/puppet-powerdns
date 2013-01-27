create table domains (
 id              INT auto_increment,
 name            VARCHAR(255) NOT NULL,
 master          VARCHAR(128) DEFAULT NULL,
 last_check      INT DEFAULT NULL,
 type            VARCHAR(6) NOT NULL,
 notified_serial INT DEFAULT NULL,
 account         VARCHAR(40) DEFAULT NULL,
 primary key (id)
) Engine=InnoDB;

CREATE UNIQUE INDEX name_index ON domains(name);

CREATE TABLE records (
  id              INT auto_increment,
  domain_id       INT DEFAULT NULL,
  name            VARCHAR(255) DEFAULT NULL,
  type            VARCHAR(10) DEFAULT NULL,
  content         VARCHAR(64000) DEFAULT NULL,
  ttl             INT DEFAULT NULL,
  prio            INT DEFAULT NULL,
  change_date     INT DEFAULT NULL,
  primary key(id)
) Engine=InnoDB;

CREATE INDEX rec_name_index ON records(name);
CREATE INDEX nametype_index ON records(name,type);
CREATE INDEX domain_id ON records(domain_id);

create table supermasters (
  ip         VARCHAR(25) NOT NULL,
  nameserver VARCHAR(255) NOT NULL,
  account    VARCHAR(40) DEFAULT NULL
) Engine=InnoDB;

create table domainmetadata (
 id         INT auto_increment,
 domain_id  INT NOT NULL,
 kind       VARCHAR(16),
 content    TEXT,
 primary key(id)
);

create index domainmetaidindex on domainmetadata(domain_id);


create table cryptokeys (
 id         INT auto_increment,
 domain_id  INT NOT NULL,
 flags      INT NOT NULL,
 active     BOOL,
 content    TEXT,
 primary key(id)
);

create index domainidindex on cryptokeys(domain_id);

alter table records add ordername      VARCHAR(255) BINARY;
alter table records add auth bool;
create index recordorder on records (domain_id, ordername);

create table tsigkeys (
 id         INT auto_increment,
 name       VARCHAR(255),
 algorithm  VARCHAR(50),
 secret     VARCHAR(255),
 primary key(id)
);

create unique index namealgoindex on tsigkeys(name, algorithm);
alter table records change column type type VARCHAR(10);
