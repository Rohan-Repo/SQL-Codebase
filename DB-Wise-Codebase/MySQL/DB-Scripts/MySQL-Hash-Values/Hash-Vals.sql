SELECT 'Toronto', 
MD5('Toronto') AS md5City,
SHA1('Toronto') AS sha1City, 
SHA2('Toronto',224) AS sha224City, 
SHA2('Toronto',256) AS sha256City, 
SHA2('Toronto',384) AS sha384City, 
SHA2('Toronto',512) AS sha512City;