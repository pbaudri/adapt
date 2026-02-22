BEGIN;

--
-- DATA CLEANUP — remove empty daily_summary rows created by the broken
-- incremental upsert logic (getOrCreate was called on every getDayDetail
-- request, producing zero-kcal rows with no real data).
--
DELETE FROM "daily_summaries"
WHERE "totalKcal" = 0
  AND "mealEmojis" = '[]'
  AND "hadAlcohol" = false;

--
-- MIGRATION VERSION FOR adapt
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('adapt', '20260222190000000', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260222190000000', "timestamp" = now();

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
