CREATE TABLE "User"
(
 bannerAdminEmail varchar(50) NULL,
 name             varchar(50) NOT NULL,
 lastName         varchar(50) NOT NULL,
 phone            varchar(50) NOT NULL,
 educations       json NOT NULL,
 experice         integer NOT NULL,
 skills           json NOT NULL,
 payments         json NOT NULL,
 email            varchar(50) NOT NULL,
 CONSTRAINT PK_333 PRIMARY KEY ( email ),
 CONSTRAINT FK_275 FOREIGN KEY ( bannerAdminEmail ) REFERENCES "User" ( email )
);


CREATE TABLE Company
(
 "id"          uuid NOT NULL,
 ownerEmail  varchar(50) NOT NULL,
 address     varchar(50) NOT NULL,
 description varchar(200) NOT NULL,
 fields      json NOT NULL,
 name        varchar(50) NOT NULL,
 CONSTRAINT PK_332 PRIMARY KEY ( "id" ),
 CONSTRAINT FK_211 FOREIGN KEY ( ownerEmail ) REFERENCES "User" ( email )
);


CREATE TABLE Advertisement
(
 advertisementId         uuid NOT NULL,
 cmpanyId                uuid NOT NULL,
 employerEmail           varchar(50) NOT NULL,
 note                    varchar(100) NOT NULL,
 expireStatus            boolean NOT NULL,
 "position"                varchar(50) NOT NULL,
 salary                  integer NOT NULL,
 expirationDate          date NOT NULL,
 description             varchar(100) NOT NULL,
 advertismentPublishType varchar(20) NOT NULL,
 CONSTRAINT PK_338 PRIMARY KEY ( advertisementId ),
 CONSTRAINT FK_205 FOREIGN KEY ( cmpanyId ) REFERENCES Company ( "id" ),
 CONSTRAINT FK_208 FOREIGN KEY ( employerEmail ) REFERENCES "User" ( email )
);


CREATE TABLE AdvertiseRequest
(
 advertisementId uuid NOT NULL,
 applicantEmail  varchar(50) NOT NULL,
 "date"            date NOT NULL,
 requestType     varchar(20) NOT NULL,
 requestId       uuid NOT NULL,
 CONSTRAINT PK_340 PRIMARY KEY ( requestId ),
 CONSTRAINT FK_230 FOREIGN KEY ( advertisementId ) REFERENCES Advertisement ( advertisementId ),
 CONSTRAINT FK_240 FOREIGN KEY ( applicantEmail ) REFERENCES "User" ( email )
);



CREATE TABLE RequestReview
(
 requestId    uuid NOT NULL,
 employerId   varchar(50) NOT NULL,
 reviewResult varchar(50) NOT NULL,
 reviewDate   date NOT NULL,
 reviewId     uuid NOT NULL,
 CONSTRAINT PK_339 PRIMARY KEY ( reviewId ),
 CONSTRAINT FK_251 FOREIGN KEY ( employerId ) REFERENCES "User" ( email ),
 CONSTRAINT FK_254 FOREIGN KEY ( requestId ) REFERENCES AdvertiseRequest ( requestId )
);


CREATE TABLE checkedReportedAvertisements
(
 email           varchar(50) NOT NULL,
 advertisementId uuid NOT NULL,
 CONSTRAINT PK_341 PRIMARY KEY ( email, advertisementId ),
 CONSTRAINT FK_267 FOREIGN KEY ( email ) REFERENCES "User" ( email ),
 CONSTRAINT FK_271 FOREIGN KEY ( advertisementId ) REFERENCES Advertisement ( advertisementId )
);




CREATE INDEX fkIdx_277 ON "User"
(
 bannerAdminEmail
);


CREATE INDEX fkIdx_213 ON Company
(
 ownerEmail
);


CREATE INDEX fkIdx_207 ON Advertisement
(
 cmpanyId
);
CREATE INDEX fkIdx_210 ON Advertisement
(
 employerEmail
);


CREATE INDEX fkIdx_232 ON AdvertiseRequest
(
 advertisementId
);
CREATE INDEX fkIdx_242 ON AdvertiseRequest
(
 applicantEmail
);


CREATE INDEX fkIdx_253 ON RequestReview
(
 employerId
);
CREATE INDEX fkIdx_256 ON RequestReview
(
 requestId
);

CREATE INDEX fkIdx_269 ON checkedReportedAvertisements
(
 email
);

CREATE INDEX fkIdx_273 ON checkedReportedAvertisements
(
 advertisementId
);

