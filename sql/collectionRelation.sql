CREATE TABLE collectionRelation(
    userID INT(11) NOT NULL ,
    ArtworkID INT(11) not null,
    ispublic BOOLEAN NOT NULL DEFAULT FALSE,
    collectTime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET = utf8;
