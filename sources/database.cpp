#include "database.h"

Database::Database(QObject *parent) : QObject(parent)
{
    connect(this, &Database::reciveMessage, &console, &MessageService::reciveMessage);
    db.setDatabaseName("database.sqlite");
    checkDatabase();
}

QJsonArray Database::getKana()
{
    QJsonArray kanaSymbols;

    if (!db.open())
        emit reciveMessage("[DATABASE ERROR]: " + db.lastError().text());

    QSqlQuery query;

    query.exec("select * from Kana");

    while (query.next())
    {
        QJsonObject tempKana;

        tempKana["id"] = query.value(0).toInt();
        tempKana["hiragana"] = query.value(1).toString();
        tempKana["katakana"] = query.value(2).toString();
        tempKana["pronunciation"] = query.value(3).toString();

        kanaSymbols.append(tempKana);
    }

    db.close();

    return kanaSymbols;
}

QJsonArray Database::getRadio()
{
    QJsonArray radioStations;

    if (!db.open())
        emit reciveMessage("[DATABASE ERROR]: " + db.lastError().text());

    QSqlQuery query;

    query.exec("select * from Radio");

    while (query.next())
    {
        QJsonObject tempRadio;

        tempRadio["id"] = query.value(0).toInt();
        tempRadio["url"] = query.value(1).toString();
        tempRadio["preview_url"] = query.value(2).toString();
        tempRadio["title"] = query.value(3).toString();
        tempRadio["site"] = query.value(4).toString();
        tempRadio["isFavourite"] = query.value(5).toBool();

        radioStations.append(tempRadio);
    }

    db.close();

    return radioStations;
}

void Database::checkDatabase()
{
    if (!db.open())
        emit reciveMessage("[DATABASE ERROR]: " + db.lastError().text());

    QSqlQuery query;

    if (!db.contains(QLatin1String("News")))
        query.exec(NEWS_TABLE);

    if (!db.contains(QLatin1String("SavedWords")))
        query.exec(SAVEDWORDS_TABLE);

    if (!db.contains(QLatin1String("Favourites")))
        query.exec(FAVOURITES_TABLE);

    if (!db.contains(QLatin1String("Kana")))
        query.exec(KANA_TABLE);

    if (!db.contains(QLatin1String("Kanji")))
        query.exec(KANJI_TABLE);

    if (!db.contains(QLatin1String("Video")))
        query.exec(VIDEO_TABLE);

    if (!db.contains(QLatin1String("Radio")))
        query.exec(RADIO_TABLE);

    db.close();
}
