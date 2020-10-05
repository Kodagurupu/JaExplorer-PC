/*
 * Include local libs
 */
#include "database.h"

Database::Database(QObject *parent)
    : QObject(parent)
{
    /*
     * Init message service
     */
    connect(this, &Database::reciveMessage, &console, &MessageService::reciveMessage);

    /*
     * Open database
     */
    db.setDatabaseName("data.bin");

    /*
     * Check for unexisting tables
     */
    checkDatabase();
}

QJsonArray Database::getRadio()
{
    QJsonArray radioStations;

    if (!db.open())
        emit reciveMessage("[DATABASE]" + db.lastError().text());

    QSqlQuery query;

    query.exec("select * from Radio");

    while (query.next())
    {
        QJsonObject temp;
        temp["id"] = query.value(0).toInt();
        temp["url"] = query.value(1).toString();
        temp["preview"] = query.value(2).toString();
        temp["name"] = query.value(3).toString();
        temp["favourite"] = query.value(4).toBool();
        radioStations.append(temp);
    }

    return radioStations;
}

void Database::checkDatabase()
{
    if (!db.open())
        emit reciveMessage("[DATABASE]" + db.lastError().text());

    QSqlQuery query;

    /*
     * Creating unexisting tables
     */

    if (!db.contains(QLatin1String("Favourites")))
        query.exec(FAVOURITES_TABLE);

    if (!db.contains(QLatin1String("Kana")))
        query.exec(KANA_TABLE);

    if (!db.contains(QLatin1String("Kanji")))
        query.exec(KANJI_TABLE);

    if (!db.contains(QLatin1String("Radio")))
        query.exec(RADIO_TABLE);

    if (!db.contains(QLatin1String("News")))
        query.exec(NEWS_TABLE);

    if (!db.contains(QLatin1String("Video")))
        query.exec(VIDEO_TABLE);

    if (!db.contains(QLatin1String("VideoSuggestions")))
        query.exec(VIDEO_SUGGESTIONS);

    if (!db.contains(QLatin1String("Words")))
        query.exec(WORDS_TABLE);
}
