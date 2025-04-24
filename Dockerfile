FROM nginx:latest

# Install unzip
RUN apt-get update && \
    apt-get install -y unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set work directory to a temporary folder
WORKDIR /usr/share/nginx/html/

# Download and extract the website template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/neogym.zip .

# Unzip the file

RUN unzip -q neogym.zip


# Copy contents to NGINX html folder
RUN cp -rvf neogym-html/* . 
RUN rm -rf neogym-html neogym.zip

# Expose port 80 for HTTP traffic
EXPOSE 80 22

# Default NGINX command
CMD ["nginx", "-g", "daemon off;"]
