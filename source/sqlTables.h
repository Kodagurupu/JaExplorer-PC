#pragma once

#define NEWS_TABLE "CREATE TABLE News (url TEXT NOT NULL, title	TEXT NOT NULL, news	TEXT NOT NULL, data	TEXT NOT NULL, isFavourite	INTEGER NOT NULL DEFAULT 0);"
#define WORDS_TABLE "CREATE TABLE Words (japanese	TEXT NOT NULL, kana_symbol	TEXT, english	TEXT, russian	TEXT, isFavourite	INTEGER NOT NULL DEFAULT 0);"
#define FAVOURITES_TABLE "CREATE TABLE Favourites (id	INTEGER NOT NULL UNIQUE, title	TEXT NOT NULL, category	INTEGER NOT NULL);"
#define KANA_TABLE "CREATE TABLE Kana (japanese	TEXT NOT NULL, english	TEXT NOT NULL, url	TEXT NOT NULL);"
#define KANJI_TABLE "CREATE TABLE Kanji (level	TEXT NOT NULL, symbol	TEXT NOT NULL, onPronunciation	TEXT, kunPronunciation	TEXT, photo	TEXT NOT NULL, isFavourite	INTEGER NOT NULL DEFAULT 0);"
#define VIDEO_TABLE "CREATE TABLE Video (url	TEXT NOT NULL, url_preview	TEXT, name	TEXT NOT NULL, isFavourite	INTEGER NOT NULL DEFAULT 0);"
#define RADIO_TABLE "CREATE TABLE Radio (url	TEXT NOT NULL, image_url	TEXT NOT NULL, title	TEXT NOT NULL, site	TEXT NOT NULL, isFavourite	INTEGER NOT NULL DEFAULT 0);"
