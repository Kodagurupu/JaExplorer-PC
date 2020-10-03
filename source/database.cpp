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
