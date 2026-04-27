# 1. DAS FUNDAMENT
# Wir nutzen PHP 8.2 mit dem Apache Webserver. 
# Das "bookworm"-Tag sorgt für eine stabile, aktuelle Debian-Basis.
FROM php:8.2-apache

# 2. SYSTEM-VORBEREITUNG UND REINIGUNG
# Wir aktualisieren die Paketliste und installieren Erweiterungen in EINEM Rutsch.
# Das hält das Image klein, da keine unnötigen Cache-Daten gespeichert werden.
RUN apt-get update && apt-get install -y \
    libmariadb-dev \
    && docker-php-ext-install mysqli pdo_mysql \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 3. APACHE KONFIGURATION
# Aktiviert das Modul 'mod_rewrite' – essenziell für WordPress (Permalinks) 
# und moderne PHP-Anwendungen.
RUN a2enmod rewrite
# Erhöht das Upload-Limit für WordPress-Medien
# RUN echo "upload_max_filesize = 64M\npost_max_size = 64M" > /usr/local/etc/php/conf.d/uploads.ini
# 4. ARBEITSVERZEICHNIS (Optional, aber guter Stil)
# Setzt den Fokus von Docker direkt auf das Web-Verzeichnis.
WORKDIR /var/www/html

# 5. RECHTE-MANAGEMENT
# Wir geben dem User 'www-data' (der Apache-User) die Rechte am Ordner.
# Das -R sorgt dafür, dass auch alle Unterordner eingeschlossen sind.
RUN chown -R www-data:www-data /var/www/html