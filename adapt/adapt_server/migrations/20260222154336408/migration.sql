BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "drink_reference" ADD COLUMN "servingDescription" text;

--
-- Remove any drink_logs with old enum value 'whisky' to avoid deserialization errors.
--
DELETE FROM "drink_logs" WHERE "drinkType" = 'whisky';

--
-- Re-seed drink_reference with updated DrinkType enum values and serving descriptions.
-- Wipe existing rows first to handle removed enum values (whisky).
--
DELETE FROM "drink_reference";
INSERT INTO "drink_reference" ("drinkType", "caloriesPerUnit", "servingDescription") VALUES
    ('beer',        150, '33cl'),
    ('wine',        120, '15cl'),
    ('champagne',    90, '12cl'),
    ('cocktail',    180, '20cl'),
    ('spirit',       65, '4cl'),
    ('shooter',      50, '3cl'),
    ('liqueur',     100, '4cl'),
    ('longDrink',   150, '25cl'),
    ('hardSeltzer',  90, '33cl'),
    ('other',       120, NULL);

--
-- MIGRATION VERSION FOR adapt
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('adapt', '20260222154336408', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260222154336408', "timestamp" = now();

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
