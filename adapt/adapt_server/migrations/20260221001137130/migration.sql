BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "drink_logs" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "drink_logs" (
    "id" bigserial PRIMARY KEY,
    "userId" text NOT NULL,
    "loggedAt" timestamp without time zone NOT NULL,
    "drinkType" text NOT NULL,
    "quantity" bigint NOT NULL,
    "caloriesKcal" bigint NOT NULL
);

-- Indexes
CREATE INDEX "drink_logs_user_id_idx" ON "drink_logs" USING btree ("userId");
CREATE INDEX "drink_logs_logged_at_idx" ON "drink_logs" USING btree ("loggedAt");

--
-- ACTION DROP TABLE
--
DROP TABLE "drink_reference" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "drink_reference" (
    "id" bigserial PRIMARY KEY,
    "drinkType" text NOT NULL,
    "caloriesPerUnit" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "drink_reference_drink_type_unique_idx" ON "drink_reference" USING btree ("drinkType");

--
-- ACTION DROP TABLE
--
DROP TABLE "meal_logs" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "meal_logs" (
    "id" bigserial PRIMARY KEY,
    "userId" text NOT NULL,
    "loggedAt" timestamp without time zone NOT NULL,
    "mealType" text NOT NULL,
    "inputMethod" text NOT NULL,
    "rawInput" text,
    "imageUrl" text,
    "locationName" text,
    "estimated" boolean NOT NULL
);

-- Indexes
CREATE INDEX "meal_logs_user_id_idx" ON "meal_logs" USING btree ("userId");
CREATE INDEX "meal_logs_logged_at_idx" ON "meal_logs" USING btree ("loggedAt");

--
-- ACTION DROP TABLE
--
DROP TABLE "meal_results" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "meal_results" (
    "id" bigserial PRIMARY KEY,
    "mealLogId" bigint NOT NULL,
    "name" text NOT NULL,
    "caloriesKcal" bigint NOT NULL,
    "proteinG" double precision NOT NULL,
    "carbsG" double precision NOT NULL,
    "fatG" double precision NOT NULL,
    "aiMessage" text NOT NULL,
    "aiTip" text,
    "source" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "meal_results_meal_log_id_unique_idx" ON "meal_results" USING btree ("mealLogId");

--
-- ACTION DROP TABLE
--
DROP TABLE "user_profiles" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_profiles" (
    "id" bigserial PRIMARY KEY,
    "userId" text NOT NULL,
    "name" text,
    "isGuest" boolean NOT NULL,
    "age" bigint,
    "biologicalSex" text,
    "weightKg" double precision,
    "heightCm" double precision,
    "weightUnit" text NOT NULL,
    "heightUnit" text NOT NULL,
    "goal" text NOT NULL,
    "eatingStyle" text NOT NULL,
    "alcoholHabit" text NOT NULL,
    "alcoholTracking" boolean NOT NULL,
    "morningRecap" boolean NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "user_profiles_user_id_unique_idx" ON "user_profiles" USING btree ("userId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "meal_results"
    ADD CONSTRAINT "meal_results_fk_0"
    FOREIGN KEY("mealLogId")
    REFERENCES "meal_logs"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- SEED drink_reference (static, never modified at runtime)
-- Values match DrinkType enum names (serialized: byName)
--
INSERT INTO "drink_reference" ("drinkType", "caloriesPerUnit") VALUES
    ('beer',        150),
    ('wine',        120),
    ('champagne',    90),
    ('cocktail',    180),
    ('whisky',       70),
    ('longDrink',   200),
    ('hardSeltzer', 100)
ON CONFLICT ("drinkType") DO NOTHING;

--
-- MIGRATION VERSION FOR adapt
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('adapt', '20260221001137130', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260221001137130', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260129180959368', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129180959368', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260129181124635', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129181124635', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20260129181112269', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129181112269', "timestamp" = now();


COMMIT;
