# Spelbibliotek

SQL Server-projekt med spel och deras utvecklare. Övning i att koppla ihop tabeller.

## Tabeller

- **Utvecklare:** Id, Namn, Land, Grundat
- **Spel:** Id, Titel, Genre, Utgivningsår, UtvecklareId

`UtvecklareId` i `Spel` är en FOREIGN KEY som pekar på `Utvecklare`. Ett spel har en utvecklare, och en utvecklare kan ha många spel.

## Köra projektet

Öppna `Spelbibliotek.sql` i SSMS och kör hela filen en gång. Frågorna längst ner är utkommenterade, ta bort `--` framför den du vill köra.

## Exempelfråga

```sql
SELECT U.Namn, COUNT(S.Id) AS AntalSpel
FROM Spel S
JOIN Utvecklare U ON S.UtvecklareId = U.Id
GROUP BY U.Namn
ORDER BY AntalSpel DESC
```
