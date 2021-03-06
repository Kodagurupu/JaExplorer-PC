#ifndef SQLTABLES_H
#define SQLTABLES_H

#define FAVOURITES_TABLE "CREATE TABLE Favourites (id	INTEGER NOT NULL UNIQUE, title	TEXT NOT NULL, category	INTEGER NOT NULL, buyId	INTEGER NOT NULL, PRIMARY KEY(id AUTOINCREMENT) )""CREATE TABLE Favourites (id	INTEGER NOT NULL UNIQUE, title	TEXT NOT NULL, category	INTEGER NOT NULL, buyId	INTEGER NOT NULL, PRIMARY KEY(id AUTOINCREMENT) )"
#define KANA_TABLE "CREATE TABLE Kana ( id	INTEGER NOT NULL UNIQUE, japanese	TEXT NOT NULL, english	TEXT NOT NULL, russian	TEXT NOT NULL, url	TEXT NOT NULL, PRIMARY KEY(id AUTOINCREMENT) );"
#define KANJI_TABLE "CREATE TABLE Kanji ( id	INTEGER NOT NULL UNIQUE, level	TEXT NOT NULL, kanjya	TEXT NOT NULL, onPronunciation	TEXT, kunPronunciation	TEXT, photo	TEXT NOT NULL, favourite	INTEGER NOT NULL, PRIMARY KEY(id AUTOINCREMENT) );"
#define RADIO_TABLE "CREATE TABLE Radio ( id	INTEGER NOT NULL UNIQUE, url	TEXT NOT NULL, url_preview	TEXT NOT NULL, name	TEXT NOT NULL, favourite	INTEGER NOT NULL, PRIMARY KEY(id AUTOINCREMENT) );"
#define NEWS_TABLE "CREATE TABLE News (id	INTEGER NOT NULL UNIQUE, url TEXT NOT NULL, title	TEXT NOT NULL, news	TEXT NOT NULL, data	TEXT NOT NULL, favourite	INTEGER NOT NULL, PRIMARY KEY(id AUTOINCREMENT) );"
#define VIDEO_TABLE "CREATE TABLE Video ( id	INTEGER NOT NULL UNIQUE, url	TEXT NOT NULL, url_preview	TEXT, name	TEXT NOT NULL, favourite	INTEGER NOT NULL, PRIMARY KEY(id AUTOINCREMENT) );"
#define VIDEO_SUGGESTIONS "CREATE TABLE VideoSuggestions ( id	INTEGER NOT NULL UNIQUE, title	TEXT NOT NULL,, videoId	INTEGER NOT NULL UNIQUE, PRIMARY KEY(id AUTOINCREMENT) );"
#define WORDS_TABLE "CREATE TABLE Words ( id	INTEGER NOT NULL UNIQUE, japanese	TEXT NOT NULL, thisIsKana	TEXT, english	TEXT, russian	TEXT, favourite	INTEGER NOT NULL, PRIMARY KEY(id AUTOINCREMENT) );"

#endif // SQLTABLES_H
