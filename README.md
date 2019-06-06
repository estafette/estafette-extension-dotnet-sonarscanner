
To run sonarqube analysis for your project use the following stage in your estafette manifest:

```yaml
  sonarqube:
    image: extensions/dotnet-sonarscanner:2.2-alpine
    project-key: my-project-key
    sonar-host: https://sonarqube.mycompany.com
```

For the tag use the corresponding .net core sdk version. The following ones are available:

- 2.2-alpine
- 2.2
- 2.1-alpine
- 2.1