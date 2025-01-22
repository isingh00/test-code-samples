FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

# Install general dependencies for all languages and tools
RUN apt-get update -y && \
    apt-get upgrade -y && \
    echo "Package list updated" && \
    apt-get install -y \
    curl \
    build-essential \
    openjdk-11-jdk \
    php-cli \
    php-curl \
    php-mbstring \
    php-xml \
    php-zip \
    php-soap \
    php-json \
    ruby \
    mono-complete \
    git \
    wget \
    unzip \
    ca-certificates \
    maven \
    software-properties-common \
    apt-transport-https \
    python3 \
    python3-venv \
    python3-dev \
    gettext && \
    apt-get clean && \
    echo "Apt-get clean completed" && \
    # Clean up apt cache and list
    rm -rf /var/lib/apt/lists/*
 
# Add Node.js v20
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add python3 and pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py

# Add dotnet sdk v6
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/prod.list -O /etc/apt/sources.list.d/microsoft-prod.list && \
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add - && \
    apt-get update && apt-get install -y dotnet-sdk-6.0 && \
    apt-get clean

# Add go v1.22.2
RUN curl -fsSL https://golang.org/dl/go1.22.2.linux-amd64.tar.gz -o go1.22.2.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.22.2.linux-amd64.tar.gz && \
    rm go1.22.2.linux-amd64.tar.gz

 
# Set GO PATH
ENV PATH="/usr/local/go/bin:${PATH}"

# Set up the working directory 
WORKDIR /code

# Copy source code into container
COPY code/ /code/

# Set env variables
ARG API_KEY
ENV API_KEY=${API_KEY}
ARG YOUR_DOMAIN 
ENV YOUR_DOMAIN=${YOUR_DOMAIN}
ARG API_BASE_URL
ENV API_BASE_URL=${API_BASE_URL}
ARG USER_NAME 
ENV USER_NAME=${USER_NAME}
ARG USER_EMAIL 
ENV USER_EMAIL=${USER_EMAIL}
ARG TEMPLATE_NAME
ENV TEMPLATE_NAME=${TEMPLATE_NAME}

# Replace ${placeholder} vars with real values
COPY replace-vars.sh /usr/local/bin/replace-vars.sh
RUN chmod +x /usr/local/bin/replace-vars.sh
RUN /usr/local/bin/replace-vars.sh

#Install dependencies and run sample code for all projects
RUN echo "Running C# samples...." && \
    cd /code/csharp && \
    dotnet restore MyProject.csproj && \
    dotnet build MyProject.csproj && \
    dotnet run

RUN echo "Running cURL samples..." && \
    chmod -R +x /code/curl/ && \
    /code/curl/script.sh

RUN echo "Running Go samples..." && \
    cd /code/go && \
    go mod tidy && \
    go run -v main.go

RUN echo "Running Java samples..." && \
    cd /code/java/my-app-main && \
    mvn clean install && \
    mvn dependency:copy-dependencies && \
    java -cp "target/classes:target/dependency/*" com.mycompany.app.App

RUN echo "Running Node.js samples..." && \
    node -v && \
    npm -v && \
    cd /code/node && \
    npm install && \
    npm run start

RUN echo "Running PHP samples..." && \
    cd /code/php/sample-project && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin && \
    ln -s /usr/local/bin/composer.phar /usr/local/bin/composer && \
    composer install && \
    php src/SampleProject/script.php

RUN echo "Running Python samples..." && \
    cd /code/python && \
    python3 -m pip install --upgrade pip && \
    pip install -r requirements.txt && \
    python3 main.py

RUN echo "Running Ruby samples..." && \
    cd /code/ruby && \
    gem install bundler -v 2.4.22 && \
    bundle install && \
    ruby app.rb

RUN echo "Finished"
CMD ["bash"]
