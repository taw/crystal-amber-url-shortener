-- +micrate Up
CREATE TABLE shortcuts (
  id BIGSERIAL PRIMARY KEY,
  slug VARCHAR UNIQUE NOT NULL,
  url VARCHAR UNIQUE NOT NULL,
  visits INT NOT NULL DEFAULT 0,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS shortcuts;
