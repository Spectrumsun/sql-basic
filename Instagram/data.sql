CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    photo_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE likes (
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE tags (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);


SELECT * FROM users ORDER BY created_at ASC LIMIT 5 ;

SELECT DAYNAME(created_at) AS day, COUNT(*) AS total FROM users GROUP BY day ORDER BY total DESC;

SELECT * FROM users;
SELECT * FROM photos;
SELECT * FROM likes;

SELECT username, image_url FROM users LEFT JOIN photos ON users.id = photos.user_id WHERE image_url.id IS NULL;

SELECT 
  users.id,
  username, 
  image_url,
  photos.user_id,
  likes.user_id,
  likes.photo_id,
  COUNT(*) AS total_likes
  FROM users
  JOIN photos ON users.id = photos.user_id
  JOIN likes on photos.id = likes.photo_id GROUP BY likes.photo_id ORDER BY total_likes DESC LIMIT 1;


SELECT 
  photos.id,
  photos.image_url,
  users.username,
  likes.photo_id,
  COUNT(*) AS total_likes 
  FROM likes
  JOIN photos ON likes.photo_id = photos.id
  JOIN users ON photos.user_id = users.id
  GROUP BY likes.photo_id
  ORDER BY total_likes DESC LIMIT 1;


SELECT 
    users.id, 
    username,
    photos.user_id,
    count(*) AS total_photos_upload
    FROM users
    JOIN photos ON users.id = photos.user_id
    GROUP BY photos.user_id;


SELECT 
    (SELECT COUNT(*) FROM photos) / 
    (SELECT COUNT(*) FROM users) AS 'Total Avrage';


SELECT * FROM tags photo_tags;


SELECT 
  tag_name,
  tag_id,
  COUNT(*) AS Top_HASH
  FROM tags
  JOIN photo_tags ON tags.id = photo_tags.tag_id
  GROUP BY tags.id
  ORDER BY Top_HASH DESC LIMIT 5;

SELECT 
    username,
    COUNT(*) AS num_likes
    FROM users
    JOIN likes ON users.id = likes.user_id
    GROUP BY likes.user_id
    HAVING num_likes = (SELECT COUNT(*) FROM photos);


