# Weather App 90min challenge

## Beskrivning

En enkel väderapp byggd med Flutter med fokus på Clean Architecture, state management med Cubit, samt API-integration med möjlighet att uppdatera data via en refresh-knapp.

## Funktioner

- Sök väder för olika städer
- Visa aktuell plats, temperatur, beskrivning och ikon
- Uppdatera väderdata med refresh-knapp

## Arkitektur

- Clean Architecture

## State Management

- Cubit från flutter_bloc för att hantera state och logik

## Användning

1. Klona repot
2. Lägg till din API-nyckel i [`lib/core/utils/api_key.dart`](lib/core/utils/api_key.dart) från [weatherapi.com](https://www.weatherapi.com)


3. Kör appen

## Paket

- flutter_bloc
- dio
- equatable

---

Byggd som en övning i Clean Architecture och Cubit.
