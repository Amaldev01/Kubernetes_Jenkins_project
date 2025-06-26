FROM centos:7
MAINTAINER Amal.Dev@catalyzrs.com

# Install necessary packages: httpd for the web server, unzip for the archive, and curl for downloading
RUN yum install -y httpd unzip curl

WORKDIR /var/www/html/

# Use curl to download the zip, then unzip it, clean up the zip,
# move contents to the web root, and remove the temporary subdirectory.
# The '&& \' ensures that if any command fails, the whole RUN instruction fails.
RUN curl -o photogenic.zip http://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip && \
    unzip photogenic.zip && \
    rm photogenic.zip && \
    mv photogenic/* . && \
    rm -rf photogenic

# Command to run Apache HTTPD in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80


