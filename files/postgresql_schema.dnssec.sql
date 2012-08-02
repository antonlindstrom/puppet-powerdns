create table domains (
 id    SERIAL PRIMARY KEY,
 name    VARCHAR(255) NOT NULL,
 master    VARCHAR(128) DEFAULT NULL,
 last_check  INT DEFAULT NULL,
 type    VARCHAR(6) NOT NULL,
 notified_serial INT DEFAULT NULL,
 account         VARCHAR(40) DEFAULT NULL
);
CREATE UNIQUE INDEX name_index ON domains(name);

CREATE TABLE records (
        id              SERIAL PRIMARY KEY,
        domain_id       INT DEFAULT NULL,
        name            VARCHAR(255) DEFAULT NULL,
        type            VARCHAR(10) DEFAULT NULL,
        content         VARCHAR(65535) DEFAULT NULL,
        ttl             INT DEFAULT NULL,
        prio            INT DEFAULT NULL,
        change_date     INT DEFAULT NULL,
        CONSTRAINT domain_exists 
        FOREIGN KEY(domain_id) REFERENCES domains(id)
        ON DELETE CASCADE,
        CONSTRAINT c_lowercase_name CHECK (((name)::text = lower((name)::text)))
);

CREATE INDEX rec_name_index ON records(name);
CREATE INDEX nametype_index ON records(name,type);
CREATE INDEX domain_id ON records(domain_id);

create table supermasters (
    ip VARCHAR(25) NOT NULL,
    nameserver VARCHAR(255) NOT NULL,
    account VARCHAR(40) DEFAULT NULL
);

-- GRANT SELECT ON supermasters TO pdns;
-- GRANT ALL ON domains TO pdns;
-- GRANT ALL ON domains_id_seq TO pdns;
-- GRANT ALL ON records TO pdns;
-- GRANT ALL ON records_id_seq TO pdns;

alter table records add ordername	VARCHAR(255);
alter table records add auth bool;
create index orderindex on records(ordername);

create table domainmetadata (
 id		SERIAL PRIMARY KEY,
 domain_id	INT REFERENCES domains(id) ON DELETE CASCADE,
 kind		VARCHAR(16),
 content	TEXT
);

create index domainidmetaindex on domainmetadata(domain_id);               


create table cryptokeys (
 id		SERIAL PRIMARY KEY,
 domain_id	INT REFERENCES domains(id) ON DELETE CASCADE,
 flags		INT NOT NULL,
 active		BOOL,
 content	TEXT
);		 
create index domainidindex on cryptokeys(domain_id);


-- GRANT ALL ON domainmetadata TO pdns;
-- GRANT ALL ON domainmetadata_id_seq TO pdns;
-- GRANT ALL ON cryptokeys TO pdns;
-- GRANT ALL ON cryptokeys_id_seq TO pdns;

create table tsigkeys (
 id		SERIAL PRIMARY KEY,
 name		VARCHAR(255),
 algorithm	VARCHAR(50), 
 secret		VARCHAR(255)
);

create unique index namealgoindex on tsigkeys(name, algorithm);

-- GRANT ALL ON tsigkeys TO pdns;
-- GRANT ALL ON tsigkeys_id_seq TO pdns;
alter table records alter column type type VARCHAR(10);