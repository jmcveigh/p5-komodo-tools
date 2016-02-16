CREATE TABLE members (
    id INTEGER PRIMARY KEY,
    username TEXT,
    password TEXT,
    email TEXT,
    surname TEXT,
    given_name TEXT,
    flags TEXT,
    achievments TEXT,
    introduced TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    active INTEGER DEFAULT 0,
    validated INTEGER DEFAULT 0,
    validation_digest TEXT
);

CREATE TABLE role (
    id INTEGER PRIMARY KEY,
    role TEXT
);
CREATE TABLE member_role (
    member_id INTEGER REFERENCES members(id) ON DELETE CASCADE ON UPDATE CASCADE,
    role_id INTEGER REFERENCES role(id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (member_id, role_id)
);

INSERT INTO members VALUES (1, 'admin', 'Popular1', 'admin@echoplex.office.local', 'Charlie',  'Root', 'abcdefghijklmnopqrstuvwxyz' , 'abcdefghijklmnopqrstuvwxyz', CURRENT_TIMESTAMP, 1, 1, 'OU812');
INSERT INTO role VALUES (2, 'admin');
INSERT INTO member_role VALUES (1, 1);