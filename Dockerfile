FROM mcr.microsoft.com/dotnet/core/sdk:2.1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        default-jre \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && dotnet tool install -g dotnet-sonarscanner --version 4.6.2

ENV PATH="/root/.dotnet/tools:${PATH}" \
    ESTAFETTE_EXTENSION_PROJECT_KEY="" \
    ESTAFETTE_EXTENSION_SONAR_HOST=""

CMD dotnet sonarscanner begin /k:"${ESTAFETTE_EXTENSION_PROJECT_KEY}" /v:"${ESTAFETTE_BUILD_VERSION}" /d:sonar.host.url=${ESTAFETTE_EXTENSION_SONAR_HOST}; \
    dotnet build --configuration Debug --version-suffix ${ESTAFETTE_BUILD_VERSION} --no-restore; \
    dotnet sonarscanner end