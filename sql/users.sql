
-- 创建user 数据表
CREATE TABLE `users` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `privilege` BOOLEAN NOT NULL DEFAULT FALSE ,
  `email` VARCHAR(255) NOT NULL,
  `collections` VARCHAR(255) NOT NULL,
  `friends` VARCHAR(255) NOT NULL,
  `recentSignUp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `signature`  VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

INSERT INTO `users` (id, name, password,privilege, email, collections, friends,recentSignUp,signature) VALUES
  (1,'Admin','123456',TRUE ,'admin@museum.com','','',CURRENT_TIMESTAMP,'123456');