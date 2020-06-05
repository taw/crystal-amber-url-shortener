-- +micrate Up
CREATE TABLE shortcuts (
  id BIGSERIAL PRIMARY KEY,
  slug VARCHAR,
  url VARCHAR,
  visits INT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS shortcuts;
