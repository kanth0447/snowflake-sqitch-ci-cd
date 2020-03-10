-- Verify flipr:users on snowflake

USE WAREHOUSE &COMPUTE_WH;
SELECT nickname, password, fullname, twitter, timestamp
  FROM flipr.users
WHERE FALSE;
