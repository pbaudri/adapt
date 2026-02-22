BEGIN;

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
    "caloriesPerUnit" bigint NOT NULL,
    "servingDescription" text,
    "sortOrder" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "drink_reference_drink_type_unique_idx" ON "drink_reference" USING btree ("drinkType");

--
-- Re-seed drink_reference with sortOrder values (popularity order).
--
INSERT INTO "drink_reference" ("drinkType", "caloriesPerUnit", "servingDescription", "sortOrder") VALUES
    ('beer',        150, '33cl',  1),
    ('wine',        120, '15cl',  2),
    ('champagne',    90, '12cl',  3),
    ('cocktail',    180, '20cl',  4),
    ('longDrink',   150, '25cl',  5),
    ('hardSeltzer',  90, '33cl',  6),
    ('spirit',       65, '4cl',   7),
    ('liqueur',     100, '4cl',   8),
    ('shooter',      50, '3cl',   9),
    ('other',       120, NULL,   10);

--
-- MIGRATION VERSION FOR adapt
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('adapt', '20260222155928716', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260222155928716', "timestamp" = now();

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
