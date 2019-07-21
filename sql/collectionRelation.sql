CREATE TABLE collectionRelation(
    userID INT(11) NOT NULL ,
    ArtworkID INT(11) not null,
    ispublic BOOLEAN NOT NULL DEFAULT FALSE
)ENGINE=InnoDB DEFAULT CHARSET = utf8;
