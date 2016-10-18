-- Group [Group]
create table "public"."group" (
   "oid_group"  int4  not null,
   "groupname"  varchar(255),
  primary key ("oid_group")
);


-- Module [Module]
create table "public"."module" (
   "oid_module"  int4  not null,
   "moduleid"  varchar(255),
   "modulename"  varchar(255),
  primary key ("oid_module")
);


-- User [User]
create table "public"."user" (
   "oid_user"  int4  not null,
   "username"  varchar(255),
   "password"  varchar(255),
   "name"  varchar(255),
   "payment_information"  varchar(255),
   "birthdate"  date,
  primary key ("oid_user")
);


-- Campaigner [ent1]
create table "public"."campaigner" (
   "user_oid_user"  int4  not null,
   "reputation"  int4,
  primary key ("user_oid_user")
);


-- Suppporter [ent2]
create table "public"."suppporter" (
   "user_oid_user"  int4  not null,
   "wisdom"  int4,
  primary key ("user_oid_user")
);


-- Campaign [ent3]
create table "public"."campaign" (
   "oid_campaign"  int4  not null,
   "title"  varchar(255),
   "quality"  int4,
   "popularity"  int4,
   "expiration"  timestamp,
   "goal"  int4,
   "description"  text,
  primary key ("oid_campaign")
);


-- Contribution [ent4]
create table "public"."contribution" (
   "oid_contribution"  int4  not null,
   "amount"  int4,
   "description"  text,
   "title"  varchar(255),
  primary key ("oid_contribution")
);


-- Answer [ent5]
create table "public"."answer" (
   "oid_answer"  int4  not null,
   "answer"  text,
  primary key ("oid_answer")
);


-- Question [ent6]
create table "public"."question" (
   "oid_question"  int4  not null,
   "question"  text,
  primary key ("oid_question")
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "public"."group"  add column  "module_oid_module"  int4;
alter table "public"."group"   add constraint fk_group_module foreign key ("module_oid_module") references "public"."module" ("oid_module");


-- Group_Module [Group2Module_Module2Group]
create table "public"."group_module" (
   "group_oid_group"  int4 not null,
   "module_oid_module"  int4 not null,
  primary key ("group_oid_group", "module_oid_module")
);
alter table "public"."group_module"   add constraint fk_group_module_group foreign key ("group_oid_group") references "public"."group" ("oid_group");
alter table "public"."group_module"   add constraint fk_group_module_module foreign key ("module_oid_module") references "public"."module" ("oid_module");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "public"."user"  add column  "group_oid_group"  int4;
alter table "public"."user"   add constraint fk_user_group foreign key ("group_oid_group") references "public"."group" ("oid_group");


-- User_Group [User2Group_Group2User]
create table "public"."user_group" (
   "user_oid_user"  int4 not null,
   "group_oid_group"  int4 not null,
  primary key ("user_oid_user", "group_oid_group")
);
alter table "public"."user_group"   add constraint fk_user_group_user foreign key ("user_oid_user") references "public"."user" ("oid_user");
alter table "public"."user_group"   add constraint fk_user_group_group foreign key ("group_oid_group") references "public"."group" ("oid_group");


-- Campaign_Contribution [rel1]
alter table "public"."contribution"  add column  "campaign_oid_campaign"  int4;
alter table "public"."contribution"   add constraint fk_contribution_campaign foreign key ("campaign_oid_campaign") references "public"."campaign" ("oid_campaign");


-- Suppporter_Contribution [rel2]
create table "public"."suppporter_contribution" (
   "suppporter_oid_user"  int4 not null,
   "contribution_oid_contribution"  int4 not null,
  primary key ("suppporter_oid_user", "contribution_oid_contribution")
);
alter table "public"."suppporter_contribution"   add constraint fk_suppporter_contribution_sup foreign key ("suppporter_oid_user") references "public"."suppporter" ("user_oid_user");
alter table "public"."suppporter_contribution"   add constraint fk_suppporter_contribution_con foreign key ("contribution_oid_contribution") references "public"."contribution" ("oid_contribution");


-- Campaigner_Campaign [rel3]
alter table "public"."campaign"  add column  "campaigner_oid_user"  int4;
alter table "public"."campaign"   add constraint fk_campaign_campaigner foreign key ("campaigner_oid_user") references "public"."campaigner" ("user_oid_user");


-- Campaigner_Answer [rel4]
alter table "public"."answer"  add column  "campaigner_oid_user"  int4;
alter table "public"."answer"   add constraint fk_answer_campaigner foreign key ("campaigner_oid_user") references "public"."campaigner" ("user_oid_user");


-- Answer_Question [rel5]
alter table "public"."answer"  add column  "question_oid_question"  int4;
alter table "public"."answer"   add constraint fk_answer_question foreign key ("question_oid_question") references "public"."question" ("oid_question");


-- Question_Suppporter [rel6]
alter table "public"."question"  add column  "suppporter_oid_user"  int4;
alter table "public"."question"   add constraint fk_question_suppporter foreign key ("suppporter_oid_user") references "public"."suppporter" ("user_oid_user");


-- Campaign_Question [rel7]
alter table "public"."question"  add column  "campaign_oid_campaign"  int4;
alter table "public"."question"   add constraint fk_question_campaign foreign key ("campaign_oid_campaign") references "public"."campaign" ("oid_campaign");


-- GEN FK: Campaigner --> User
alter table "public"."campaigner"   add constraint fk_campaigner_user foreign key ("user_oid_user") references "public"."user" ("oid_user");


-- GEN FK: Suppporter --> User
alter table "public"."suppporter"   add constraint fk_suppporter_user foreign key ("user_oid_user") references "public"."user" ("oid_user");


