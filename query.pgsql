/* データベース一覧*/
SELECT datname FROM pg_database;

-- スキーマ作成
DROP SCHEMA IF EXISTS user_db CASCADE;
CREATE SCHEMA user_db;

-- DB作成
CREATE DATABASE user_db

-- テーブル作成
CREATE TABLE user_db.users (
  user_id SERIAL,
  name varchar(255) NOT NULL DEFAULT '',
  created TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON COLUMN user_db.users.user_id IS 'ユーザーID';
COMMENT ON COLUMN user_db.users.name IS '名前';
COMMENT ON COLUMN user_db.users.created IS '作成日時';
COMMENT ON COLUMN user_db.users.updated IS '更新日時';

-- トリガー作成
CREATE FUNCTION set_update_time() RETURNS trigger AS '
  begin
    new.updated := ''now'';
    return new;
  end;
' LANGUAGE plpgsql;

CREATE TRIGGER trigger_uu_updated BEFORE UPDATE ON user_db.users FOR EACH ROW EXECUTE PROCEDURE set_update_time();

-- SHOW CREATE TABLE
docker exec postgres_container pg_dump  --clean  --if-exists --schema-only -U postgres_user user_db > postgres.sql