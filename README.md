## postgres_training
PostgresSQLの練習

## 環境構築
```
  docker build -t image_name .
```

```
  docker run -d -p5432:5432 --name container_name -v /etc/data:/var/lib/postgresql/data image_name
```

## 起動
```
  docker exec -it container_name psql -U postgres_user -d test_db
```

## dump
```
  docker exec postgres_container pg_dump  --clean  --if-exists --schema-only -U postgres_user user_db > postgres.sql
```