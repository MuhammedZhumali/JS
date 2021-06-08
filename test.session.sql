DROP TABLE IF EXISTS Companies;
CREATE TABLE Companies(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    company_name TEXT NOT NULL
);
DROP TABLE IF EXISTS Users;
CREATE TABLE Users(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    salary DECIMAL CHECK(salary >= 100),
    image_path TEXT,
    companies_id INTEGER NOT NULL,
    FOREIGN KEY (companies_id) REFERENCES Companies(id)
);
DROP TABLE IF EXISTS Posts;
CREATE TABLE Posts(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);
-- Companies
INSERT INTO Companies (company_name)
VALUES ('Google');
--Users
INSERT INTO Users (first_name, salary, image_path, companies_id)
VALUES (
        'Alex',
        80000,
        'https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fphotos%2F763-mBawsfg&psig=AOvVaw0TQrc_3m4Itpw5Zurfq2vS&ust=1622820247380000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKi97dbi-_ACFQAAAAAdAAAAABAD',
        1
    ),
    (
        'Bob',
        80000,
        'https://images.unsplash.com/photo-1591258739299-5b65d5cbb235?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bWFuJTIwZmFjZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80',
        1
    ),
    (
        'Marly',
        80000,
        'https://www.uni-regensburg.de/Fakultaeten/phil_Fak_II/Psychologie/Psy_II/beautycheck/english/prototypen/m_sexy_gr.jpg',
        1
    );
--Posts
INSERT INTO Posts (title, content, user_id)
VALUES (
        'Ghosts among us',
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
        1
    ),
    (
        'Why?',
        'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using.',
        1
    ),
    (
        'My Main Reason',
        'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia.',
        1
    ),
    (
        'I Like...',
        'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable',
        2
    ),
    (
        'Standarts',
        'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from',
        2
    );
	
INSERT INTO Users (first_name, salary, image_path, companies_id)
VALUES (
        'Jack',
        80000,
        'https://www.uni-regensburg.de/Fakultaeten/phil_Fak_II/Psychologie/Psy_II/beautycheck/english/prototypen/m_sexy_gr.jpg',
        1
    );