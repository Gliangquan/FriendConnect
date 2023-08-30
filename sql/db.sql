-- auto-generated definition
create table user
(
    username     varchar(256)                       null comment '用户昵称',
    id           bigint auto_increment comment 'id' primary key,
    userAccount  varchar(256)                       null comment '账号',
    avatarUrl    varchar(1024)                      null comment '用户头像',
    gender       tinyint                            null comment '性别',
    userPassword varchar(512)                       not null comment '密码',
    phone        varchar(128)                       null comment '电话',
    email        varchar(512)                       null comment '邮箱',
    userStatus   int      default 0                 not null comment '状态 0 - 正常',
    userRole     int      default 0                 not null comment '用户角色 0 - 普通用户 1 - 管理员',
    tags         varchar(512)                       null comment '个人标签(数组)',
    profile      varchar(512)                       null comment '个人简介',
    createTime   datetime default CURRENT_TIMESTAMP null comment '创建时间',
    updateTime   datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    isDelete     tinyint  default 0                 not null comment '是否删除'
)
    comment '用户';

-- 清空表数据（可选）
TRUNCATE TABLE user;

-- 插入模拟数据
INSERT INTO user (username, userAccount, avatarUrl, gender, userPassword, phone, email, userStatus, userRole, tags, profile, createTime, updateTime, isDelete)
SELECT
    CONCAT('User', id) AS username,
    CONCAT('account', id) AS userAccount,
    CONCAT('avatar', id) AS avatarUrl,
    FLOOR(RAND()*2) AS gender,
    CONCAT('password', id) AS userPassword,
    CONCAT('phone', id) AS phone,
    CONCAT('email', id, '@example.com') AS email,
    0 AS userStatus,
    FLOOR(RAND()*2) AS userRole,
    CONCAT('tag', id) AS tags,
    CONCAT('Profile', id) AS profile,
    NOW() - INTERVAL FLOOR(RAND()*365) DAY AS createTime,
    NOW() - INTERVAL FLOOR(RAND()*365) DAY AS updateTime,
    0 AS isDelete
FROM
    (SELECT @rownum:=@rownum+1 AS id
     FROM
         (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL
          SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t1,
         (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL
          SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t2,
         (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL
          SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t3,
         (SELECT @rownum:=0) t4) nums
WHERE
        id <= 30;

